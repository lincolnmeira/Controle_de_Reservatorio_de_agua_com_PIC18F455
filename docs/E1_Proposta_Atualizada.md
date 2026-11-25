# Saneamento: controle de reservatório de água com PIC18F4550

**Projeto Final - Etapa 1 (E1)**  
GCET1029 - Sistemas Microcontrolados - UFRB  
Missão 3 da Nova Indústria Brasil  
Autores: Antônio Francisco e Lincoln Meira de Santana  
Professor: Moisés A. Oliveira  
Cruz das Almas, 2026

> Esta revisão preserva a proposta do projeto e explicita as diferenças entre o comportamento planejado e o código disponível. A versão usada como referência é `firmware/v2/reservatorio.c`. A análise foi estática; não há evidência de compilação ou execução do firmware neste repositório.

## 1. Objetivo

Desenvolver um protótipo didático de controle de nível de reservatório com o PIC18F4550. Um potenciômetro representa o sensor de nível, um relé representa o acionamento da bomba, e LEDs, buzzer e LCD informam o estado ao operador. A proposta se relaciona à Missão 3 da Nova Indústria Brasil, no eixo de infraestrutura e saneamento: ilustra como o controle local pode ajudar a evitar desperdício por transbordamento e indisponibilidade por nível baixo. O protótipo não substitui um sistema de saneamento real nem usa sensor ou bomba reais.

## 2. Metodologia

O firmware está organizado em inicialização de periféricos, interrupção do Timer0, leitura do ADC, tratamento dos botões, controle da bomba e atualização das interfaces. A ISR trata Timer0 e INT0–INT2, atualizando contadores e eventos; o laço principal consome os eventos e executa leitura, controle, display e registro serial. O código usa registradores do PIC e macros do XC8.

O roteiro planejado é conferir pinagem e oscilador nas duas plataformas, compilar no XC8, validar o comportamento no PICSimLab (E2) e repetir o roteiro na ACEPIC PRO V3 (E3), anotando diferenças. Essas validações ainda não estão documentadas aqui. O código declara XC8 v2.x e `_XTAL_FREQ` de 8 MHz; a compilação precisa confirmar a configuração e os bits aceitos pela versão efetivamente usada.

## 3. Descrição do sistema

O potenciômetro ligado a RA0/AN0 produz a leitura de 10 bits. O firmware calcula a média de quatro conversões e converte o resultado em porcentagem e altura equivalente de 0 a 200 cm. Em modo AUTO, a bomba liga com nível de até 25% e desliga a partir de 85%, com intertravamento em nível de transbordamento. Em modo MANUAL, S2 comanda a bomba, sujeito ao intertravamento implementado em 95%. O LCD mostra nível, modo, estado da bomba e uma etiqueta resumida do alarme. A USART envia uma linha de telemetria.

## 4. Especificações e comparação com o código

| Item | Proposta E1 original | Firmware v2 (`reservatorio.c`) |
|---|---|---|
| Oscilador e temporização | Exemplo de cálculo considera 20 MHz; tick de 10 ms | `_XTAL_FREQ = 8 MHz`; Timer0, 16 bits, prescaler 1:8, recarga calculada para tick nominal de 10 ms |
| Conversão do nível | 0–100% e 0–200 cm; média de quatro leituras | Implementado com ADC de 10 bits, média de quatro conversões e arredondamento inteiro |
| Bomba em AUTO | Liga ≤25%; desliga ≥85%; intervalo mínimo de 5 s entre partidas | Liga ≤25%; desliga ≥85%; não há intervalo mínimo entre partidas |
| Bomba em MANUAL | S2 liga/desliga; desligamento automático em ≥85% | S2 liga/desliga; o controle só força desligamento em ≥95%; portanto, a condição proposta de 85% não está implementada em MANUAL |
| Troca de modo | S1 alterna AUTO/MANUAL e sempre desliga a bomba | S1 apenas alterna o modo. A bomba pode permanecer ligada; ao entrar em AUTO, o próximo ciclo pode aplicar a regra automática |
| Reconhecimento da falha | S3 reconhece a falha e leva o sistema a MANUAL com a bomba desligada | S3 libera a falha e reconhece alarmes, mas não muda para MANUAL; se estiver em AUTO e o nível pedir bombeamento, a bomba pode voltar a ligar no ciclo seguinte |
| Alarme crítico | ≤10%; liberação prevista em 12% | Ativo em ≤10%; sem histerese de liberação: desaparece assim que passa de 10% |
| Transbordamento | ≥95%; liberação prevista em 93% | Ativo em ≥95%; sem histerese de liberação: desaparece abaixo de 95% |
| Falha da bomba | Bomba ligada por 30 s sem subir 3 pontos percentuais | Janela de 5 s, subida mínima de 2 pontos percentuais; falha fica travada até S3 |
| Intervalos de execução | ADC a cada 100 ms; LCD a cada 200 ms; debounce de 50 ms no texto da proposta | Esses três intervalos estão definidos no código. O debounce é contado pelo tick de Timer0 |
| Alarmes sonoros | 1 Hz no nível crítico, 4 Hz em transbordamento e som contínuo na falha | CCP2/Timer2 em PWM: padrão de 1 kHz para crítico, pulsos de 2 kHz para transbordamento e alternância de 800/1200 Hz para falha |
| LCD | Mensagens completas de estado/alarme e mensagem de inicialização | Linha 1 com nível e altura; linha 2 compacta `AUTO`/`MAN`, bomba e etiqueta `FALHA`, `TRANS` ou `CRIT`; não há tela de inicialização |
| USART | TX em RC6, 9600 bps opcional; referência original calcula para 20 MHz | Ativada por padrão (`USE_UART=1`), TX configurado para 9600 bps com Fosc de 8 MHz e log a cada segundo |

