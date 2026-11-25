# Controle de reservatório de água com PIC18F4550

Projeto final da disciplina GCET1029 - Sistemas Microcontrolados (UFRB). O protótipo didático usa um potenciômetro como sensor de nível e representa a bomba por um relé. O firmware foi escrito em C para o PIC18F4550; a validação em simulador e na placa física ainda deve ser registrada nas próximas etapas.

## Estrutura

```text
docs/
  E1_Proposta_Atualizada.md       Proposta E1 revisada conforme o firmware v2
  referencias/                   PDFs originais recebidos
firmware/
  v1/                            Versão anterior do código e HEX
    projeto_xc8_original/        Projeto e artefatos originais preservados
  v2/                            Versão de referência atual do código e HEX
    projeto_xc8_original/        Projeto e artefatos originais preservados
```

## Versão de referência

Use `firmware/v2/reservatorio.c` como versão atual para leitura e continuidade. Essa versão configura o buzzer em PWM pelo CCP2/RC1 e mantém os três padrões de alarme. `firmware/v1/` foi preservada para comparação histórica. As subpastas `projeto_xc8_original/` guardam uma cópia completa de cada diretório original, incluindo configuração do editor e artefatos gerados; use os arquivos no nível superior de cada versão como referência de leitura.

## Resumo do firmware v2

- PIC18F4550, XC8, frequência configurada no código em 8 MHz.
- Potenciômetro em RA0/AN0, ADC de 10 bits; média de quatro leituras, conversão para 0–100% e 0–200 cm.
- Relé da bomba em RC0; LED da bomba em RB4 e LED de alarme em RB5.
- Botões S1/S2/S3 em RB0/INT0, RB1/INT1 e RB2/INT2; debounce por Timer0.
- LCD 16×2 em RD0–RD7, EN em RE1 e RS em RE2.
- Timer0 gera tick nominal de 10 ms; amostragem/controle a cada 100 ms e LCD a cada 200 ms.
- USART transmite registros a 9600 bps, nominalmente a cada segundo.
- Bomba em AUTO liga em nível ≤25% e desliga em ≥85%; intertravamento desliga em ≥95%.
- Alarmes: crítico ≤10%, transbordamento ≥95% e falha detectada após 5 s com subida inferior a 2 pontos percentuais.
- CCP2/Timer2 produz padrões sonoros distintos para crítico, transbordamento e falha. S3 reconhece/silencia alarmes e libera a falha travada.

## Observações para continuidade

O documento E1 distingue requisitos propostos do comportamento que o código realmente implementa. Antes de levar o firmware à placa, devem ser confirmados o oscilador, a pinagem, a polaridade dos botões e o roteamento do CCP2 no hardware. Ainda não há neste repositório registro de compilação XC8, execução E2 no PICSimLab ou validação E3 na ACEPIC PRO V3; os arquivos HEX existentes foram preservados, mas sua correspondência com o código-fonte deve ser confirmada.

Consulte [a proposta E1 atualizada](docs/E1_Proposta_Atualizada.md) e os [documentos originais](docs/referencias/).
