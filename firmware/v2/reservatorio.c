/*
 * Saneamento: Controle de Reservatorio de Agua com PIC18F4550
 * Projeto Final - Etapa 1 - GCET1029 Sistemas Microcontrolados - UFRB
 *
 * Compilador : MPLAB XC8 v2.x   (xc8-cc -mcpu=18F4550 ...)
 * Alvo       : PICSimLab, placa "PICGenios" (PIC18F4550) e kit fisico
 *
 * Mapa de pinos:
 *   Potenciometro 1 (nivel) ...... RA0/AN0   ADC 10 bits
 *   Rele 1 (bomba) ............... RC0
 *   Buzzer ....................... RC1/CCP2 (PWM gera tons de varias frequencias)
 *   LED bomba ligada ............. RB4
 *   LED alarme ................... RB5
 *   S1 (modo AUTO/MANUAL) ........ RB0/INT0
 *   S2 (bomba manual) ............ RB1/INT1
 *   S3 (reconhece alarme) ........ RB2/INT2
 *   LCD 16x2 (8 bits) ............ RD0-RD7, EN=RE1, RS=RE2
 *   Timer0 ....................... tick de 10 ms
 *
 * Controle: nivel <= 25 % liga a bomba, >= 85 % desliga (histerese).
 * Alarmes : CRITICO (<= 10 %), TRANSBORDAMENTO (>= 95 %) e FALHA DA BOMBA.
 */

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

/* ===================== CONFIGURACAO ================== */
#define _XTAL_FREQ      8000000UL   /* confirme o oscilador da placa/simulador  */
#define BTN_AUTODETECT  1           /* 1: descobre a polaridade lendo RB0-RB2 no */
                                    /*    boot (botoes soltos, nao segure nada!) */
#define BTN_ATIVO_ALTO  1           /* usado so se BTN_AUTODETECT = 0:           */
                                    /* 1: pressionado = nivel alto (RB=1)        */
                                    /* 0: pressionado = nivel baixo              */
#define USE_UART        1           /* 1: log serial 9600 8N1 a cada 1 s        */
#define UART_BAUD       9600UL

/* Regras de controle  */
#define NIVEL_LIGA          25      /* % : liga a bomba                         */
#define NIVEL_DESLIGA       85      /* % : desliga a bomba                      */
#define NIVEL_CRITICO       10      /* % : alarme critico                       */
#define NIVEL_TRANSB        95      /* % : alarme de transbordamento            */
#define ALTURA_CM           200     /* 100 % = 200 cm (slide 6)                 */

/* Falha da bomba: bomba ligada e o nivel nao sobe SUBIDA_MIN % em JANELA */
#define FALHA_JANELA        50      /* amostras de 100 ms = 5 s (demo)          */
#define FALHA_SUBIDA_MIN    2       /* % minimo de subida na janela             */

/* Tempos (slide 6) */
#define TICK_MS             10
#define AMOSTRA_TICKS       10      /* 100 ms : leitura ADC + controle          */
#define LCD_TICKS           20      /* 200 ms : atualiza display                */
#define DEBOUNCE_TICKS      5       /* 50 ms                                    */

/* Bits de configuracao do PIC18F4550 */
#pragma config PLLDIV = 1, CPUDIV = OSC1_PLL2, USBDIV = 1
#pragma config FOSC = HS, FCMEN = OFF, IESO = OFF
#pragma config PWRT = OFF, BOR = OFF, VREGEN = OFF
#pragma config WDT = OFF, WDTPS = 32768
#pragma config PBADEN = OFF, MCLRE = ON, LPT1OSC = OFF, CCP2MX = ON
#pragma config STVREN = ON, LVP = OFF, XINST = OFF, DEBUG = OFF

/* ============================== PINOS ===================================== */
#define PUMP_LAT    LATCbits.LATC0
#define BUZ_LAT     LATCbits.LATC1
#define LED_PUMP    LATBbits.LATB4
#define LED_ALM     LATBbits.LATB5
#define LCD_EN      LATEbits.LATE1
#define LCD_RS      LATEbits.LATE2
#define LCD_DATA    LATD

