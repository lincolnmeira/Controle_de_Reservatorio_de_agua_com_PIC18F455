# Controle_de_Reservatorio_de_agua_com_PIC18F455
O projeto propõe um controlador de nível de reservatório de água, em um único firmware para o PIC18F4550, executado na placa ACEPIC PRO V3 e no simulador PICSimLab (placa PICGenios).
O potenciômetro simula o nível medido, o relé simula o contator da bomba e o display LCD 16×2 mostra o nível em % e em cm. A bomba é ligada quando o nível cai a 25% ou menos e desligada quando atinge 85% ou mais (histerese de 60 pontos percentuais). Alarmes sonoros e visuais indicam nível crítico, risco de transbordamento e falha da bomba.