As diferenças acima descrevem o código existente; não significam que a proposta original tenha sido validada em hardware. Qualquer alteração de requisito deve ser confirmada antes da etapa física.

## 5. Elementos de interface com o operador

| Elemento | Pino | Comportamento no firmware v2 |
|---|---|---|
| S1 - modo | RB0/INT0 | Alterna AUTO e MANUAL; não força a bomba a desligar |
| S2 - bomba | RB1/INT1 | Alterna a bomba somente em MANUAL; em AUTO é ignorado |
| S3 - reconhecer | RB2/INT2 | Reconhece os alarmes ativos e libera a falha travada |
| LED da bomba | RB4 | Aceso quando a saída do relé está ligada |
| LED de alarme | RB5 | Aceso ou piscando conforme a presença e o reconhecimento do alarme |
| Buzzer | RC1/CCP2 | PWM com padrões sonoros; S3 silencia os alarmes reconhecidos |
| LCD 16×2 | RD0–RD7, RE1/EN, RE2/RS | Atualizado a cada 200 ms com nível, modo, bomba e etiqueta de alarme |
| Serial | RC6/TX | Mensagem de nível, altura, bomba, modo e alarmes, nominalmente a cada 1 s |

## 6. Sinais, periféricos e interfaces

| Recurso | Pino(s) | Configuração no código | Papel no protótipo |
|---|---|---|---|
| Potenciômetro | RA0/AN0 | ADCON0, ADCON1, ADCON2, ADRESH:ADRESL | Entrada de nível simulada |
| Relé | RC0 | TRISC/LATC | Representa o comando da bomba |
| Buzzer PWM | RC1/CCP2 | CCP2, Timer2 e configuração `CCP2MX=ON` | Alarme sonoro |
| LEDs | RB4/RB5 | TRISB/LATB | Estado da bomba e alarmes |
| Botões | RB0–RB2 | INT0–INT2, INTCON/INTCON3 e INTCON2 | Modo, comando manual e reconhecimento |
| LCD | RD0–RD7, RE1, RE2 | TRISD/LATD, TRISE/LATE | Nível e estado do sistema |
| Base de tempo | Timer0 | T0CON, TMR0H:TMR0L, INTCON | Tick de 10 ms, debounce e temporizações |
| Comunicação serial | RC6/TX | TXSTA, RCSTA, BAUDCON, SPBRG | Telemetria opcional/configurada no código |

A tabela representa a configuração pretendida pelo fonte, não uma medição da placa. A pinagem, a frequência do oscilador, a polaridade dos botões e a rota física do CCP2 devem ser verificadas no PICSimLab e na ACEPIC PRO V3. O modo de detecção de polaridade (`BTN_AUTODETECT=1`) amostra RB0–RB2 durante a inicialização; o comentário do código orienta iniciar com os botões soltos.

## 7. Descrição da operação implementada

1. `hw_init()` configura GPIO, ADC, Timer0, CCP2/Timer2 e USART. O LCD é inicializado; o nível é amostrado e o controle executado. Não há mensagem de partida nem garantia de manter a bomba desligada durante a inicialização.
2. Timer0 gera interrupções a cada tick nominal de 10 ms. A ISR acumula ticks e temporiza a reabilitação das interrupções externas após o debounce.
3. A cada 100 ms, o laço principal lê quatro amostras ADC, atualiza porcentagem/altura, executa o controle e avalia alarmes. A cada 200 ms, atualiza o LCD. A cada 1 s, envia telemetria serial.
4. Em AUTO, a bomba liga em ≤25% e desliga em ≥85%. Em qualquer modo, o nível ≥95% força o desligamento. O modo MANUAL permite alternar a bomba por S2 abaixo de 95%, desde que não haja falha travada.
5. Se a bomba permanece ligada e, após a janela de monitoramento, o nível não subir ao menos 2 pontos percentuais, o firmware registra falha, desliga a bomba e bloqueia nova partida até S3.
6. Alarmes ativos são exibidos no LCD e no LED. O buzzer toca enquanto houver alarme não reconhecido; a prioridade sonora é falha, transbordamento e crítico. O padrão recomeça enquanto a condição persistir.

## 8. Limitações, validação pendente e próximos passos

O potenciômetro não reproduz a dinâmica de um sensor real e o relé não representa uma bomba sob carga. O código usa temporização nominal derivada de 8 MHz e a etapa física pode divergir conforme o oscilador e a placa. O UART transmite de forma bloqueante no laço principal. Na v2, `T2CON = 0x06` deixa o Timer2 ligado desde a inicialização (`TMR2ON=1`), embora o comentário diga que ele fica desligado até haver som; isso não impede o PWM, mas o comentário e a configuração não coincidem. Não foi feita compilação nem execução durante esta revisão; portanto, os HEX preservados nas pastas v1 e v2 ainda precisam ser associados ao fonte correspondente por uma compilação reproduzível.

Antes de E2/E3, confirmar no projeto MPLAB/XC8 a seleção do PIC18F4550, a versão do compilador, o oscilador e os bits de configuração; compilar e gerar HEX a partir de `firmware/v2/reservatorio.c`; testar as condições de nível, troca de modo, comando manual, falha e reconhecimento; e registrar resultados. Em particular, decidir se o comportamento de MANUAL deve desligar a bomba em 85%, se S1 deve desligá-la sempre e se os limiares e temporizações originais devem ser restaurados ou formalmente atualizados. Em seguida, repetir o mesmo roteiro no PICSimLab e na ACEPIC, documentar diferenças observadas e usar os resultados no relatório final.