/* Mascara de alarmes */
#define ALM_CRIT    0x01
#define ALM_OVER    0x02
#define ALM_FAULT   0x04

/* Timer0: 16 bits, prescaler 1:8 -> tick de 10 ms */
#define T0_PRESET   ((uint16_t)(65536UL - (_XTAL_FREQ / 4UL / 8UL / (1000UL / TICK_MS))))

/* ============================ VARIAVEIS =================================== */
/* Compartilhadas com a ISR */
static volatile uint8_t ticks = 0;        /* ticks de 10 ms pendentes           */
static volatile uint8_t evt_mode = 0;     /* S1 pressionado                     */
static volatile uint8_t evt_pump = 0;     /* S2 pressionado                     */
static volatile uint8_t evt_ack  = 0;     /* S3 pressionado                     */
static volatile uint8_t deb[3] = {0, 0, 0};

/* Estado do sistema (somente laco principal) */
static bool     auto_mode = true;
static bool     pump_on   = false;
static bool     fault     = false;        /* falha da bomba (travada ate S3)    */
static uint8_t  alarms    = 0;
static uint8_t  ack_mask  = 0;            /* alarmes ja reconhecidos            */
static uint8_t  level_pct = 0;
static uint16_t level_cm  = 0;
static uint8_t  fault_ref = 0;
static uint8_t  fault_cnt = 0;
static uint8_t  phase     = 0;            /* fase do pisca (a cada 100 ms)      */

/* =============================== ISR ====================================== */
void __interrupt() isr(void)
{
    /* Timer0: base de tempo de 10 ms e fim do debounce */
    if (INTCONbits.TMR0IE && INTCONbits.TMR0IF) {
        INTCONbits.TMR0IF = 0;
        TMR0H = (uint8_t)(T0_PRESET >> 8);      /* escrever TMR0H antes de TMR0L */
        TMR0L = (uint8_t)(T0_PRESET & 0xFF);
        if (ticks < 250) ticks++;

        if (deb[0] && --deb[0] == 0) { INTCONbits.INT0IF = 0;  INTCONbits.INT0IE = 1; }
        if (deb[1] && --deb[1] == 0) { INTCON3bits.INT1IF = 0; INTCON3bits.INT1IE = 1; }
        if (deb[2] && --deb[2] == 0) { INTCON3bits.INT2IF = 0; INTCON3bits.INT2IE = 1; }
    }

    /* S1: troca de modo. Desabilita a propria INT ate o debounce acabar */
    if (INTCONbits.INT0IE && INTCONbits.INT0IF) {
        INTCONbits.INT0IF = 0;
        INTCONbits.INT0IE = 0;
        deb[0] = DEBOUNCE_TICKS;
        evt_mode = 1;
    }
    /* S2: bomba manual */
    if (INTCON3bits.INT1IE && INTCON3bits.INT1IF) {
        INTCON3bits.INT1IF = 0;
        INTCON3bits.INT1IE = 0;
        deb[1] = DEBOUNCE_TICKS;
        evt_pump = 1;
    }
    /* S3: reconhece alarme */
    if (INTCON3bits.INT2IE && INTCON3bits.INT2IF) {
        INTCON3bits.INT2IF = 0;
        INTCON3bits.INT2IE = 0;
        deb[2] = DEBOUNCE_TICKS;
        evt_ack = 1;
    }
}

/* ================================ LCD ===================================== */
static void lcd_pulse(void)
{
    LCD_EN = 1; __delay_us(5);
    LCD_EN = 0; __delay_us(60);
}

static void lcd_cmd(uint8_t c)
{
    LCD_RS = 0;
    LCD_DATA = c;
    lcd_pulse();
    if (c <= 0x03) __delay_ms(3);       /* clear / home sao lentos */
}

static void lcd_putc(char c)
{
    LCD_RS = 1;
    LCD_DATA = (uint8_t)c;
    lcd_pulse();
}

static void lcd_init(void)
{
    LCD_EN = 0; LCD_RS = 0;
    __delay_ms(40);
    LCD_DATA = 0x38; lcd_pulse(); __delay_ms(5);
    LCD_DATA = 0x38; lcd_pulse(); __delay_ms(1);
    LCD_DATA = 0x38; lcd_pulse(); __delay_ms(1);
    lcd_cmd(0x38);      /* 8 bits, 2 linhas, 5x8  */
    lcd_cmd(0x0C);      /* display on, cursor off */
    lcd_cmd(0x06);      /* incrementa cursor      */
    lcd_cmd(0x01);      /* limpa                  */
}

static void lcd_line(uint8_t row, const char *s)   /* escreve 16 caracteres */
{
    lcd_cmd(row ? 0xC0 : 0x80);
    for (uint8_t i = 0; i < 16; i++) lcd_putc(s[i]);
}

static void fmt3(char *p, uint16_t v)
{
    p[0] = (char)('0' + (v / 100) % 10);
    p[1] = (char)('0' + (v / 10) % 10);
    p[2] = (char)('0' + v % 10);
}

static void alarm_text(char *p)   /* 5 caracteres */
{
    const char *t = "OK   ";
    if      (alarms & ALM_FAULT) t = "FALHA";
    else if (alarms & ALM_OVER)  t = "TRANS";
    else if (alarms & ALM_CRIT)  t = "CRIT ";
    for (uint8_t i = 0; i < 5; i++) p[i] = t[i];
}

static void lcd_refresh(void)
{
    char l1[17] = "Nivel:000% 000cm";
    char l2[17] = "AUTO B:OFF      ";

    fmt3(&l1[6], level_pct);
    fmt3(&l1[11], level_cm);

    /* linha 2: "AUTO B:ON  !FALHA" -> modo, bomba, '!' se alarme nao reconhecido, texto */
    const char *m = auto_mode ? "AUTO" : "MAN ";
    for (uint8_t i = 0; i < 4; i++) l2[i] = m[i];
    l2[4] = ' '; l2[5] = 'B'; l2[6] = ':';
    l2[7] = 'O';
    l2[8] = pump_on ? 'N' : 'F';
    l2[9] = pump_on ? ' ' : 'F';
    l2[10] = (alarms & (uint8_t)~ack_mask) ? '!' : ' ';
    alarm_text(&l2[11]);

    lcd_line(0, l1);
    lcd_line(1, l2);
}

/* ================================ ADC ===================================== */
static uint16_t adc_read_once(void)
{
    __delay_us(20);                     /* aquisicao */
    ADCON0bits.GO_nDONE = 1;
    while (ADCON0bits.GO_nDONE) { }
    return (uint16_t)(((uint16_t)ADRESH << 8) | ADRESL);
}

static void sample_level(void)
{
    uint16_t sum = 0;
    for (uint8_t i = 0; i < 4; i++) sum += adc_read_once();   /* media de 4 */
    uint16_t adc = sum >> 2;                                  /* 0..1023   */
    level_pct = (uint8_t)(((uint32_t)adc * 100UL + 511UL) / 1023UL);
    level_cm  = (uint16_t)(((uint32_t)adc * ALTURA_CM + 511UL) / 1023UL);
}

/* ================================ UART ==================================== */
#if USE_UART
static void uart_putc(char c) { while (!PIR1bits.TXIF) { } TXREG = (uint8_t)c; }
static void uart_puts(const char *s) { while (*s) uart_putc(*s++); }
static void uart_num3(uint16_t v)
{
    char b[3]; fmt3(b, v);
    uart_putc(b[0]); uart_putc(b[1]); uart_putc(b[2]);
}
static void uart_log(void)
{
    uart_puts("Nivel="); uart_num3(level_pct); uart_puts("% ");
    uart_num3(level_cm);  uart_puts("cm Bomba=");
    uart_puts(pump_on ? "ON " : "OFF");
    uart_puts(" Modo="); uart_puts(auto_mode ? "AUTO" : "MAN ");
    uart_puts(" Alarme=");
    if (!alarms) uart_puts("nenhum");
    if (alarms & ALM_CRIT)  uart_puts("CRITICO ");
    if (alarms & ALM_OVER)  uart_puts("TRANSBORDO ");
    if (alarms & ALM_FAULT) uart_puts("FALHA_BOMBA ");
    uart_puts("\r\n");
}
#endif

/* ============================ ALERTAS SONOROS ============================ */
/*
 * O buzzer (RC1) e acionado pelo CCP2 em modo PWM, com Timer2 (prescaler 1:16).
 * Somente os 3 alarmes emitem som, cada um com um padrao proprio:
 *   - CRITICO        : beep lento de 1 kHz
 *   - TRANSBORDAMENTO: beeps rapidos de 2 kHz
 *   - FALHA DA BOMBA : sirene alternando 800 Hz e 1200 Hz
 * Cada padrao e uma lista de notas {frequencia em Hz, duracao em ticks de 10 ms}:
 * frequencia 0 = silencio; duracao 0 = fim da lista (a lista recomeca em loop).
 * O som toca enquanto o alarme estiver ativo e NAO reconhecido (S3 cala).
 * Faixa de frequencia valida com Fosc = 8 MHz: ~490 Hz a ~8 kHz.
 */
typedef struct { uint16_t f; uint8_t d; } note_t;

static const note_t alm_crit[]  = {{1000,30},{0,70},{0,0}};   /* beep lento      */
static const note_t alm_over[]  = {{2000,10},{0,10},{0,0}};   /* beeps rapidos   */
static const note_t alm_fault[] = {{800,20},{1200,20},{0,0}}; /* sirene 2 tons   */

static const note_t *pat_base = 0;      /* padrao em execucao (0 = silencio) */
static const note_t *pat_cur  = 0;      /* proxima nota a carregar           */
static uint16_t      pat_freq = 0;      /* frequencia da nota atual          */
static uint8_t       pat_left = 0;      /* ticks restantes da nota atual     */
static uint16_t      cur_freq = 0;      /* frequencia que esta no PWM agora  */

static void tone_on(uint16_t f)
{
    uint16_t div = (uint16_t)((_XTAL_FREQ / 64UL) / f);   /* = PR2 + 1 */
    if (div > 256) div = 256;
    if (div < 2)   div = 2;
    PR2    = (uint8_t)(div - 1);
    CCPR2L = (uint8_t)(div >> 1);                          /* duty de 50 % */
    CCP2CON = 0x0C;                                        /* modo PWM     */
}

static void tone_off(void)
{
    CCP2CON = 0x00;
    BUZ_LAT = 0;
}

static void sound_alarm(const note_t *pat)       /* define o alarme sonoro (0 = nenhum) */
{
    if (pat == pat_base) return;                 /* ja esta tocando esse */
    pat_base = pat;
    pat_cur  = pat;
    pat_left = 0;
}

static void sound_tick(void)                     /* chamar a cada 10 ms */
{
    uint16_t f = 0;

    if (pat_base) {
        if (pat_left == 0) {                     /* carrega proxima nota */
            if (pat_cur->d == 0) pat_cur = pat_base;   /* fim da lista: recomeca */
            pat_left = pat_cur->d;
            pat_freq = pat_cur->f;
            pat_cur++;
        }
        pat_left--;
        f = pat_freq;
    }

    if (f == 0) {
        if (cur_freq) { tone_off(); cur_freq = 0; }
    } else if (f != cur_freq) {
        tone_on(f);
        cur_freq = f;
    }
}

/* ============================== CONTROLE ================================== */
static void set_pump(bool on)
{
    if (on && !pump_on) {               /* nova partida: reinicia monitor de falha */
        fault_ref = level_pct;
        fault_cnt = 0;
    }
    pump_on  = on;
    PUMP_LAT = on ? 1 : 0;
    LED_PUMP = on ? 1 : 0;
}

/* Executado a cada 100 ms, apos sample_level() */
static void control_step(void)
{
    uint8_t a = 0;

    /* Intertravamento: nunca bombeia com tanque cheio */
    if (level_pct >= NIVEL_TRANSB) {
        set_pump(false);
    } else if (auto_mode) {
        /* Histerese: so muda de estado nos limites */
        if (level_pct <= NIVEL_LIGA)         set_pump(true);
        else if (level_pct >= NIVEL_DESLIGA) set_pump(false);
    }

    if (fault) set_pump(false);         /* falha travada: bomba bloqueada ate S3 */

    /* Monitor de falha: bomba ligada e nivel nao sobe */
    if (pump_on && level_pct < NIVEL_DESLIGA) {
        if (++fault_cnt >= FALHA_JANELA) {
            if (level_pct < (uint8_t)(fault_ref + FALHA_SUBIDA_MIN)) {
                fault = true;
                set_pump(false);
            } else {
                fault_ref = level_pct;
                fault_cnt = 0;
            }
        }
    } else {
        fault_cnt = 0;
    }

    if (level_pct <= NIVEL_CRITICO) a |= ALM_CRIT;
    if (level_pct >= NIVEL_TRANSB)  a |= ALM_OVER;
    if (fault)                      a |= ALM_FAULT;

    alarms    = a;
    ack_mask &= a;                      /* alarme que sumiu volta a poder soar */

    /* Saidas de alarme: buzzer pisca se houver alarme NAO reconhecido */
    phase++;
    bool ativo = (alarms & (uint8_t)~ack_mask) != 0;

    /* Som do alarme (prioridade: falha > transbordamento > critico) */
    if (!ativo)                        sound_alarm(0);
    else if (alarms & ALM_FAULT)       sound_alarm(alm_fault);
    else if (alarms & ALM_OVER)        sound_alarm(alm_over);
    else                               sound_alarm(alm_crit);

    LED_ALM = (alarms && (!ativo || ((phase & 0x01) == 0))) ? 1 : 0;
}

static bool take(volatile uint8_t *f)
{
    bool v;
    INTCONbits.GIE = 0;
    v = (*f != 0);
    *f = 0;
    INTCONbits.GIE = 1;
    return v;
}

static void handle_buttons(void)
{
    if (take(&evt_mode)) {              /* S1: AUTO <-> MANUAL */
        auto_mode = !auto_mode;
    }
    if (take(&evt_pump)) {              /* S2: bomba manual (so no modo MANUAL) */
        if (!auto_mode) {
            if (pump_on) set_pump(false);
            else if (level_pct < NIVEL_TRANSB && !fault) set_pump(true);
        }
    }
    if (take(&evt_ack)) {               /* S3: reconhece alarme / limpa falha */
        if (fault) { fault = false; fault_cnt = 0; alarms &= (uint8_t)~ALM_FAULT; }
        ack_mask = alarms;
        sound_alarm(0);                 /* cala o alarme na hora */
    }
}

/* ============================== HARDWARE ================================== */
static void hw_init(void)
{
    ADCON1 = 0x0E;                      /* so AN0 analogico, demais digitais     */
    CMCON  = 0x07;                      /* comparadores desligados               */
    ADCON2 = 0x91;                      /* justif. direita, 4 TAD, Fosc/8        */
    ADCON0 = 0x01;                      /* canal AN0, ADC ligado                 */

    TRISA = 0x01;  LATA = 0x00;         /* RA0 entrada; RA2-RA5 em 0 mantem os   */
                                        /* displays de 7 seg. da placa desligados*/
    TRISB = 0x07;  LATB = 0x00;         /* RB0-RB2 botoes; RB3-RB7 saidas        */
    TRISC = 0xFC;  LATC = 0x00;         /* RC0 rele, RC1 buzzer                  */
    TRISD = 0x00;  LATD = 0x00;         /* barramento do LCD                     */
    TRISE = 0x00;  LATE = 0x00;         /* RE1 = EN, RE2 = RS                    */

    /* Botoes em INT0/1/2: borda da pressao (1 = subida, 0 = descida) */
#if BTN_AUTODETECT
    __delay_ms(100);                    /* deixa os pinos estabilizarem */
    {
        uint8_t idle = PORTB & 0x07;    /* nivel de repouso dos 3 botoes */
        INTCON2bits.INTEDG0 = (idle & 0x01) ? 0 : 1;
        INTCON2bits.INTEDG1 = (idle & 0x02) ? 0 : 1;
        INTCON2bits.INTEDG2 = (idle & 0x04) ? 0 : 1;
    }
    INTCON2bits.RBPU = 1;               /* pull-ups internos desligados */
#else
    INTCON2bits.INTEDG0 = BTN_ATIVO_ALTO;
    INTCON2bits.INTEDG1 = BTN_ATIVO_ALTO;
    INTCON2bits.INTEDG2 = BTN_ATIVO_ALTO;
    INTCON2bits.RBPU    = BTN_ATIVO_ALTO ? 1 : 0;   /* 0 = pull-ups internos ligados */
#endif

    /* Timer0: 16 bits, clock interno, prescaler 1:8 */
    T0CON = 0x02;
    TMR0H = (uint8_t)(T0_PRESET >> 8);
    TMR0L = (uint8_t)(T0_PRESET & 0xFF);
    T0CONbits.TMR0ON = 1;

    /* Timer2 + CCP2 (PWM no buzzer, RC1): prescaler 1:16, desligado ate haver som */
    T2CON   = 0x06;
    CCP2CON = 0x00;

#if USE_UART
    TXSTA  = 0x24;                      /* TXEN=1, BRGH=1 */
    RCSTA  = 0x90;                      /* SPEN=1, CREN=1 */
    BAUDCON = 0x00;
    SPBRG  = (uint8_t)(_XTAL_FREQ / 16UL / UART_BAUD - 1UL);
#endif

    /* Interrupcoes */
    RCONbits.IPEN = 0;
    INTCONbits.TMR0IF = 0;  INTCONbits.TMR0IE = 1;
    INTCONbits.INT0IF = 0;  INTCONbits.INT0IE = 1;
    INTCON3bits.INT1IF = 0; INTCON3bits.INT1IE = 1;
    INTCON3bits.INT2IF = 0; INTCON3bits.INT2IE = 1;
    INTCONbits.GIE = 1;
}

/* ================================ MAIN ==================================== */
void main(void)
{
    uint8_t t_amostra = 0, t_lcd = 0;
#if USE_UART
    uint8_t t_log = 0;
#endif

    hw_init();
    lcd_init();
    sample_level();
    control_step();
    lcd_refresh();

    /* Descarta eventos de botao gerados durante a inicializacao */
    INTCONbits.GIE = 0;
    evt_mode = 0; evt_pump = 0; evt_ack = 0;
    INTCONbits.INT0IF = 0; INTCON3bits.INT1IF = 0; INTCON3bits.INT2IF = 0;
    ticks = 0;
    INTCONbits.GIE = 1;

    while (1) {
        while (ticks) {                 /* consome cada tick de 10 ms */
            INTCONbits.GIE = 0; ticks--; INTCONbits.GIE = 1;

            handle_buttons();           /* resposta rapida aos botoes */
            sound_tick();               /* avanca o alerta sonoro      */

            if (++t_amostra >= AMOSTRA_TICKS) {      /* 100 ms */
                t_amostra = 0;
                sample_level();
                control_step();
#if USE_UART
                if (++t_log >= 10) { t_log = 0; uart_log(); }   /* 1 s */
#endif
            }
            if (++t_lcd >= LCD_TICKS) {              /* 200 ms */
                t_lcd = 0;
                lcd_refresh();
            }
        }
    }
}