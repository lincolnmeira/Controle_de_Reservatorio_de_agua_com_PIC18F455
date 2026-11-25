subtitle "Microchip MPLAB XC8 C Compiler v4.00 build 20260614213421 Og1 "

pagewidth 120
	processor	18F4550
include "/home/tony/dfp/pic18/xc8/pic/include/proc/18f4550.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
skiprom24 macro arg1
	btfsc arg1,7
endm
	global	__ramtop
	global	__accesstop
# 38 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPPDATA equ 0F62h ;# 
# 58 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPPCFG equ 0F63h ;# 
# 135 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPPEPS equ 0F64h ;# 
# 209 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPPCON equ 0F65h ;# 
# 235 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UFRM equ 0F66h ;# 
# 242 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UFRML equ 0F66h ;# 
# 320 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UFRMH equ 0F67h ;# 
# 360 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UIR equ 0F68h ;# 
# 416 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UIE equ 0F69h ;# 
# 472 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEIR equ 0F6Ah ;# 
# 523 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEIE equ 0F6Bh ;# 
# 574 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
USTAT equ 0F6Ch ;# 
# 634 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UCON equ 0F6Dh ;# 
# 685 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UADDR equ 0F6Eh ;# 
# 749 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UCFG equ 0F6Fh ;# 
# 828 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP0 equ 0F70h ;# 
# 936 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP1 equ 0F71h ;# 
# 1044 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP2 equ 0F72h ;# 
# 1152 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP3 equ 0F73h ;# 
# 1260 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP4 equ 0F74h ;# 
# 1368 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP5 equ 0F75h ;# 
# 1476 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP6 equ 0F76h ;# 
# 1584 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP7 equ 0F77h ;# 
# 1692 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP8 equ 0F78h ;# 
# 1768 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP9 equ 0F79h ;# 
# 1844 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP10 equ 0F7Ah ;# 
# 1920 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP11 equ 0F7Bh ;# 
# 1996 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP12 equ 0F7Ch ;# 
# 2072 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP13 equ 0F7Dh ;# 
# 2148 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP14 equ 0F7Eh ;# 
# 2224 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
UEP15 equ 0F7Fh ;# 
# 2300 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PORTA equ 0F80h ;# 
# 2439 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PORTB equ 0F81h ;# 
# 2549 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PORTC equ 0F82h ;# 
# 2691 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PORTD equ 0F83h ;# 
# 2812 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PORTE equ 0F84h ;# 
# 2959 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LATA equ 0F89h ;# 
# 3059 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LATB equ 0F8Ah ;# 
# 3171 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LATC equ 0F8Bh ;# 
# 3249 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LATD equ 0F8Ch ;# 
# 3361 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LATE equ 0F8Dh ;# 
# 3413 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TRISA equ 0F92h ;# 
# 3418 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
DDRA equ 0F92h ;# 
# 3611 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TRISB equ 0F93h ;# 
# 3616 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
DDRB equ 0F93h ;# 
# 3833 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TRISC equ 0F94h ;# 
# 3838 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
DDRC equ 0F94h ;# 
# 3987 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TRISD equ 0F95h ;# 
# 3992 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
DDRD equ 0F95h ;# 
# 4209 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TRISE equ 0F96h ;# 
# 4214 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
DDRE equ 0F96h ;# 
# 4311 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
OSCTUNE equ 0F9Bh ;# 
# 4370 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PIE1 equ 0F9Dh ;# 
# 4454 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PIR1 equ 0F9Eh ;# 
# 4538 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
IPR1 equ 0F9Fh ;# 
# 4622 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PIE2 equ 0FA0h ;# 
# 4693 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PIR2 equ 0FA1h ;# 
# 4764 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
IPR2 equ 0FA2h ;# 
# 4835 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
EECON1 equ 0FA6h ;# 
# 4901 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
EECON2 equ 0FA7h ;# 
# 4908 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
EEDATA equ 0FA8h ;# 
# 4915 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
EEADR equ 0FA9h ;# 
# 4922 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
RCSTA equ 0FABh ;# 
# 4927 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
RCSTA1 equ 0FABh ;# 
# 5132 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TXSTA equ 0FACh ;# 
# 5137 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TXSTA1 equ 0FACh ;# 
# 5388 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TXREG equ 0FADh ;# 
# 5393 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TXREG1 equ 0FADh ;# 
# 5400 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
RCREG equ 0FAEh ;# 
# 5405 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
RCREG1 equ 0FAEh ;# 
# 5412 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPBRG equ 0FAFh ;# 
# 5417 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPBRG1 equ 0FAFh ;# 
# 5424 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SPBRGH equ 0FB0h ;# 
# 5431 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
T3CON equ 0FB1h ;# 
# 5552 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR3 equ 0FB2h ;# 
# 5559 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR3L equ 0FB2h ;# 
# 5566 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR3H equ 0FB3h ;# 
# 5573 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CMCON equ 0FB4h ;# 
# 5663 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CVRCON equ 0FB5h ;# 
# 5748 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ECCP1AS equ 0FB6h ;# 
# 5753 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCP1AS equ 0FB6h ;# 
# 5910 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ECCP1DEL equ 0FB7h ;# 
# 5915 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCP1DEL equ 0FB7h ;# 
# 6048 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
BAUDCON equ 0FB8h ;# 
# 6053 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
BAUDCTL equ 0FB8h ;# 
# 6228 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCP2CON equ 0FBAh ;# 
# 6292 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR2 equ 0FBBh ;# 
# 6299 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR2L equ 0FBBh ;# 
# 6306 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR2H equ 0FBCh ;# 
# 6313 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCP1CON equ 0FBDh ;# 
# 6318 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ECCP1CON equ 0FBDh ;# 
# 6475 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR1 equ 0FBEh ;# 
# 6482 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR1L equ 0FBEh ;# 
# 6489 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
CCPR1H equ 0FBFh ;# 
# 6496 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADCON2 equ 0FC0h ;# 
# 6567 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADCON1 equ 0FC1h ;# 
# 6652 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADCON0 equ 0FC2h ;# 
# 6771 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADRES equ 0FC3h ;# 
# 6778 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADRESL equ 0FC3h ;# 
# 6785 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
ADRESH equ 0FC4h ;# 
# 6792 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SSPCON2 equ 0FC5h ;# 
# 6854 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SSPCON1 equ 0FC6h ;# 
# 6924 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SSPSTAT equ 0FC7h ;# 
# 7172 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SSPADD equ 0FC8h ;# 
# 7179 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
SSPBUF equ 0FC9h ;# 
# 7186 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
T2CON equ 0FCAh ;# 
# 7284 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PR2 equ 0FCBh ;# 
# 7289 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
MEMCON equ 0FCBh ;# 
# 7394 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR2 equ 0FCCh ;# 
# 7401 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
T1CON equ 0FCDh ;# 
# 7504 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR1 equ 0FCEh ;# 
# 7511 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR1L equ 0FCEh ;# 
# 7518 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR1H equ 0FCFh ;# 
# 7525 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
RCON equ 0FD0h ;# 
# 7674 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
WDTCON equ 0FD1h ;# 
# 7702 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
HLVDCON equ 0FD2h ;# 
# 7707 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
LVDCON equ 0FD2h ;# 
# 7972 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
OSCCON equ 0FD3h ;# 
# 8055 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
T0CON equ 0FD5h ;# 
# 8125 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR0 equ 0FD6h ;# 
# 8132 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR0L equ 0FD6h ;# 
# 8139 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TMR0H equ 0FD7h ;# 
# 8146 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
STATUS equ 0FD8h ;# 
# 8217 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR2 equ 0FD9h ;# 
# 8224 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR2L equ 0FD9h ;# 
# 8231 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR2H equ 0FDAh ;# 
# 8238 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PLUSW2 equ 0FDBh ;# 
# 8245 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PREINC2 equ 0FDCh ;# 
# 8252 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTDEC2 equ 0FDDh ;# 
# 8259 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTINC2 equ 0FDEh ;# 
# 8266 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INDF2 equ 0FDFh ;# 
# 8273 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
BSR equ 0FE0h ;# 
# 8280 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR1 equ 0FE1h ;# 
# 8287 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR1L equ 0FE1h ;# 
# 8294 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR1H equ 0FE2h ;# 
# 8301 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PLUSW1 equ 0FE3h ;# 
# 8308 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PREINC1 equ 0FE4h ;# 
# 8315 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTDEC1 equ 0FE5h ;# 
# 8322 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTINC1 equ 0FE6h ;# 
# 8329 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INDF1 equ 0FE7h ;# 
# 8336 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
WREG equ 0FE8h ;# 
# 8343 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR0 equ 0FE9h ;# 
# 8350 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR0L equ 0FE9h ;# 
# 8357 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
FSR0H equ 0FEAh ;# 
# 8364 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PLUSW0 equ 0FEBh ;# 
# 8371 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PREINC0 equ 0FECh ;# 
# 8378 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTDEC0 equ 0FEDh ;# 
# 8385 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
POSTINC0 equ 0FEEh ;# 
# 8392 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INDF0 equ 0FEFh ;# 
# 8399 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INTCON3 equ 0FF0h ;# 
# 8491 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INTCON2 equ 0FF1h ;# 
# 8568 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
INTCON equ 0FF2h ;# 
# 8685 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PROD equ 0FF3h ;# 
# 8692 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PRODL equ 0FF3h ;# 
# 8699 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PRODH equ 0FF4h ;# 
# 8706 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TABLAT equ 0FF5h ;# 
# 8715 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TBLPTR equ 0FF6h ;# 
# 8722 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TBLPTRL equ 0FF6h ;# 
# 8729 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TBLPTRH equ 0FF7h ;# 
# 8736 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TBLPTRU equ 0FF8h ;# 
# 8745 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PCLAT equ 0FF9h ;# 
# 8752 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PC equ 0FF9h ;# 
# 8759 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PCL equ 0FF9h ;# 
# 8766 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PCLATH equ 0FFAh ;# 
# 8773 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
PCLATU equ 0FFBh ;# 
# 8780 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
STKPTR equ 0FFCh ;# 
# 8856 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TOS equ 0FFDh ;# 
# 8863 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TOSL equ 0FFDh ;# 
# 8870 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TOSH equ 0FFEh ;# 
# 8877 "/home/tony/dfp/pic18/xc8/pic/include/proc/pic18f4550.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_control_step
	FNCALL	_main,_handle_buttons
	FNCALL	_main,_hw_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_refresh
	FNCALL	_main,_sample_level
	FNCALL	_main,_sound_tick
	FNCALL	_main,_uart_log
	FNCALL	_uart_log,_uart_num3
	FNCALL	_uart_log,_uart_puts
	FNCALL	_uart_puts,_uart_putc
	FNCALL	_uart_num3,_fmt3
	FNCALL	_uart_num3,_uart_putc
	FNCALL	_sound_tick,_tone_off
	FNCALL	_sound_tick,_tone_on
	FNCALL	_tone_on,___lldiv
	FNCALL	_sample_level,___lldiv
	FNCALL	_sample_level,___lmul
	FNCALL	_sample_level,_adc_read_once
	FNCALL	_lcd_refresh,_alarm_text
	FNCALL	_lcd_refresh,_fmt3
	FNCALL	_lcd_refresh,_lcd_line
	FNCALL	_lcd_line,_lcd_cmd
	FNCALL	_lcd_line,_lcd_putc
	FNCALL	_lcd_putc,_lcd_pulse
	FNCALL	_fmt3,___lwdiv
	FNCALL	_fmt3,___lwmod
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_init,_lcd_pulse
	FNCALL	_lcd_cmd,_lcd_pulse
	FNCALL	_handle_buttons,_set_pump
	FNCALL	_handle_buttons,_sound_alarm
	FNCALL	_handle_buttons,_take
	FNCALL	_control_step,_set_pump
	FNCALL	_control_step,_sound_alarm
	FNROOT	_main
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_auto_mode
	global	lcd_refresh@F3379
	global	lcd_refresh@F3377
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"reservatorio.c"
	line	89

;initializer for _auto_mode
	db	low(01h)
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	line	197

;initializer for lcd_refresh@F3379
	db	low(041h)
	db	low(055h)
	db	low(054h)
	db	low(04Fh)
	db	low(020h)
	db	low(042h)
	db	low(03Ah)
	db	low(04Fh)
	db	low(046h)
	db	low(046h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(0)
	line	196

;initializer for lcd_refresh@F3377
	db	low(04Eh)
	db	low(069h)
	db	low(076h)
	db	low(065h)
	db	low(06Ch)
	db	low(03Ah)
	db	low(030h)
	db	low(030h)
	db	low(030h)
	db	low(025h)
	db	low(020h)
	db	low(030h)
	db	low(030h)
	db	low(030h)
	db	low(063h)
	db	low(06Dh)
	db	low(0)
	global	_alm_fault
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	file	"reservatorio.c"
	line	275
_alm_fault:
	dw	(0320h)&0ffffh
	db	low(014h)
	dw	(04B0h)&0ffffh
	db	low(014h)
	dw	(0)&0ffffh
	db	low(0)
	global __end_of_alm_fault
__end_of_alm_fault:
	global	_alm_over
psect	smallconst
	file	"reservatorio.c"
	line	274
_alm_over:
	dw	(07D0h)&0ffffh
	db	low(0Ah)
	dw	(0)&0ffffh
	db	low(0Ah)
	dw	(0)&0ffffh
	db	low(0)
	global __end_of_alm_over
__end_of_alm_over:
	global	_alm_crit
psect	smallconst
	file	"reservatorio.c"
	line	273
_alm_crit:
	dw	(03E8h)&0ffffh
	db	low(01Eh)
	dw	(0)&0ffffh
	db	low(046h)
	dw	(0)&0ffffh
	db	low(0)
	global __end_of_alm_crit
__end_of_alm_crit:
	global	_alm_fault
	global	_alm_over
	global	_alm_crit
	global	_deb
	global	_cur_freq
	global	_pat_freq
	global	_level_cm
	global	_pat_left
	global	_pat_cur
	global	_pat_base
	global	_phase
	global	_fault_cnt
	global	_fault_ref
	global	_level_pct
	global	_ack_mask
	global	_alarms
	global	_fault
	global	_pump_on
	global	_ticks
	global	_evt_ack
	global	_evt_pump
	global	_evt_mode
	global	_RCONbits
_RCONbits	set	0xFD0
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_BAUDCON
_BAUDCON	set	0xFB8
	global	_RCSTA
_RCSTA	set	0xFAB
	global	_TXSTA
_TXSTA	set	0xFAC
	global	_T2CON
_T2CON	set	0xFCA
	global	_T0CONbits
_T0CONbits	set	0xFD5
	global	_T0CON
_T0CON	set	0xFD5
	global	_INTCON2bits
_INTCON2bits	set	0xFF1
	global	_PORTB
_PORTB	set	0xF81
	global	_LATE
_LATE	set	0xF8D
	global	_TRISE
_TRISE	set	0xF96
	global	_TRISD
_TRISD	set	0xF95
	global	_LATC
_LATC	set	0xF8B
	global	_TRISC
_TRISC	set	0xF94
	global	_LATB
_LATB	set	0xF8A
	global	_TRISB
_TRISB	set	0xF93
	global	_LATA
_LATA	set	0xF89
	global	_TRISA
_TRISA	set	0xF92
	global	_ADCON0
_ADCON0	set	0xFC2
	global	_ADCON2
_ADCON2	set	0xFC0
	global	_CMCON
_CMCON	set	0xFB4
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_LATBbits
_LATBbits	set	0xF8A
	global	_LATCbits
_LATCbits	set	0xF8B
	global	_CCP2CON
_CCP2CON	set	0xFBA
	global	_CCPR2L
_CCPR2L	set	0xFBB
	global	_PR2
_PR2	set	0xFCB
	global	_TXREG
_TXREG	set	0xFAD
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_ADRESL
_ADRESL	set	0xFC3
	global	_ADRESH
_ADRESH	set	0xFC4
	global	_ADCON0bits
_ADCON0bits	set	0xFC2
	global	_LATD
_LATD	set	0xF8C
	global	_LATEbits
_LATEbits	set	0xF8D
	global	_INTCON3bits
_INTCON3bits	set	0xFF0
	global	_TMR0L
_TMR0L	set	0xFD6
	global	_TMR0H
_TMR0H	set	0xFD7
	global	_INTCONbits
_INTCONbits	set	0xFF2
	
STR_19:
	db	70	;'F'
	db	65	;'A'
	db	76	;'L'
	db	72	;'H'
	db	65	;'A'
	db	95	;'_'
	db	66	;'B'
	db	79	;'O'
	db	77	;'M'
	db	66	;'B'
	db	65	;'A'
	db	32
	db	0
	
STR_18:
	db	84	;'T'
	db	82	;'R'
	db	65	;'A'
	db	78	;'N'
	db	83	;'S'
	db	66	;'B'
	db	79	;'O'
	db	82	;'R'
	db	68	;'D'
	db	79	;'O'
	db	32
	db	0
	
STR_9:
	db	99	;'c'
	db	109	;'m'
	db	32
	db	66	;'B'
	db	111	;'o'
	db	109	;'m'
	db	98	;'b'
	db	97	;'a'
	db	61	;'='
	db	0
	
STR_17:
	db	67	;'C'
	db	82	;'R'
	db	73	;'I'
	db	84	;'T'
	db	73	;'I'
	db	67	;'C'
	db	79	;'O'
	db	32
	db	0
	
STR_15:
	db	32
	db	65	;'A'
	db	108	;'l'
	db	97	;'a'
	db	114	;'r'
	db	109	;'m'
	db	101	;'e'
	db	61	;'='
	db	0
	
STR_7:
	db	78	;'N'
	db	105	;'i'
	db	118	;'v'
	db	101	;'e'
	db	108	;'l'
	db	61	;'='
	db	0
	
STR_12:
	db	32
	db	77	;'M'
	db	111	;'o'
	db	100	;'d'
	db	111	;'o'
	db	61	;'='
	db	0
	
STR_16:
	db	110	;'n'
	db	101	;'e'
	db	110	;'n'
	db	104	;'h'
	db	117	;'u'
	db	109	;'m'
	db	0
	
STR_1:
	db	79	;'O'
	db	75	;'K'
	db	32
	db	32
	db	32
	db	0
	
STR_4:
	db	67	;'C'
	db	82	;'R'
	db	73	;'I'
	db	84	;'T'
	db	32
	db	0
	
STR_2:
	db	70	;'F'
	db	65	;'A'
	db	76	;'L'
	db	72	;'H'
	db	65	;'A'
	db	0
	
STR_3:
	db	84	;'T'
	db	82	;'R'
	db	65	;'A'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_6:
	db	77	;'M'
	db	65	;'A'
	db	78	;'N'
	db	32
	db	0
	
STR_5:
	db	65	;'A'
	db	85	;'U'
	db	84	;'T'
	db	79	;'O'
	db	0
	
STR_10:
	db	79	;'O'
	db	78	;'N'
	db	32
	db	0
	
STR_11:
	db	79	;'O'
	db	70	;'F'
	db	70	;'F'
	db	0
	
STR_20:
	db	13
	db	10
	db	0
	
STR_8:
	db	37
	db	32
	db	0
STR_13	equ	STR_5+0
STR_14	equ	STR_6+0
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config PLLDIV = "1"
	config CPUDIV = "OSC1_PLL2"
	config USBDIV = "1"
	config FOSC = "HS"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRT = "OFF"
	config BOR = "OFF"
	config VREGEN = "OFF"
	config WDT = "OFF"
	config WDTPS = "32768"
	config CCP2MX = "ON"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config STVREN = "ON"
	config LVP = "OFF"
	config XINST = "OFF"
	config DEBUG = "OFF"
	file	"reservatorio.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pbssCOMRAM
__pbssCOMRAM:
_deb:
       ds      3
_cur_freq:
       ds      2
_pat_freq:
       ds      2
_level_cm:
       ds      2
_pat_left:
       ds      1
_pat_cur:
       ds      1
_pat_base:
       ds      1
_phase:
       ds      1
_fault_cnt:
       ds      1
_fault_ref:
       ds      1
_level_pct:
       ds      1
_ack_mask:
       ds      1
_alarms:
       ds      1
_fault:
       ds      1
_pump_on:
       ds      1
_ticks:
       ds      1
_evt_ack:
       ds      1
_evt_pump:
       ds      1
_evt_mode:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"reservatorio.c"
	line	89
_auto_mode:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"reservatorio.c"
	line	197
lcd_refresh@F3379:
       ds      17
psect	dataBANK0
	file	"reservatorio.c"
	line	196
lcd_refresh@F3377:
       ds      17
	file	"reservatorio.s"
	line	#
psect	cinit
; Initialize objects allocated to BANK0 (34 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,34
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to COMRAM (1 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+0		
	line	#
; Clear objects allocated to COMRAM (24 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	24
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	GLOBAL	__Lsmallconst
	movlw	low highword(__Lsmallconst)
	movwf	tblptru
	movlw	high(__Lsmallconst)
	movwf	tblptrh
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isr:	; 1 bytes @ 0x0
?_lcd_pulse:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_putc:	; 1 bytes @ 0x0
?_lcd_init:	; 1 bytes @ 0x0
?_alarm_text:	; 1 bytes @ 0x0
?_lcd_refresh:	; 1 bytes @ 0x0
?_sample_level:	; 1 bytes @ 0x0
?_uart_putc:	; 1 bytes @ 0x0
?_uart_log:	; 1 bytes @ 0x0
?_tone_off:	; 1 bytes @ 0x0
?_sound_alarm:	; 1 bytes @ 0x0
?_sound_tick:	; 1 bytes @ 0x0
?_set_pump:	; 1 bytes @ 0x0
?_control_step:	; 1 bytes @ 0x0
?_take:	; 1 bytes @ 0x0
?_handle_buttons:	; 1 bytes @ 0x0
?_hw_init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?_adc_read_once
?_adc_read_once:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	lcd_putc@c
lcd_putc@c:	; 1 bytes @ 0x0
	global	alarm_text@p
alarm_text@p:	; 1 bytes @ 0x0
	global	uart_putc@c
uart_putc@c:	; 1 bytes @ 0x0
	global	sound_alarm@pat
sound_alarm@pat:	; 1 bytes @ 0x0
	global	take@f
take@f:	; 1 bytes @ 0x0
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
??_isr:	; 1 bytes @ 0x0
??_lcd_pulse:	; 1 bytes @ 0x0
??_lcd_cmd:	; 1 bytes @ 0x0
??_lcd_putc:	; 1 bytes @ 0x0
??_uart_putc:	; 1 bytes @ 0x0
??_tone_off:	; 1 bytes @ 0x0
??_set_pump:	; 1 bytes @ 0x0
??_hw_init:	; 1 bytes @ 0x0
	ds   1
?_uart_puts:	; 1 bytes @ 0x1
	global	lcd_cmd@c
lcd_cmd@c:	; 1 bytes @ 0x1
	global	uart_puts@s
uart_puts@s:	; 1 bytes @ 0x1
	global	set_pump@on
set_pump@on:	; 1 bytes @ 0x1
	global	take@v
take@v:	; 1 bytes @ 0x1
??_alarm_text:	; 1 bytes @ 0x1
??_sound_alarm:	; 1 bytes @ 0x1
??_take:	; 1 bytes @ 0x1
	ds   1
?_lcd_line:	; 1 bytes @ 0x2
	global	lcd_line@s
lcd_line@s:	; 1 bytes @ 0x2
	global	alarm_text@t
alarm_text@t:	; 1 bytes @ 0x2
	global	_control_step$665
_control_step$665:	; 1 bytes @ 0x2
	global	hw_init@idle
hw_init@idle:	; 1 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
??_lcd_init:	; 1 bytes @ 0x2
??_adc_read_once:	; 1 bytes @ 0x2
??_uart_puts:	; 1 bytes @ 0x2
??_control_step:	; 1 bytes @ 0x2
??_handle_buttons:	; 1 bytes @ 0x2
	ds   1
	global	lcd_line@row
lcd_line@row:	; 1 bytes @ 0x3
	global	alarm_text@i
alarm_text@i:	; 1 bytes @ 0x3
	global	control_step@ativo
control_step@ativo:	; 1 bytes @ 0x3
??_lcd_line:	; 1 bytes @ 0x3
	ds   1
	global	control_step@a
control_step@a:	; 1 bytes @ 0x4
	global	_lcd_line$538
_lcd_line$538:	; 2 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
??___lwdiv:	; 1 bytes @ 0x4
	ds   2
	global	lcd_line@i
lcd_line@i:	; 1 bytes @ 0x6
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	ds   1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x7
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x7
	ds   1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
??___lmul:	; 1 bytes @ 0x8
	ds   1
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x9
	ds   2
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xB
??___lwmod:	; 1 bytes @ 0xB
	ds   1
?_fmt3:	; 1 bytes @ 0xC
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0xC
	global	fmt3@p
fmt3@p:	; 1 bytes @ 0xC
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0xC
	ds   1
	global	fmt3@v
fmt3@v:	; 2 bytes @ 0xD
	ds   2
?_uart_num3:	; 1 bytes @ 0xF
	global	uart_num3@v
uart_num3@v:	; 2 bytes @ 0xF
??_fmt3:	; 1 bytes @ 0xF
??_lcd_refresh:	; 1 bytes @ 0xF
	ds   1
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x10
	global	lcd_refresh@l1
lcd_refresh@l1:	; 17 bytes @ 0x10
	ds   1
	global	uart_num3@b
uart_num3@b:	; 3 bytes @ 0x11
??_uart_num3:	; 1 bytes @ 0x11
	ds   3
	global	_uart_log$603
_uart_log$603:	; 1 bytes @ 0x14
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x14
??_uart_log:	; 1 bytes @ 0x14
??___lldiv:	; 1 bytes @ 0x14
	ds   1
	global	_uart_log$608
_uart_log$608:	; 1 bytes @ 0x15
	ds   3
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x18
	ds   1
?_tone_on:	; 1 bytes @ 0x19
	global	tone_on@f
tone_on@f:	; 2 bytes @ 0x19
??_sample_level:	; 1 bytes @ 0x19
	ds   2
	global	sample_level@sum
sample_level@sum:	; 2 bytes @ 0x1B
??_tone_on:	; 1 bytes @ 0x1B
	ds   2
	global	sample_level@adc
sample_level@adc:	; 2 bytes @ 0x1D
	global	tone_on@div
tone_on@div:	; 2 bytes @ 0x1D
	ds   2
	global	sample_level@i
sample_level@i:	; 1 bytes @ 0x1F
??_sound_tick:	; 1 bytes @ 0x1F
	ds   1
	global	sound_tick@f
sound_tick@f:	; 2 bytes @ 0x20
	ds   1
	global	lcd_refresh@l2
lcd_refresh@l2:	; 17 bytes @ 0x21
	ds   17
	global	_lcd_refresh$564
_lcd_refresh$564:	; 2 bytes @ 0x32
	ds   2
	global	_lcd_refresh$565
_lcd_refresh$565:	; 2 bytes @ 0x34
	ds   2
	global	_lcd_refresh$566
_lcd_refresh$566:	; 2 bytes @ 0x36
	ds   2
	global	lcd_refresh@m
lcd_refresh@m:	; 1 bytes @ 0x38
	ds   1
	global	_lcd_refresh$562
_lcd_refresh$562:	; 1 bytes @ 0x39
	ds   1
	global	lcd_refresh@i
lcd_refresh@i:	; 1 bytes @ 0x3A
	ds   1
	global	main@t_amostra
main@t_amostra:	; 1 bytes @ 0x3B
??_main:	; 1 bytes @ 0x3B
	ds   1
	global	main@t_lcd
main@t_lcd:	; 1 bytes @ 0x3C
	ds   1
	global	main@t_log
main@t_log:	; 1 bytes @ 0x3D
	ds   1
;!
;!Data Sizes:
;!    Strings     122
;!    Constant    27
;!    Data        35
;!    BSS         24
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     62      87
;!    BANK0           160      0      34
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0

;!
;!Pointer List with Targets:
;!
;!    alarm_text@p	PTR unsigned char  size(1) Largest target is 17
;!		 -> lcd_refresh@l2(COMRAM[17]), 
;!
;!    alarm_text@t	PTR const unsigned char  size(1) Largest target is 6
;!		 -> STR_1(CODE[6]), STR_2(CODE[6]), STR_3(CODE[6]), STR_4(CODE[6]), 
;!
;!    fmt3@p	PTR unsigned char  size(1) Largest target is 17
;!		 -> lcd_refresh@l1(COMRAM[17]), uart_num3@b(COMRAM[3]), 
;!
;!    lcd_line@s	PTR const unsigned char  size(1) Largest target is 17
;!		 -> lcd_refresh@l1(COMRAM[17]), lcd_refresh@l2(COMRAM[17]), 
;!
;!    lcd_refresh$562	PTR const unsigned char  size(1) Largest target is 5
;!		 -> STR_5(CODE[5]), STR_6(CODE[5]), 
;!
;!    lcd_refresh@m	PTR const unsigned char  size(1) Largest target is 5
;!		 -> STR_5(CODE[5]), STR_6(CODE[5]), 
;!
;!    pat_base	PTR const struct . size(1) Largest target is 9
;!		 -> alm_crit(CODE[9]), alm_fault(CODE[9]), alm_over(CODE[9]), NULL(NULL[0]), 
;!
;!    pat_cur	PTR const struct . size(1) Largest target is 9
;!		 -> alm_crit(CODE[9]), alm_fault(CODE[9]), alm_over(CODE[9]), NULL(NULL[0]), 
;!
;!    sound_alarm@pat	PTR const struct . size(1) Largest target is 9
;!		 -> alm_crit(CODE[9]), alm_fault(CODE[9]), alm_over(CODE[9]), NULL(NULL[0]), 
;!
;!    take@f	PTR volatile unsigned char  size(1) Largest target is 1
;!		 -> evt_ack(COMRAM[1]), evt_mode(COMRAM[1]), evt_pump(COMRAM[1]), 
;!
;!    uart_log$603	PTR const unsigned char  size(1) Largest target is 4
;!		 -> STR_10(CODE[4]), STR_11(CODE[4]), 
;!
;!    uart_log$608	PTR const unsigned char  size(1) Largest target is 5
;!		 -> STR_13(CODE[5]), STR_14(CODE[5]), 
;!
;!    uart_puts@s	PTR const unsigned char  size(1) Largest target is 13
;!		 -> STR_10(CODE[4]), STR_11(CODE[4]), STR_12(CODE[7]), STR_13(CODE[5]), 
;!		 -> STR_14(CODE[5]), STR_15(CODE[9]), STR_16(CODE[7]), STR_17(CODE[9]), 
;!		 -> STR_18(CODE[12]), STR_19(CODE[13]), STR_20(CODE[3]), STR_7(CODE[7]), 
;!		 -> STR_8(CODE[3]), STR_9(CODE[10]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_lcd_refresh
;!    _uart_log->_uart_num3
;!    _uart_puts->_uart_putc
;!    _uart_num3->_fmt3
;!    _sound_tick->_tone_on
;!    _tone_on->___lldiv
;!    _sample_level->___lldiv
;!    ___lldiv->___lmul
;!    _lcd_refresh->_fmt3
;!    _lcd_line->_lcd_cmd
;!    _fmt3->___lwmod
;!    ___lwmod->___lwdiv
;!    _lcd_init->_lcd_cmd
;!    _handle_buttons->_set_pump
;!    _handle_buttons->_take
;!    _control_step->_set_pump
;!
;!Critical Paths under _isr in COMRAM
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _isr in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _isr in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _isr in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _isr in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _isr in BANK7
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 3     3      0    3602
;!                                             59 COMRAM     3     3      0
;!                       _control_step
;!                     _handle_buttons
;!                            _hw_init
;!                           _lcd_init
;!                        _lcd_refresh
;!                       _sample_level
;!                         _sound_tick
;!                           _uart_log
;! ---------------------------------------------------------------------------------
;! (1) _uart_log                                             2     2      0     752
;!                                             20 COMRAM     2     2      0
;!                          _uart_num3
;!                          _uart_puts
;! ---------------------------------------------------------------------------------
;! (2) _uart_puts                                            1     0      1      86
;!                                              1 COMRAM     1     0      1
;!                          _uart_putc
;! ---------------------------------------------------------------------------------
;! (2) _uart_num3                                            5     3      2     618
;!                                             15 COMRAM     5     3      2
;!                               _fmt3
;!                          _uart_putc
;! ---------------------------------------------------------------------------------
;! (3) _uart_putc                                            1     1      0      29
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _sound_tick                                           3     3      0     372
;!                                             31 COMRAM     3     3      0
;!                           _tone_off
;!                            _tone_on
;! ---------------------------------------------------------------------------------
;! (2) _tone_on                                              6     4      2     282
;!                                             25 COMRAM     6     4      2
;!                            ___lldiv
;! ---------------------------------------------------------------------------------
;! (2) _tone_off                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _sample_level                                         7     7      0     379
;!                                             25 COMRAM     7     7      0
;!                            ___lldiv
;!                             ___lmul
;!                      _adc_read_once
;! ---------------------------------------------------------------------------------
;! (2) _adc_read_once                                        4     2      2       0
;!                                              0 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) ___lmul                                              12     4      8      96
;!                                              0 COMRAM    12     4      8
;! ---------------------------------------------------------------------------------
;! (3) ___lldiv                                             13     5      8     168
;!                                             12 COMRAM    13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _lcd_refresh                                         44    44      0    1363
;!                                             15 COMRAM    44    44      0
;!                         _alarm_text
;!                               _fmt3
;!                           _lcd_line
;! ---------------------------------------------------------------------------------
;! (2) _lcd_line                                             5     4      1     232
;!                                              2 COMRAM     5     4      1
;!                            _lcd_cmd
;!                           _lcd_putc
;! ---------------------------------------------------------------------------------
;! (3) _lcd_putc                                             1     1      0      29
;!                                              0 COMRAM     1     1      0
;!                          _lcd_pulse
;! ---------------------------------------------------------------------------------
;! (3) _fmt3                                                 3     0      3     469
;!                                             12 COMRAM     3     0      3
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (4) ___lwmod                                              5     1      4     165
;!                                              7 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (4) ___lwdiv                                              7     3      4     166
;!                                              0 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _alarm_text                                           4     3      1     139
;!                                              0 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             1     1      0      58
;!                                              2 COMRAM     1     1      0
;!                            _lcd_cmd
;!                          _lcd_pulse
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0      58
;!                                              0 COMRAM     2     2      0
;!                          _lcd_pulse
;! ---------------------------------------------------------------------------------
;! (4) _lcd_pulse                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _hw_init                                              3     3      0      45
;!                                              0 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (1) _handle_buttons                                       0     0      0     257
;!                           _set_pump
;!                        _sound_alarm
;!                               _take
;! ---------------------------------------------------------------------------------
;! (2) _take                                                 2     1      1      70
;!                                              0 COMRAM     2     1      1
;! ---------------------------------------------------------------------------------
;! (1) _control_step                                         3     3      0     304
;!                                              2 COMRAM     3     3      0
;!                           _set_pump
;!                        _sound_alarm
;! ---------------------------------------------------------------------------------
;! (2) _sound_alarm                                          1     0      1      71
;!                                              0 COMRAM     1     0      1
;! ---------------------------------------------------------------------------------
;! (2) _set_pump                                             2     2      0     116
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _isr                                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _control_step
;!     _set_pump
;!     _sound_alarm
;!   _handle_buttons
;!     _set_pump
;!     _sound_alarm
;!     _take
;!   _hw_init
;!   _lcd_init
;!     _lcd_cmd
;!       _lcd_pulse
;!     _lcd_pulse
;!   _lcd_refresh
;!     _alarm_text
;!     _fmt3
;!       ___lwdiv
;!       ___lwmod
;!         ___lwdiv (ARG)
;!     _lcd_line
;!       _lcd_cmd
;!       _lcd_putc
;!         _lcd_pulse
;!   _sample_level
;!     ___lldiv
;!       ___lmul (ARG)
;!     ___lmul
;!     _adc_read_once
;!   _sound_tick
;!     _tone_off
;!     _tone_on
;!       ___lldiv
;!   _uart_log
;!     _uart_num3
;!       _fmt3
;!       _uart_putc
;!     _uart_puts
;!       _uart_putc
;!
;! _isr (ROOT)
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BIGRAM            2047      0       0      0.0%
;!BITBANK7           256      0       0      0.0%
;!BANK7              256      0       0      0.0%
;!BITBANK6           256      0       0      0.0%
;!BANK6              256      0       0      0.0%
;!BITBANK5           256      0       0      0.0%
;!BANK5              256      0       0      0.0%
;!BITBANK4           256      0       0      0.0%
;!BANK4              256      0       0      0.0%
;!BITBANK3           256      0       0      0.0%
;!BANK3              256      0       0      0.0%
;!BITBANK2           256      0       0      0.0%
;!BANK2              256      0       0      0.0%
;!BITBANK1           256      0       0      0.0%
;!BANK1              256      0       0      0.0%
;!BITBANK0           160      0       0      0.0%
;!BANK0              160      0      34     21.2%
;!BITCOMRAM           94      0       0      0.0%
;!COMRAM              94     62      87     92.6%
;!BITBIGSFRh          82      0       0      0.0%
;!BITBIGSFRlll        33      0       0      0.0%
;!BITBIGSFRllh        28      0       0      0.0%
;!BITBIGSFRlh         13      0       0      0.0%
;!STACK                0      0       0      0.0%
;!DATA                 0      0     121      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 480 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  t_log           1   61[COMRAM] unsigned char 
;;  t_lcd           1   60[COMRAM] unsigned char 
;;  t_amostra       1   59[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_control_step
;;		_handle_buttons
;;		_hw_init
;;		_lcd_init
;;		_lcd_refresh
;;		_sample_level
;;		_sound_tick
;;		_uart_log
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"reservatorio.c"
	line	480
global __ptext0
__ptext0:
psect	text0
	file	"reservatorio.c"
	line	480
	
_main:
;incstack = 0
	callstack 26
	line	482
	
l2257:
	clrf	((c:main@t_amostra))^00h,c
	clrf	((c:main@t_lcd))^00h,c
	line	484
	clrf	((c:main@t_log))^00h,c
	line	487
	
l2259:
	call	_hw_init	;wreg free
	line	488
	call	_lcd_init	;wreg free
	line	489
	call	_sample_level	;wreg free
	line	490
	call	_control_step	;wreg free
	line	491
	
l2261:
	call	_lcd_refresh	;wreg free
	line	494
	
l2263:
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	495
	
l2265:
	clrf	((c:_evt_mode))^00h,c	;volatile
	
l2267:
	clrf	((c:_evt_pump))^00h,c	;volatile
	
l2269:
	clrf	((c:_evt_ack))^00h,c	;volatile
	line	496
	
l2271:
	bcf	((c:4082))^0f00h,c,1	;volatile
	
l2273:
	bcf	((c:4080))^0f00h,c,0	;volatile
	
l2275:
	bcf	((c:4080))^0f00h,c,1	;volatile
	line	497
	
l2277:
	clrf	((c:_ticks))^00h,c	;volatile
	line	498
	
l2279:
	bsf	((c:4082))^0f00h,c,7	;volatile
	goto	l2307
	line	501
	
l316:
	line	502
	bcf	((c:4082))^0f00h,c,7	;volatile
	
l2281:
	decf	((c:_ticks))^00h,c	;volatile
	
l2283:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	504
	
l2285:
	call	_handle_buttons	;wreg free
	line	505
	
l2287:
	call	_sound_tick	;wreg free
	line	507
	
l2289:
	incf	((c:main@t_amostra))^00h,c
		movlw	0Ah-1
	cpfsgt	((c:main@t_amostra))^00h,c
	goto	u1891
	goto	u1890

u1891:
	goto	l2301
u1890:
	line	508
	
l2291:
	clrf	((c:main@t_amostra))^00h,c
	line	509
	
l2293:
	call	_sample_level	;wreg free
	line	510
	call	_control_step	;wreg free
	line	512
	
l2295:
	incf	((c:main@t_log))^00h,c
		movlw	0Ah-1
	cpfsgt	((c:main@t_log))^00h,c
	goto	u1901
	goto	u1900

u1901:
	goto	l2301
u1900:
	
l2297:
	clrf	((c:main@t_log))^00h,c
	
l2299:
	call	_uart_log	;wreg free
	line	515
	
l2301:
	incf	((c:main@t_lcd))^00h,c
		movlw	014h-1
	cpfsgt	((c:main@t_lcd))^00h,c
	goto	u1911
	goto	u1910

u1911:
	goto	l2307
u1910:
	line	516
	
l2303:
	clrf	((c:main@t_lcd))^00h,c
	line	517
	
l2305:
	call	_lcd_refresh	;wreg free
	line	501
	
l2307:
	movf	((c:_ticks))^00h,c,w	;volatile
	btfss	status,2
	goto	u1921
	goto	u1920
u1921:
	goto	l316
u1920:
	goto	l2307
	global	start
	goto	start
	callstack 0
	line	521
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_log

;; *************** function _uart_log *****************
;; Defined at:
;;		line 244 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_uart_num3
;;		_uart_puts
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	244
global __ptext1
__ptext1:
psect	text1
	file	"reservatorio.c"
	line	244
	
_uart_log:
;incstack = 0
	callstack 27
	line	246
	
l2081:
		movlw	low(STR_7)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	
l2083:
	movff	(c:_level_pct),(c:uart_num3@v)
	clrf	((c:uart_num3@v+1))^00h,c
	call	_uart_num3	;wreg free
	
l2085:
		movlw	low(STR_8)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	247
	movff	(c:_level_cm),(c:uart_num3@v)
	movff	(c:_level_cm+1),(c:uart_num3@v+1)
	call	_uart_num3	;wreg free
	
l2087:
		movlw	low(STR_9)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	248
	
l2089:
	movf	((c:_pump_on))^00h,c,w
	btfss	status,2
	goto	u1461
	goto	u1460
u1461:
	goto	l2093
u1460:
	
l2091:
		movlw	low(STR_11)
	movwf	((c:_uart_log$603))^00h,c

	goto	l2095
	
l2093:
		movlw	low(STR_10)
	movwf	((c:_uart_log$603))^00h,c

	
l2095:
		movff	(c:_uart_log$603),(c:uart_puts@s)

	call	_uart_puts	;wreg free
	line	249
	
l2097:
		movlw	low(STR_12)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	
l2099:
	movf	((c:_auto_mode))^00h,c,w
	btfss	status,2
	goto	u1471
	goto	u1470
u1471:
	goto	l2103
u1470:
	
l2101:
		movlw	low(STR_14)
	movwf	((c:_uart_log$608))^00h,c

	goto	l2105
	
l2103:
		movlw	low(STR_13)
	movwf	((c:_uart_log$608))^00h,c

	
l2105:
		movff	(c:_uart_log$608),(c:uart_puts@s)

	call	_uart_puts	;wreg free
	line	250
	
l2107:
		movlw	low(STR_15)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	251
	
l2109:
	movf	((c:_alarms))^00h,c,w
	btfss	status,2
	goto	u1481
	goto	u1480
u1481:
	goto	l2113
u1480:
	
l2111:
		movlw	low(STR_16)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	252
	
l2113:
	
	btfss	((c:_alarms))^00h,c,(0)&7
	goto	u1491
	goto	u1490
u1491:
	goto	l2117
u1490:
	
l2115:
		movlw	low(STR_17)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	253
	
l2117:
	
	btfss	((c:_alarms))^00h,c,(1)&7
	goto	u1501
	goto	u1500
u1501:
	goto	l2121
u1500:
	
l2119:
		movlw	low(STR_18)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	254
	
l2121:
	
	btfss	((c:_alarms))^00h,c,(2)&7
	goto	u1511
	goto	u1510
u1511:
	goto	l223
u1510:
	
l2123:
		movlw	low(STR_19)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	
l223:
	line	255
		movlw	low(STR_20)
	movwf	((c:uart_puts@s))^00h,c

	call	_uart_puts	;wreg free
	line	256
	
l224:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_log
	__end_of_uart_log:
	signat	_uart_log,89
	global	_uart_puts

;; *************** function _uart_puts *****************
;; Defined at:
;;		line 238 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  s               1    1[COMRAM] PTR const unsigned char 
;;		 -> STR_20(3), STR_19(13), STR_18(12), STR_17(9), 
;;		 -> STR_16(7), STR_15(9), STR_14(5), STR_13(5), 
;;		 -> STR_12(7), STR_11(4), STR_10(4), STR_9(10), 
;;		 -> STR_8(3), STR_7(7), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_uart_putc
;; This function is called by:
;;		_uart_log
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	238
global __ptext2
__ptext2:
psect	text2
	file	"reservatorio.c"
	line	238
	
_uart_puts:
;incstack = 0
	callstack 27
	
l1917:
	goto	l1923
	
l1919:
	movff	(c:uart_puts@s),tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	
	call	_uart_putc
	
l1921:
	incf	((c:uart_puts@s))^00h,c
	
l1923:
	movff	(c:uart_puts@s),tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	iorlw	0
	btfss	status,2
	goto	u1241
	goto	u1240
u1241:
	goto	l1919
u1240:
	
l206:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_puts
	__end_of_uart_puts:
	signat	_uart_puts,4217
	global	_uart_num3

;; *************** function _uart_num3 *****************
;; Defined at:
;;		line 239 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  v               2   15[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  b               3   17[COMRAM] unsigned char [3]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         2       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_fmt3
;;		_uart_putc
;; This function is called by:
;;		_uart_log
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	239
global __ptext3
__ptext3:
psect	text3
	file	"reservatorio.c"
	line	239
	
_uart_num3:
;incstack = 0
	callstack 27
	line	241
	
l1925:
		movlw	low(uart_num3@b)
	movwf	((c:fmt3@p))^00h,c

	movff	(c:uart_num3@v),(c:fmt3@v)
	movff	(c:uart_num3@v+1),(c:fmt3@v+1)
	call	_fmt3	;wreg free
	line	242
	
l1927:
	movf	((c:uart_num3@b))^00h,c,w
	
	call	_uart_putc
	
l1929:
	movf	(0+((c:uart_num3@b)+01h))^00h,c,w
	
	call	_uart_putc
	
l1931:
	movf	(0+((c:uart_num3@b)+02h))^00h,c,w
	
	call	_uart_putc
	line	243
	
l209:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_num3
	__end_of_uart_num3:
	signat	_uart_num3,4217
	global	_uart_putc

;; *************** function _uart_putc *****************
;; Defined at:
;;		line 237 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_puts
;;		_uart_num3
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	237
global __ptext4
__ptext4:
psect	text4
	file	"reservatorio.c"
	line	237
	
_uart_putc:
;incstack = 0
	callstack 27
	movwf	((c:uart_putc@c))^00h,c
	
l1843:
	
l197:
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u1131
	goto	u1130
u1131:
	goto	l197
u1130:
	
l1845:
	movff	(c:uart_putc@c),(c:4013)	;volatile
	
l200:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_putc
	__end_of_uart_putc:
	signat	_uart_putc,4217
	global	_sound_tick

;; *************** function _sound_tick *****************
;; Defined at:
;;		line 307 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  f               2   32[COMRAM] unsigned short 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_tone_off
;;		_tone_on
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	307
global __ptext5
__ptext5:
psect	text5
	file	"reservatorio.c"
	line	307
	
_sound_tick:
;incstack = 0
	callstack 27
	line	309
	
l2125:
	clrf	((c:sound_tick@f+1))^00h,c
	movlw	low(0)
	movwf	((c:sound_tick@f))^00h,c
	line	311
	movf	((c:_pat_base))^00h,c,w
	btfsc	status,2
	goto	u1521
	goto	u1520
u1521:
	goto	l2141
u1520:
	line	312
	
l2127:
	movf	((c:_pat_left))^00h,c,w
	btfss	status,2
	goto	u1531
	goto	u1530
u1531:
	goto	l256
u1530:
	line	313
	
l2129:
	movff	(c:_pat_cur),??_sound_tick+0
	movlw	02h
	addwf	(??_sound_tick+0)^00h,c
	movff	??_sound_tick+0,tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	iorlw	0
	btfss	status,2
	goto	u1541
	goto	u1540
u1541:
	goto	l2133
u1540:
	
l2131:
		movff	(c:_pat_base),(c:_pat_cur)

	line	314
	
l2133:
	movff	(c:_pat_cur),??_sound_tick+0
	movlw	02h
	addwf	(??_sound_tick+0)^00h,c
	movff	??_sound_tick+0,tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:_pat_left)
	line	315
	
l2135:
	movff	(c:_pat_cur),tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:_pat_freq)
	tblrd*-
	
	movff	tablat,(c:_pat_freq+1)

	line	316
	
l2137:
	movlw	(03h)&0ffh
	addwf	((c:_pat_cur))^00h,c
	line	317
	
l256:
	line	318
	decf	((c:_pat_left))^00h,c
	line	319
	
l2139:
	movff	(c:_pat_freq),(c:sound_tick@f)
	movff	(c:_pat_freq+1),(c:sound_tick@f+1)
	line	322
	
l2141:
	movf	((c:sound_tick@f))^00h,c,w
iorwf	((c:sound_tick@f+1))^00h,c,w
	btfss	status,2
	goto	u1551
	goto	u1550

u1551:
	goto	l2149
u1550:
	line	323
	
l2143:
	movf	((c:_cur_freq))^00h,c,w
iorwf	((c:_cur_freq+1))^00h,c,w
	btfsc	status,2
	goto	u1561
	goto	u1560

u1561:
	goto	l262
u1560:
	
l2145:
	call	_tone_off	;wreg free
	
l2147:
	clrf	((c:_cur_freq+1))^00h,c
	movlw	low(0)
	movwf	((c:_cur_freq))^00h,c
	goto	l262
	line	324
	
l2149:
	movf	((c:_cur_freq))^00h,c,w
xorwf	((c:sound_tick@f))^00h,c,w
	bnz	u1570
movf	((c:_cur_freq+1))^00h,c,w
xorwf	((c:sound_tick@f+1))^00h,c,w
	btfsc	status,2
	goto	u1571
	goto	u1570

u1571:
	goto	l262
u1570:
	line	325
	
l2151:
	movff	(c:sound_tick@f),(c:tone_on@f)
	movff	(c:sound_tick@f+1),(c:tone_on@f+1)
	call	_tone_on	;wreg free
	line	326
	
l2153:
	movff	(c:sound_tick@f),(c:_cur_freq)
	movff	(c:sound_tick@f+1),(c:_cur_freq+1)
	line	328
	
l262:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sound_tick
	__end_of_sound_tick:
	signat	_sound_tick,89
	global	_tone_on

;; *************** function _tone_on *****************
;; Defined at:
;;		line 283 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  f               2   25[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  div             2   29[COMRAM] unsigned short 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         2       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		___lldiv
;; This function is called by:
;;		_sound_tick
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	283
global __ptext6
__ptext6:
psect	text6
	file	"reservatorio.c"
	line	283
	
_tone_on:
;incstack = 0
	callstack 27
	line	285
	
l1933:
	movlw	low(01E848h)
	movwf	((c:___lldiv@dividend))^00h,c
	movlw	high(01E848h)
	movwf	((c:___lldiv@dividend+1))^00h,c
	movlw	low highword(01E848h)
	movwf	((c:___lldiv@dividend+2))^00h,c
	movlw	high highword(01E848h)
	movwf	((c:___lldiv@dividend+3))^00h,c
	movff	(c:tone_on@f),(c:___lldiv@divisor)
	movff	(c:tone_on@f+1),(c:___lldiv@divisor+1)
	clrf	((c:___lldiv@divisor+2))^00h,c
	clrf	((c:___lldiv@divisor+3))^00h,c
	call	___lldiv	;wreg free
	movff	0+?___lldiv,(c:tone_on@div)
	movff	1+?___lldiv,(c:tone_on@div+1)
	line	286
	
l1935:
		decf	((c:tone_on@div))^00h,c,w
	movlw	1
	subwfb	((c:tone_on@div+1))^00h,c,w
	btfss	status,0
	goto	u1251
	goto	u1250

u1251:
	goto	l1939
u1250:
	
l1937:
	movlw	high(0100h)
	movwf	((c:tone_on@div+1))^00h,c
	movlw	low(0100h)
	movwf	((c:tone_on@div))^00h,c
	line	287
	
l1939:
		movf	((c:tone_on@div+1))^00h,c,w
	bnz	u1261
	movlw	2
	subwf	 ((c:tone_on@div))^00h,c,w
	btfsc	status,0
	goto	u1261
	goto	u1260

u1261:
	goto	l1943
u1260:
	
l1941:
	clrf	((c:tone_on@div+1))^00h,c
	movlw	low(02h)
	movwf	((c:tone_on@div))^00h,c
	line	288
	
l1943:
	decf	((c:tone_on@div))^00h,c,w
	movwf	((c:4043))^0f00h,c	;volatile
	line	289
	
l1945:
	bcf	status,0
	rrcf	((c:tone_on@div+1))^00h,c,w
	movwf	(??_tone_on+0+1)^00h,c
	rrcf	((c:tone_on@div))^00h,c,w
	movwf	(??_tone_on+0)^00h,c
	movf	(??_tone_on+0)^00h,c,w
	movwf	((c:4027))^0f00h,c	;volatile
	line	290
	movlw	low(0Ch)
	movwf	((c:4026))^0f00h,c	;volatile
	line	291
	
l245:
	return	;funcret
	callstack 0
GLOBAL	__end_of_tone_on
	__end_of_tone_on:
	signat	_tone_on,4217
	global	_tone_off

;; *************** function _tone_off *****************
;; Defined at:
;;		line 293 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sound_tick
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	293
global __ptext7
__ptext7:
psect	text7
	file	"reservatorio.c"
	line	293
	
_tone_off:
;incstack = 0
	callstack 28
	line	295
	
l1295:
	clrf	((c:4026))^0f00h,c	;volatile
	line	296
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	297
	
l248:
	return	;funcret
	callstack 0
GLOBAL	__end_of_tone_off
	__end_of_tone_off:
	signat	_tone_off,89
	global	_sample_level

;; *************** function _sample_level *****************
;; Defined at:
;;		line 226 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   31[COMRAM] unsigned char 
;;  adc             2   29[COMRAM] unsigned short 
;;  sum             2   27[COMRAM] unsigned short 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		___lldiv
;;		___lmul
;;		_adc_read_once
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	226
global __ptext8
__ptext8:
psect	text8
	file	"reservatorio.c"
	line	226
	
_sample_level:
;incstack = 0
	callstack 28
	line	228
	
l2061:
	clrf	((c:sample_level@sum+1))^00h,c
	movlw	low(0)
	movwf	((c:sample_level@sum))^00h,c
	line	229
	
l2063:
	clrf	((c:sample_level@i))^00h,c
	
l2069:
	call	_adc_read_once	;wreg free
	movf	(0+?_adc_read_once)^00h,c,w
	addwf	((c:sample_level@sum))^00h,c
	movf	(1+?_adc_read_once)^00h,c,w
	addwfc	((c:sample_level@sum+1))^00h,c
	
l2071:
	incf	((c:sample_level@i))^00h,c
	
l2073:
		movlw	04h-1
	cpfsgt	((c:sample_level@i))^00h,c
	goto	u1451
	goto	u1450

u1451:
	goto	l2069
u1450:
	line	230
	
l2075:
	movff	(c:sample_level@sum),??_sample_level+0
	movff	(c:sample_level@sum+1),??_sample_level+0+1
	bcf	status,0
	rrcf	(??_sample_level+0+1)^00h,c
	rrcf	(??_sample_level+0)^00h,c
	bcf	status,0
	rrcf	(??_sample_level+0+1)^00h,c
	rrcf	(??_sample_level+0)^00h,c
	movff	??_sample_level+0,(c:sample_level@adc)
	movff	??_sample_level+0+1,(c:sample_level@adc+1)
	line	231
	
l2077:
	movff	(c:sample_level@adc),(c:___lmul@multiplier)
	movff	(c:sample_level@adc+1),(c:___lmul@multiplier+1)
	clrf	((c:___lmul@multiplier+2))^00h,c
	clrf	((c:___lmul@multiplier+3))^00h,c
	movlw	low(064h)
	movwf	((c:___lmul@multiplicand))^00h,c
	movlw	high(064h)
	movwf	((c:___lmul@multiplicand+1))^00h,c
	movlw	low highword(064h)
	movwf	((c:___lmul@multiplicand+2))^00h,c
	movlw	high highword(064h)
	movwf	((c:___lmul@multiplicand+3))^00h,c
	call	___lmul	;wreg free
	movlw	0FFh
	addwf	(0+?___lmul)^00h,c,w
	movwf	((c:___lldiv@dividend))^00h,c
	movlw	01h
	addwfc	(1+?___lmul)^00h,c,w
	movwf	1+((c:___lldiv@dividend))^00h,c
	
	movlw	0
	addwfc	(2+?___lmul)^00h,c,w
	movwf	2+((c:___lldiv@dividend))^00h,c
	
	movlw	0
	addwfc	(3+?___lmul)^00h,c,w
	movwf	3+((c:___lldiv@dividend))^00h,c
	movlw	low(03FFh)
	movwf	((c:___lldiv@divisor))^00h,c
	movlw	high(03FFh)
	movwf	((c:___lldiv@divisor+1))^00h,c
	movlw	low highword(03FFh)
	movwf	((c:___lldiv@divisor+2))^00h,c
	movlw	high highword(03FFh)
	movwf	((c:___lldiv@divisor+3))^00h,c
	call	___lldiv	;wreg free
	movf	(0+?___lldiv)^00h,c,w
	movwf	((c:_level_pct))^00h,c
	line	232
	
l2079:
	movff	(c:sample_level@adc),(c:___lmul@multiplier)
	movff	(c:sample_level@adc+1),(c:___lmul@multiplier+1)
	clrf	((c:___lmul@multiplier+2))^00h,c
	clrf	((c:___lmul@multiplier+3))^00h,c
	movlw	low(0C8h)
	movwf	((c:___lmul@multiplicand))^00h,c
	movlw	high(0C8h)
	movwf	((c:___lmul@multiplicand+1))^00h,c
	movlw	low highword(0C8h)
	movwf	((c:___lmul@multiplicand+2))^00h,c
	movlw	high highword(0C8h)
	movwf	((c:___lmul@multiplicand+3))^00h,c
	call	___lmul	;wreg free
	movlw	0FFh
	addwf	(0+?___lmul)^00h,c,w
	movwf	((c:___lldiv@dividend))^00h,c
	movlw	01h
	addwfc	(1+?___lmul)^00h,c,w
	movwf	1+((c:___lldiv@dividend))^00h,c
	
	movlw	0
	addwfc	(2+?___lmul)^00h,c,w
	movwf	2+((c:___lldiv@dividend))^00h,c
	
	movlw	0
	addwfc	(3+?___lmul)^00h,c,w
	movwf	3+((c:___lldiv@dividend))^00h,c
	movlw	low(03FFh)
	movwf	((c:___lldiv@divisor))^00h,c
	movlw	high(03FFh)
	movwf	((c:___lldiv@divisor+1))^00h,c
	movlw	low highword(03FFh)
	movwf	((c:___lldiv@divisor+2))^00h,c
	movlw	high highword(03FFh)
	movwf	((c:___lldiv@divisor+3))^00h,c
	call	___lldiv	;wreg free
	movff	0+?___lldiv,(c:_level_cm)
	movff	1+?___lldiv,(c:_level_cm+1)
	line	233
	
l194:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sample_level
	__end_of_sample_level:
	signat	_sample_level,89
	global	_adc_read_once

;; *************** function _adc_read_once *****************
;; Defined at:
;;		line 218 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned short 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         2       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sample_level
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	218
global __ptext9
__ptext9:
psect	text9
	file	"reservatorio.c"
	line	218
	
_adc_read_once:
;incstack = 0
	callstack 28
	line	220
	
l1909:
	asmopt push
asmopt off
	movlw	13
u1937:
decfsz	wreg,f
	bra	u1937
	nop
asmopt pop

	line	221
	
l1911:
	bsf	((c:4034))^0f00h,c,1	;volatile
	line	222
	
l186:
	btfsc	((c:4034))^0f00h,c,1	;volatile
	goto	u1231
	goto	u1230
u1231:
	goto	l186
u1230:
	line	223
	
l1913:
	movf	((c:4036))^0f00h,c,w	;volatile
	movwf	(??_adc_read_once+0)^00h,c
	movf	((c:4035))^0f00h,c,w	;volatile
	movwf	((c:?_adc_read_once))^00h,c
	movff	??_adc_read_once+0,((c:?_adc_read_once+1))
	line	224
	
l189:
	return	;funcret
	callstack 0
GLOBAL	__end_of_adc_read_once
	__end_of_adc_read_once:
	signat	_adc_read_once,90
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "/opt/microchip/xc8/v4.00/pic/sources/c99/common/Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMRAM] unsigned long 
;;  multiplicand    4    4[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[COMRAM] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         8       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sample_level
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=1
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/Umul32.c"
	line	15
global __ptext10
__ptext10:
psect	text10
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/Umul32.c"
	line	15
	
___lmul:
;incstack = 0
	callstack 28
	line	119
	
l1973:
	movlw	low(0)
	movwf	((c:___lmul@product))^00h,c
	movlw	high(0)
	movwf	((c:___lmul@product+1))^00h,c
	movlw	low highword(0)
	movwf	((c:___lmul@product+2))^00h,c
	movlw	high highword(0)
	movwf	((c:___lmul@product+3))^00h,c
	line	121
	
l1975:
	
	btfss	((c:___lmul@multiplier))^00h,c,(0)&7
	goto	u1361
	goto	u1360
u1361:
	goto	l1979
u1360:
	line	122
	
l1977:
	movf	((c:___lmul@multiplicand))^00h,c,w
	addwf	((c:___lmul@product))^00h,c
	movf	((c:___lmul@multiplicand+1))^00h,c,w
	addwfc	((c:___lmul@product+1))^00h,c
	movf	((c:___lmul@multiplicand+2))^00h,c,w
	addwfc	((c:___lmul@product+2))^00h,c
	movf	((c:___lmul@multiplicand+3))^00h,c,w
	addwfc	((c:___lmul@product+3))^00h,c
	line	123
	
l1979:
	bcf	status,0
	rlcf	((c:___lmul@multiplicand))^00h,c
	rlcf	((c:___lmul@multiplicand+1))^00h,c
	rlcf	((c:___lmul@multiplicand+2))^00h,c
	rlcf	((c:___lmul@multiplicand+3))^00h,c
	line	124
	
l1981:
	bcf	status,0
	rrcf	((c:___lmul@multiplier+3))^00h,c
	rrcf	((c:___lmul@multiplier+2))^00h,c
	rrcf	((c:___lmul@multiplier+1))^00h,c
	rrcf	((c:___lmul@multiplier))^00h,c
	line	125
	movf	((c:___lmul@multiplier))^00h,c,w
iorwf	((c:___lmul@multiplier+1))^00h,c,w
iorwf	((c:___lmul@multiplier+2))^00h,c,w
iorwf	((c:___lmul@multiplier+3))^00h,c,w
	btfss	status,2
	goto	u1371
	goto	u1370

u1371:
	goto	l1975
u1370:
	
l337:
	line	128
	movff	(c:___lmul@product),(c:?___lmul)
	movff	(c:___lmul@product+1),(c:?___lmul+1)
	movff	(c:___lmul@product+2),(c:?___lmul+2)
	movff	(c:___lmul@product+3),(c:?___lmul+3)
	line	129
	
l338:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 7 in file "/opt/microchip/xc8/v4.00/pic/sources/c99/common/__lldiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        4   12[COMRAM] unsigned long 
;;  divisor         4   16[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   20[COMRAM] unsigned long 
;;  counter         1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   12[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         8       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:        13       0       0       0       0       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sample_level
;;		_tone_on
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=1
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/__lldiv.c"
	line	7
global __ptext11
__ptext11:
psect	text11
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/__lldiv.c"
	line	7
	
___lldiv:
;incstack = 0
	callstack 27
	line	13
	
l1847:
	movlw	low(0)
	movwf	((c:___lldiv@quotient))^00h,c
	movlw	high(0)
	movwf	((c:___lldiv@quotient+1))^00h,c
	movlw	low highword(0)
	movwf	((c:___lldiv@quotient+2))^00h,c
	movlw	high highword(0)
	movwf	((c:___lldiv@quotient+3))^00h,c
	line	14
	
l1849:
	movf	((c:___lldiv@divisor))^00h,c,w
iorwf	((c:___lldiv@divisor+1))^00h,c,w
iorwf	((c:___lldiv@divisor+2))^00h,c,w
iorwf	((c:___lldiv@divisor+3))^00h,c,w
	btfsc	status,2
	goto	u1141
	goto	u1140

u1141:
	goto	l353
u1140:
	line	15
	
l1851:
	movlw	low(01h)
	movwf	((c:___lldiv@counter))^00h,c
	line	16
	goto	l1855
	line	17
	
l1853:
	bcf	status,0
	rlcf	((c:___lldiv@divisor))^00h,c
	rlcf	((c:___lldiv@divisor+1))^00h,c
	rlcf	((c:___lldiv@divisor+2))^00h,c
	rlcf	((c:___lldiv@divisor+3))^00h,c
	line	18
	incf	((c:___lldiv@counter))^00h,c
	line	16
	
l1855:
	
	btfss	((c:___lldiv@divisor+3))^00h,c,(31)&7
	goto	u1151
	goto	u1150
u1151:
	goto	l1853
u1150:
	line	21
	
l1857:
	bcf	status,0
	rlcf	((c:___lldiv@quotient))^00h,c
	rlcf	((c:___lldiv@quotient+1))^00h,c
	rlcf	((c:___lldiv@quotient+2))^00h,c
	rlcf	((c:___lldiv@quotient+3))^00h,c
	line	22
	
l1859:
		movf	((c:___lldiv@divisor))^00h,c,w
	subwf	((c:___lldiv@dividend))^00h,c,w
	movf	((c:___lldiv@divisor+1))^00h,c,w
	subwfb	((c:___lldiv@dividend+1))^00h,c,w
	movf	((c:___lldiv@divisor+2))^00h,c,w
	subwfb	((c:___lldiv@dividend+2))^00h,c,w
	movf	((c:___lldiv@divisor+3))^00h,c,w
	subwfb	((c:___lldiv@dividend+3))^00h,c,w
	btfss	status,0
	goto	u1161
	goto	u1160

u1161:
	goto	l1865
u1160:
	line	23
	
l1861:
	movf	((c:___lldiv@divisor))^00h,c,w
	subwf	((c:___lldiv@dividend))^00h,c
	movf	((c:___lldiv@divisor+1))^00h,c,w
	subwfb	((c:___lldiv@dividend+1))^00h,c
	movf	((c:___lldiv@divisor+2))^00h,c,w
	subwfb	((c:___lldiv@dividend+2))^00h,c
	movf	((c:___lldiv@divisor+3))^00h,c,w
	subwfb	((c:___lldiv@dividend+3))^00h,c
	line	24
	
l1863:
	bsf	(0+(0/8)+(c:___lldiv@quotient))^00h,c,(0)&7
	line	26
	
l1865:
	bcf	status,0
	rrcf	((c:___lldiv@divisor+3))^00h,c
	rrcf	((c:___lldiv@divisor+2))^00h,c
	rrcf	((c:___lldiv@divisor+1))^00h,c
	rrcf	((c:___lldiv@divisor))^00h,c
	line	27
	
l1867:
	decfsz	((c:___lldiv@counter))^00h,c
	
	goto	l1857
	line	28
	
l353:
	line	29
	movff	(c:___lldiv@quotient),(c:?___lldiv)
	movff	(c:___lldiv@quotient+1),(c:?___lldiv+1)
	movff	(c:___lldiv@quotient+2),(c:?___lldiv+2)
	movff	(c:___lldiv@quotient+3),(c:?___lldiv+3)
	line	30
	
l360:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_lcd_refresh

;; *************** function _lcd_refresh *****************
;; Defined at:
;;		line 195 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   58[COMRAM] unsigned char 
;;  l2             17   33[COMRAM] unsigned char [17]
;;  l1             17   16[COMRAM] unsigned char [17]
;;  m               1   56[COMRAM] PTR const unsigned char 
;;		 -> STR_6(5), STR_5(5), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:        43       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:        44       0       0       0       0       0       0       0       0
;;Total ram usage:       44 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_alarm_text
;;		_fmt3
;;		_lcd_line
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	file	"reservatorio.c"
	line	195
global __ptext12
__ptext12:
psect	text12
	file	"reservatorio.c"
	line	195
	
_lcd_refresh:
;incstack = 0
	callstack 26
	line	197
	
l2011:
	lfsr	2,(lcd_refresh@F3377)
	lfsr	1,(lcd_refresh@l1)
	movlw	17-1
u1381:
	movff	plusw2,plusw1
	decf	wreg
	bc	u1381

	line	198
	lfsr	2,(lcd_refresh@F3379)
	lfsr	1,(lcd_refresh@l2)
	movlw	17-1
u1391:
	movff	plusw2,plusw1
	decf	wreg
	bc	u1391

	line	200
	
l2013:
		movlw	low(lcd_refresh@l1+06h)
	movwf	((c:fmt3@p))^00h,c

	movff	(c:_level_pct),(c:fmt3@v)
	clrf	((c:fmt3@v+1))^00h,c
	call	_fmt3	;wreg free
	line	201
	
l2015:
		movlw	low(lcd_refresh@l1+0Bh)
	movwf	((c:fmt3@p))^00h,c

	movff	(c:_level_cm),(c:fmt3@v)
	movff	(c:_level_cm+1),(c:fmt3@v+1)
	call	_fmt3	;wreg free
	line	204
	
l2017:
	movf	((c:_auto_mode))^00h,c,w
	btfss	status,2
	goto	u1401
	goto	u1400
u1401:
	goto	l2021
u1400:
	
l2019:
		movlw	low(STR_6)
	movwf	((c:_lcd_refresh$562))^00h,c

	goto	l168
	
l2021:
		movlw	low(STR_5)
	movwf	((c:_lcd_refresh$562))^00h,c

	
l168:
		movff	(c:_lcd_refresh$562),(c:lcd_refresh@m)

	line	205
	
l2023:
	clrf	((c:lcd_refresh@i))^00h,c
	
l2027:
	movf	((c:lcd_refresh@m))^00h,c,w
	addwf	((c:lcd_refresh@i))^00h,c,w
	movwf	(??_lcd_refresh+0)^00h,c
	movff	(??_lcd_refresh+0),tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	movf	((c:lcd_refresh@i))^00h,c,w
	addlw	low(lcd_refresh@l2)
	movwf	fsr2l
	clrf	fsr2h
	tblrd	*
	
	movff	tablat,indf2
	
l2029:
	incf	((c:lcd_refresh@i))^00h,c
	
l2031:
		movlw	04h-1
	cpfsgt	((c:lcd_refresh@i))^00h,c
	goto	u1411
	goto	u1410

u1411:
	goto	l2027
u1410:
	line	206
	
l2033:
	movlw	low(020h)
	movwf	(0+((c:lcd_refresh@l2)+04h))^00h,c
	movlw	low(042h)
	movwf	(0+((c:lcd_refresh@l2)+05h))^00h,c
	movlw	low(03Ah)
	movwf	(0+((c:lcd_refresh@l2)+06h))^00h,c
	line	207
	movlw	low(04Fh)
	movwf	(0+((c:lcd_refresh@l2)+07h))^00h,c
	line	208
	movf	((c:_pump_on))^00h,c,w
	btfss	status,2
	goto	u1421
	goto	u1420
u1421:
	goto	l2037
u1420:
	
l2035:
	clrf	((c:_lcd_refresh$564+1))^00h,c
	movlw	low(046h)
	movwf	((c:_lcd_refresh$564))^00h,c
	goto	l2039
	
l2037:
	clrf	((c:_lcd_refresh$564+1))^00h,c
	movlw	low(04Eh)
	movwf	((c:_lcd_refresh$564))^00h,c
	
l2039:
	movff	(c:_lcd_refresh$564),0+((c:lcd_refresh@l2)+08h)
	line	209
	movf	((c:_pump_on))^00h,c,w
	btfss	status,2
	goto	u1431
	goto	u1430
u1431:
	goto	l2043
u1430:
	
l2041:
	clrf	((c:_lcd_refresh$565+1))^00h,c
	movlw	low(046h)
	movwf	((c:_lcd_refresh$565))^00h,c
	goto	l2045
	
l2043:
	clrf	((c:_lcd_refresh$565+1))^00h,c
	movlw	low(020h)
	movwf	((c:_lcd_refresh$565))^00h,c
	
l2045:
	movff	(c:_lcd_refresh$565),0+((c:lcd_refresh@l2)+09h)
	line	210
	
l2047:
	movf	((c:_ack_mask))^00h,c,w
	xorlw	0ffh
	andwf	((c:_alarms))^00h,c,w
	iorlw	0
	btfss	status,2
	goto	u1441
	goto	u1440
u1441:
	goto	l2051
u1440:
	
l2049:
	clrf	((c:_lcd_refresh$566+1))^00h,c
	movlw	low(020h)
	movwf	((c:_lcd_refresh$566))^00h,c
	goto	l2053
	
l2051:
	clrf	((c:_lcd_refresh$566+1))^00h,c
	movlw	low(021h)
	movwf	((c:_lcd_refresh$566))^00h,c
	
l2053:
	movff	(c:_lcd_refresh$566),0+((c:lcd_refresh@l2)+0Ah)
	line	211
	
l2055:
		movlw	low(lcd_refresh@l2+0Bh)
	movwf	((c:alarm_text@p))^00h,c

	call	_alarm_text	;wreg free
	line	213
	
l2057:
		movlw	low(lcd_refresh@l1)
	movwf	((c:lcd_line@s))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_line
	line	214
	
l2059:
		movlw	low(lcd_refresh@l2)
	movwf	((c:lcd_line@s))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_line
	line	215
	
l183:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_refresh
	__end_of_lcd_refresh:
	signat	_lcd_refresh,89
	global	_lcd_line

;; *************** function _lcd_line *****************
;; Defined at:
;;		line 173 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  s               1    2[COMRAM] PTR const unsigned char 
;;		 -> lcd_refresh@l2(17), lcd_refresh@l1(17), 
;; Auto vars:     Size  Location     Type
;;  row             1    3[COMRAM] unsigned char 
;;  i               1    6[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;;		_lcd_putc
;; This function is called by:
;;		_lcd_refresh
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	173
global __ptext13
__ptext13:
psect	text13
	file	"reservatorio.c"
	line	173
	
_lcd_line:
;incstack = 0
	callstack 26
	line	175
	movwf	((c:lcd_line@row))^00h,c
	
l1869:
	movf	((c:lcd_line@row))^00h,c,w
	btfss	status,2
	goto	u1171
	goto	u1170
u1171:
	goto	l1873
u1170:
	
l1871:
	clrf	((c:_lcd_line$538+1))^00h,c
	movlw	low(080h)
	movwf	((c:_lcd_line$538))^00h,c
	goto	l1875
	
l1873:
	clrf	((c:_lcd_line$538+1))^00h,c
	movlw	low(0C0h)
	movwf	((c:_lcd_line$538))^00h,c
	
l1875:
	movf	((c:_lcd_line$538))^00h,c,w
	
	call	_lcd_cmd
	line	176
	
l1877:
	clrf	((c:lcd_line@i))^00h,c
	
l1883:
	movf	((c:lcd_line@s))^00h,c,w
	addwf	((c:lcd_line@i))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_lcd_putc
	
l1885:
	incf	((c:lcd_line@i))^00h,c
	
l1887:
		movlw	010h-1
	cpfsgt	((c:lcd_line@i))^00h,c
	goto	u1181
	goto	u1180

u1181:
	goto	l1883
u1180:
	line	177
	
l145:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_line
	__end_of_lcd_line:
	signat	_lcd_line,8313
	global	_lcd_putc

;; *************** function _lcd_putc *****************
;; Defined at:
;;		line 153 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_lcd_pulse
;; This function is called by:
;;		_lcd_line
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	153
global __ptext14
__ptext14:
psect	text14
	file	"reservatorio.c"
	line	153
	
_lcd_putc:
;incstack = 0
	callstack 26
	line	155
	movwf	((c:lcd_putc@c))^00h,c
	
l1835:
	bsf	((c:3981))^0f00h,c,2	;volatile
	line	156
	
l1837:
	movff	(c:lcd_putc@c),(c:3980)	;volatile
	line	157
	
l1839:
	call	_lcd_pulse	;wreg free
	line	158
	
l133:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_putc
	__end_of_lcd_putc:
	signat	_lcd_putc,4217
	global	_fmt3

;; *************** function _fmt3 *****************
;; Defined at:
;;		line 179 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  p               1   12[COMRAM] PTR unsigned char 
;;		 -> uart_num3@b(3), lcd_refresh@l1(17), 
;;  v               2   13[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         3       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_lcd_refresh
;;		_uart_num3
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	179
global __ptext15
__ptext15:
psect	text15
	file	"reservatorio.c"
	line	179
	
_fmt3:
;incstack = 0
	callstack 27
	line	181
	
l1841:
	movf	((c:fmt3@p))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(064h)
	movwf	((c:___lwdiv@divisor))^00h,c
	movff	(c:fmt3@v),(c:___lwdiv@dividend)
	movff	(c:fmt3@v+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	clrf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	addlw	low(030h)
	movwf	indf2,c

	line	182
	movf	((c:fmt3@p))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(01h)
	addwf	fsr2l

	clrf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwdiv@divisor))^00h,c
	movff	(c:fmt3@v),(c:___lwdiv@dividend)
	movff	(c:fmt3@v+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	clrf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	addlw	low(030h)
	movwf	indf2,c

	line	183
	movf	((c:fmt3@p))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(02h)
	addwf	fsr2l

	movff	(c:fmt3@v),(c:___lwmod@dividend)
	movff	(c:fmt3@v+1),(c:___lwmod@dividend+1)
	clrf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	addlw	low(030h)
	movwf	indf2,c

	line	184
	
l148:
	return	;funcret
	callstack 0
GLOBAL	__end_of_fmt3
	__end_of_fmt3:
	signat	_fmt3,8313
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 7 in file "/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    7[COMRAM] unsigned int 
;;  divisor         2    9[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_fmt3
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=1
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwmod.c"
	line	7
global __ptext16
__ptext16:
psect	text16
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 26
	line	12
	
l1809:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1091
	goto	u1090

u1091:
	goto	l937
u1090:
	line	13
	
l1811:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l1815
	line	15
	
l1813:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l1815:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l1813
u1100:
	line	19
	
l1817:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1111
	goto	u1110

u1111:
	goto	l1821
u1110:
	line	20
	
l1819:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c
	line	21
	
l1821:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l1823:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l1817
	line	23
	
l937:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l944:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 7 in file "/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    0[COMRAM] unsigned int 
;;  divisor         2    2[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    4[COMRAM] unsigned int 
;;  counter         1    6[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_fmt3
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=1
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwdiv.c"
	line	7
global __ptext17
__ptext17:
psect	text17
	file	"/opt/microchip/xc8/v4.00/pic/sources/c99/common/lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 26
	line	13
	
l1787:
	clrf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l1789:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1061
	goto	u1060

u1061:
	goto	l927
u1060:
	line	15
	
l1791:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l1795
	line	17
	
l1793:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l1795:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l1793
u1070:
	line	21
	
l1797:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l1799:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1081
	goto	u1080

u1081:
	goto	l1805
u1080:
	line	23
	
l1801:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c
	line	24
	
l1803:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l1805:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l1807:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l1797
	line	28
	
l927:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l934:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_alarm_text

;; *************** function _alarm_text *****************
;; Defined at:
;;		line 186 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  p               1    0[COMRAM] PTR unsigned char 
;;		 -> lcd_refresh@l2(17), 
;; Auto vars:     Size  Location     Type
;;  i               1    3[COMRAM] unsigned char 
;;  t               1    2[COMRAM] PTR const unsigned char 
;;		 -> STR_4(6), STR_3(6), STR_2(6), STR_1(6), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_refresh
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=0
	file	"reservatorio.c"
	line	186
global __ptext18
__ptext18:
psect	text18
	file	"reservatorio.c"
	line	186
	
_alarm_text:
;incstack = 0
	callstack 28
	line	188
	
l1889:
		movlw	low(STR_1)
	movwf	((c:alarm_text@t))^00h,c

	line	189
	
l1891:
	
	btfss	((c:_alarms))^00h,c,(2)&7
	goto	u1191
	goto	u1190
u1191:
	goto	l151
u1190:
	
l1893:
		movlw	low(STR_2)
	movwf	((c:alarm_text@t))^00h,c

	goto	l1899
	line	190
	
l151:
	
	btfss	((c:_alarms))^00h,c,(1)&7
	goto	u1201
	goto	u1200
u1201:
	goto	l153
u1200:
	
l1895:
		movlw	low(STR_3)
	movwf	((c:alarm_text@t))^00h,c

	goto	l1899
	line	191
	
l153:
	
	btfss	((c:_alarms))^00h,c,(0)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l1899
u1210:
	
l1897:
		movlw	low(STR_4)
	movwf	((c:alarm_text@t))^00h,c

	line	192
	
l1899:
	clrf	((c:alarm_text@i))^00h,c
	
l1903:
	movf	((c:alarm_text@t))^00h,c,w
	addwf	((c:alarm_text@i))^00h,c,w
	movwf	(??_alarm_text+0)^00h,c
	movff	(??_alarm_text+0),tblptrl
	if	0	;There is only one active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	movf	((c:alarm_text@p))^00h,c,w
	addwf	((c:alarm_text@i))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	tblrd	*
	
	movff	tablat,indf2
	
l1905:
	incf	((c:alarm_text@i))^00h,c
	
l1907:
		movlw	05h-1
	cpfsgt	((c:alarm_text@i))^00h,c
	goto	u1221
	goto	u1220

u1221:
	goto	l1903
u1220:
	line	193
	
l158:
	return	;funcret
	callstack 0
GLOBAL	__end_of_alarm_text
	__end_of_alarm_text:
	signat	_alarm_text,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 160 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;;		_lcd_pulse
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	160
global __ptext19
__ptext19:
psect	text19
	file	"reservatorio.c"
	line	160
	
_lcd_init:
;incstack = 0
	callstack 27
	line	162
	
l1983:
	bcf	((c:3981))^0f00h,c,1	;volatile
	bcf	((c:3981))^0f00h,c,2	;volatile
	line	163
	
l1985:
	asmopt push
asmopt off
movlw	104
movwf	(??_lcd_init+0)^00h,c
	movlw	228
u1947:
decfsz	wreg,f
	bra	u1947
	decfsz	(??_lcd_init+0)^00h,c,f
	bra	u1947
	nop2
asmopt pop

	line	164
	
l1987:
	movlw	low(038h)
	movwf	((c:3980))^0f00h,c	;volatile
	
l1989:
	call	_lcd_pulse	;wreg free
	
l1991:
	asmopt push
asmopt off
movlw	13
movwf	(??_lcd_init+0)^00h,c
	movlw	252
u1957:
decfsz	wreg,f
	bra	u1957
	decfsz	(??_lcd_init+0)^00h,c,f
	bra	u1957
asmopt pop

	line	165
	
l1993:
	movlw	low(038h)
	movwf	((c:3980))^0f00h,c	;volatile
	call	_lcd_pulse	;wreg free
	
l1995:
	asmopt push
asmopt off
movlw	3
movwf	(??_lcd_init+0)^00h,c
	movlw	152
u1967:
decfsz	wreg,f
	bra	u1967
	decfsz	(??_lcd_init+0)^00h,c,f
	bra	u1967
asmopt pop

	line	166
	
l1997:
	movlw	low(038h)
	movwf	((c:3980))^0f00h,c	;volatile
	
l1999:
	call	_lcd_pulse	;wreg free
	
l2001:
	asmopt push
asmopt off
movlw	3
movwf	(??_lcd_init+0)^00h,c
	movlw	152
u1977:
decfsz	wreg,f
	bra	u1977
	decfsz	(??_lcd_init+0)^00h,c,f
	bra	u1977
asmopt pop

	line	167
	
l2003:
	movlw	(038h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l2005:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	169
	
l2007:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	170
	
l2009:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	171
	
l136:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 145 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_lcd_pulse
;; This function is called by:
;;		_lcd_init
;;		_lcd_line
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	145
global __ptext20
__ptext20:
psect	text20
	file	"reservatorio.c"
	line	145
	
_lcd_cmd:
;incstack = 0
	callstack 27
	line	147
	movwf	((c:lcd_cmd@c))^00h,c
	
l1825:
	bcf	((c:3981))^0f00h,c,2	;volatile
	line	148
	
l1827:
	movff	(c:lcd_cmd@c),(c:3980)	;volatile
	line	149
	
l1829:
	call	_lcd_pulse	;wreg free
	line	150
	
l1831:
		movlw	04h-0
	cpfslt	((c:lcd_cmd@c))^00h,c
	goto	u1121
	goto	u1120

u1121:
	goto	l130
u1120:
	
l1833:
	asmopt push
asmopt off
movlw	8
movwf	(??_lcd_cmd+0)^00h,c
	movlw	202
u1987:
decfsz	wreg,f
	bra	u1987
	decfsz	(??_lcd_cmd+0)^00h,c,f
	bra	u1987
asmopt pop

	line	151
	
l130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_pulse

;; *************** function _lcd_pulse *****************
;; Defined at:
;;		line 139 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_putc
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	139
global __ptext21
__ptext21:
psect	text21
	file	"reservatorio.c"
	line	139
	
_lcd_pulse:
;incstack = 0
	callstack 26
	line	141
	
l1781:
	bsf	((c:3981))^0f00h,c,1	;volatile
	
l1783:
	asmopt push
asmopt off
	movlw	3
u1997:
decfsz	wreg,f
	bra	u1997
	nop
asmopt pop

	line	142
	
l1785:
	bcf	((c:3981))^0f00h,c,1	;volatile
	asmopt push
asmopt off
	movlw	40
u2007:
decfsz	wreg,f
	bra	u2007
asmopt pop

	line	143
	
l126:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_pulse
	__end_of_lcd_pulse:
	signat	_lcd_pulse,89
	global	_hw_init

;; *************** function _hw_init *****************
;; Defined at:
;;		line 422 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idle            1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	422
global __ptext22
__ptext22:
psect	text22
	file	"reservatorio.c"
	line	422
	
_hw_init:
;incstack = 0
	callstack 29
	line	424
	
l1607:
	movlw	low(0Eh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	425
	movlw	low(07h)
	movwf	((c:4020))^0f00h,c	;volatile
	line	426
	movlw	low(091h)
	movwf	((c:4032))^0f00h,c	;volatile
	line	427
	movlw	low(01h)
	movwf	((c:4034))^0f00h,c	;volatile
	line	429
	movlw	low(01h)
	movwf	((c:3986))^0f00h,c	;volatile
	
l1609:
	clrf	((c:3977))^0f00h,c	;volatile
	line	431
	movlw	low(07h)
	movwf	((c:3987))^0f00h,c	;volatile
	
l1611:
	clrf	((c:3978))^0f00h,c	;volatile
	line	432
	movlw	low(0FCh)
	movwf	((c:3988))^0f00h,c	;volatile
	
l1613:
	clrf	((c:3979))^0f00h,c	;volatile
	line	433
	
l1615:
	clrf	((c:3989))^0f00h,c	;volatile
	
l1617:
	clrf	((c:3980))^0f00h,c	;volatile
	line	434
	
l1619:
	clrf	((c:3990))^0f00h,c	;volatile
	
l1621:
	clrf	((c:3981))^0f00h,c	;volatile
	line	438
	
l1623:
	asmopt push
asmopt off
movlw  2
movwf	(??_hw_init+0+1)^00h,c
movlw	4
movwf	(??_hw_init+0)^00h,c
	movlw	186
u2017:
decfsz	wreg,f
	bra	u2017
	decfsz	(??_hw_init+0)^00h,c,f
	bra	u2017
	decfsz	(??_hw_init+0+1)^00h,c,f
	bra	u2017
	nop2
asmopt pop

	line	440
	
l1625:
	movf	((c:3969))^0f00h,c,w	;volatile
	andlw	low(07h)
	movwf	((c:hw_init@idle))^00h,c
	line	441
	
l1627:
	
	btfss	((c:hw_init@idle))^00h,c,(0)&7
	goto	u841
	goto	u840
u841:
	clrf	(??_hw_init+0)^00h,c
	incf	(??_hw_init+0)^00h,c
	goto	u858
u840:
	clrf	(??_hw_init+0)^00h,c
u858:
	swapf	(??_hw_init+0)^00h,c
	rlncf	(??_hw_init+0)^00h,c
	rlncf	(??_hw_init+0)^00h,c
	movf	((c:4081))^0f00h,c,w	;volatile
	xorwf	(??_hw_init+0)^00h,c,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_hw_init+0)^00h,c,w
	movwf	((c:4081))^0f00h,c	;volatile
	line	442
	
l1629:
	
	btfss	((c:hw_init@idle))^00h,c,(1)&7
	goto	u861
	goto	u860
u861:
	clrf	(??_hw_init+0)^00h,c
	incf	(??_hw_init+0)^00h,c
	goto	u878
u860:
	clrf	(??_hw_init+0)^00h,c
u878:
	swapf	(??_hw_init+0)^00h,c
	rlncf	(??_hw_init+0)^00h,c
	movf	((c:4081))^0f00h,c,w	;volatile
	xorwf	(??_hw_init+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_hw_init+0)^00h,c,w
	movwf	((c:4081))^0f00h,c	;volatile
	line	443
	
l1631:
	
	btfss	((c:hw_init@idle))^00h,c,(2)&7
	goto	u881
	goto	u880
u881:
	clrf	(??_hw_init+0)^00h,c
	incf	(??_hw_init+0)^00h,c
	goto	u898
u880:
	clrf	(??_hw_init+0)^00h,c
u898:
	swapf	(??_hw_init+0)^00h,c
	movf	((c:4081))^0f00h,c,w	;volatile
	xorwf	(??_hw_init+0)^00h,c,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_hw_init+0)^00h,c,w
	movwf	((c:4081))^0f00h,c	;volatile
	line	445
	
l1633:
	bsf	((c:4081))^0f00h,c,7	;volatile
	line	454
	
l1635:
	movlw	low(02h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	455
	
l1637:
	movlw	low(0F6h)
	movwf	((c:4055))^0f00h,c	;volatile
	line	456
	
l1639:
	movlw	low(03Ch)
	movwf	((c:4054))^0f00h,c	;volatile
	line	457
	
l1641:
	bsf	((c:4053))^0f00h,c,7	;volatile
	line	460
	
l1643:
	movlw	low(06h)
	movwf	((c:4042))^0f00h,c	;volatile
	line	461
	
l1645:
	clrf	((c:4026))^0f00h,c	;volatile
	line	464
	
l1647:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	465
	
l1649:
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	466
	
l1651:
	clrf	((c:4024))^0f00h,c	;volatile
	line	467
	
l1653:
	movlw	low(033h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	471
	
l1655:
	bcf	((c:4048))^0f00h,c,7	;volatile
	line	472
	
l1657:
	bcf	((c:4082))^0f00h,c,2	;volatile
	
l1659:
	bsf	((c:4082))^0f00h,c,5	;volatile
	line	473
	
l1661:
	bcf	((c:4082))^0f00h,c,1	;volatile
	
l1663:
	bsf	((c:4082))^0f00h,c,4	;volatile
	line	474
	
l1665:
	bcf	((c:4080))^0f00h,c,0	;volatile
	
l1667:
	bsf	((c:4080))^0f00h,c,3	;volatile
	line	475
	
l1669:
	bcf	((c:4080))^0f00h,c,1	;volatile
	
l1671:
	bsf	((c:4080))^0f00h,c,4	;volatile
	line	476
	
l1673:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	477
	
l309:
	return	;funcret
	callstack 0
GLOBAL	__end_of_hw_init
	__end_of_hw_init:
	signat	_hw_init,89
	global	_handle_buttons

;; *************** function _handle_buttons *****************
;; Defined at:
;;		line 403 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_set_pump
;;		_sound_alarm
;;		_take
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	403
global __ptext23
__ptext23:
psect	text23
	file	"reservatorio.c"
	line	403
	
_handle_buttons:
;incstack = 0
	callstack 28
	line	405
	
l2227:
		movlw	low(_evt_mode)
	movwf	((c:take@f))^00h,c

	call	_take	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u1791
	goto	u1790
u1791:
	goto	l2231
u1790:
	line	406
	
l2229:
	movf	((c:_auto_mode))^00h,c,w
	btfsc	status,2
	goto	u1801
	goto	u1800
u1801:
	movlw	1
	goto	u1810
u1800:
	movlw	0
u1810:
	movwf	((c:_auto_mode))^00h,c
	line	408
	
l2231:
		movlw	low(_evt_pump)
	movwf	((c:take@f))^00h,c

	call	_take	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u1821
	goto	u1820
u1821:
	goto	l2245
u1820:
	line	409
	
l2233:
	movf	((c:_auto_mode))^00h,c,w
	btfss	status,2
	goto	u1831
	goto	u1830
u1831:
	goto	l2245
u1830:
	line	410
	
l2235:
	movf	((c:_pump_on))^00h,c,w
	btfsc	status,2
	goto	u1841
	goto	u1840
u1841:
	goto	l2239
u1840:
	
l2237:
	movlw	(0)&0ffh
	
	call	_set_pump
	goto	l2245
	line	411
	
l2239:
		movlw	05Fh-0
	cpfslt	((c:_level_pct))^00h,c
	goto	u1851
	goto	u1850

u1851:
	goto	l2245
u1850:
	
l2241:
	movf	((c:_fault))^00h,c,w
	btfss	status,2
	goto	u1861
	goto	u1860
u1861:
	goto	l2245
u1860:
	
l2243:
	movlw	(01h)&0ffh
	
	call	_set_pump
	line	414
	
l2245:
		movlw	low(_evt_ack)
	movwf	((c:take@f))^00h,c

	call	_take	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u1871
	goto	u1870
u1871:
	goto	l306
u1870:
	line	415
	
l2247:
	movf	((c:_fault))^00h,c,w
	btfsc	status,2
	goto	u1881
	goto	u1880
u1881:
	goto	l2253
u1880:
	
l2249:
	clrf	((c:_fault))^00h,c
	clrf	((c:_fault_cnt))^00h,c
	
l2251:
	bcf	(0+(2/8)+(c:_alarms))^00h,c,(2)&7
	line	416
	
l2253:
	movff	(c:_alarms),(c:_ack_mask)
	line	417
	
l2255:
		movlw	low(0)
	movwf	((c:sound_alarm@pat))^00h,c

	call	_sound_alarm	;wreg free
	line	419
	
l306:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_buttons
	__end_of_handle_buttons:
	signat	_handle_buttons,89
	global	_take

;; *************** function _take *****************
;; Defined at:
;;		line 393 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  f               1    0[COMRAM] PTR volatile unsigned ch
;;		 -> evt_ack(1), evt_pump(1), evt_mode(1), 
;; Auto vars:     Size  Location     Type
;;  v               1    1[COMRAM] _Bool 
;; Return value:  Size  Location     Type
;;                  1    wreg      _Bool 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_handle_buttons
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	393
global __ptext24
__ptext24:
psect	text24
	file	"reservatorio.c"
	line	393
	
_take:
;incstack = 0
	callstack 28
	line	396
	
l1963:
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	397
	
l1965:
	movf	((c:take@f))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u1341
	goto	u1340
u1341:
	movlw	1
	goto	u1350
u1340:
	movlw	0
u1350:
	movwf	((c:take@v))^00h,c
	line	398
	movf	((c:take@f))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	399
	
l1967:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	400
	
l1969:
	movf	((c:take@v))^00h,c,w
	line	401
	
l295:
	return	;funcret
	callstack 0
GLOBAL	__end_of_take
	__end_of_take:
	signat	_take,4217
	global	_control_step

;; *************** function _control_step *****************
;; Defined at:
;;		line 343 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    4[COMRAM] unsigned char 
;;  ativo           1    3[COMRAM] _Bool 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_set_pump
;;		_sound_alarm
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	343
global __ptext25
__ptext25:
psect	text25
	file	"reservatorio.c"
	line	343
	
_control_step:
;incstack = 0
	callstack 28
	line	345
	
l2155:
	clrf	((c:control_step@a))^00h,c
	line	348
	
l2157:
		movlw	05Fh-1
	cpfsgt	((c:_level_pct))^00h,c
	goto	u1581
	goto	u1580

u1581:
	goto	l2161
u1580:
	line	349
	
l2159:
	movlw	(0)&0ffh
	
	call	_set_pump
	line	350
	goto	l2171
	
l2161:
	movf	((c:_auto_mode))^00h,c,w
	btfsc	status,2
	goto	u1591
	goto	u1590
u1591:
	goto	l2171
u1590:
	line	352
	
l2163:
		movlw	01Ah-0
	cpfslt	((c:_level_pct))^00h,c
	goto	u1601
	goto	u1600

u1601:
	goto	l2167
u1600:
	
l2165:
	movlw	(01h)&0ffh
	
	call	_set_pump
	goto	l2171
	line	353
	
l2167:
		movlw	055h-1
	cpfsgt	((c:_level_pct))^00h,c
	goto	u1611
	goto	u1610

u1611:
	goto	l2171
u1610:
	
l2169:
	movlw	(0)&0ffh
	
	call	_set_pump
	line	356
	
l2171:
	movf	((c:_fault))^00h,c,w
	btfsc	status,2
	goto	u1621
	goto	u1620
u1621:
	goto	l2175
u1620:
	
l2173:
	movlw	(0)&0ffh
	
	call	_set_pump
	line	359
	
l2175:
	movf	((c:_pump_on))^00h,c,w
	btfsc	status,2
	goto	u1631
	goto	u1630
u1631:
	goto	l276
u1630:
	
l2177:
		movlw	055h-0
	cpfslt	((c:_level_pct))^00h,c
	goto	u1641
	goto	u1640

u1641:
	goto	l276
u1640:
	line	360
	
l2179:
	incf	((c:_fault_cnt))^00h,c
		movlw	032h-1
	cpfsgt	((c:_fault_cnt))^00h,c
	goto	u1651
	goto	u1650

u1651:
	goto	l2187
u1650:
	line	361
	
l2181:
	movf	((c:_fault_ref))^00h,c,w
	addlw	low(02h)
	cpfslt	((c:_level_pct))^00h,c
	goto	u1661
	goto	u1660
u1661:
	goto	l278
u1660:
	line	362
	
l2183:
	movlw	low(01h)
	movwf	((c:_fault))^00h,c
	line	363
	
l2185:
	movlw	(0)&0ffh
	
	call	_set_pump
	line	364
	goto	l2187
	
l278:
	line	365
	movff	(c:_level_pct),(c:_fault_ref)
	line	366
	clrf	((c:_fault_cnt))^00h,c
	goto	l2187
	line	369
	
l276:
	line	370
	clrf	((c:_fault_cnt))^00h,c
	line	373
	
l2187:
		movlw	0Bh-0
	cpfslt	((c:_level_pct))^00h,c
	goto	u1671
	goto	u1670

u1671:
	goto	l2191
u1670:
	
l2189:
	bsf	(0+(0/8)+(c:control_step@a))^00h,c,(0)&7
	line	374
	
l2191:
		movlw	05Fh-1
	cpfsgt	((c:_level_pct))^00h,c
	goto	u1681
	goto	u1680

u1681:
	goto	l2195
u1680:
	
l2193:
	bsf	(0+(1/8)+(c:control_step@a))^00h,c,(1)&7
	line	375
	
l2195:
	movf	((c:_fault))^00h,c,w
	btfsc	status,2
	goto	u1691
	goto	u1690
u1691:
	goto	l2199
u1690:
	
l2197:
	bsf	(0+(2/8)+(c:control_step@a))^00h,c,(2)&7
	line	377
	
l2199:
	movff	(c:control_step@a),(c:_alarms)
	line	378
	
l2201:
	movf	((c:control_step@a))^00h,c,w
	andwf	((c:_ack_mask))^00h,c
	line	381
	
l2203:
	incf	((c:_phase))^00h,c
	line	382
	movf	((c:_ack_mask))^00h,c,w
	xorlw	0ffh
	andwf	((c:_alarms))^00h,c,w
	iorlw	0
	btfss	status,2
	goto	u1701
	goto	u1700
u1701:
	movlw	1
	goto	u1710
u1700:
	movlw	0
u1710:
	movwf	((c:control_step@ativo))^00h,c
	line	385
	
l2205:
	movf	((c:control_step@ativo))^00h,c,w
	btfss	status,2
	goto	u1721
	goto	u1720
u1721:
	goto	l284
u1720:
	
l2207:
		movlw	low(0)
	movwf	((c:sound_alarm@pat))^00h,c

	call	_sound_alarm	;wreg free
	goto	l2215
	line	386
	
l284:
	
	btfss	((c:_alarms))^00h,c,(2)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l286
u1730:
	
l2209:
		movlw	low(_alm_fault)
	movwf	((c:sound_alarm@pat))^00h,c

	call	_sound_alarm	;wreg free
	goto	l2215
	line	387
	
l286:
	
	btfss	((c:_alarms))^00h,c,(1)&7
	goto	u1741
	goto	u1740
u1741:
	goto	l2213
u1740:
	
l2211:
		movlw	low(_alm_over)
	movwf	((c:sound_alarm@pat))^00h,c

	call	_sound_alarm	;wreg free
	goto	l2215
	line	388
	
l2213:
		movlw	low(_alm_crit)
	movwf	((c:sound_alarm@pat))^00h,c

	call	_sound_alarm	;wreg free
	line	390
	
l2215:
	clrf	((c:_control_step$665))^00h,c
	
l2217:
	movf	((c:_alarms))^00h,c,w
	btfsc	status,2
	goto	u1751
	goto	u1750
u1751:
	goto	l2225
u1750:
	
l2219:
	movf	((c:control_step@ativo))^00h,c,w
	btfsc	status,2
	goto	u1761
	goto	u1760
u1761:
	goto	l2223
u1760:
	
l2221:
	
	btfsc	((c:_phase))^00h,c,(0)&7
	goto	u1771
	goto	u1770
u1771:
	goto	l2225
u1770:
	
l2223:
	movlw	low(01h)
	movwf	((c:_control_step$665))^00h,c
	
l2225:
	btfsc	(c:_control_step$665)^00h,c,0
	bra	u1785
	bcf	((c:3978))^0f00h,c,5	;volatile
	bra	u1786
	u1785:
	bsf	((c:3978))^0f00h,c,5	;volatile
	u1786:

	line	391
	
l292:
	return	;funcret
	callstack 0
GLOBAL	__end_of_control_step
	__end_of_control_step:
	signat	_control_step,89
	global	_sound_alarm

;; *************** function _sound_alarm *****************
;; Defined at:
;;		line 299 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  pat             1    0[COMRAM] PTR const struct .
;;		 -> NULL(0), alm_fault(9), alm_over(9), alm_crit(9), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_control_step
;;		_handle_buttons
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	299
global __ptext26
__ptext26:
psect	text26
	file	"reservatorio.c"
	line	299
	
_sound_alarm:
;incstack = 0
	callstack 28
	line	301
	
l1947:
	movf	((c:_pat_base))^00h,c,w
xorwf	((c:sound_alarm@pat))^00h,c,w
	btfss	status,2
	goto	u1271
	goto	u1270

u1271:
	goto	l1951
u1270:
	goto	l252
	line	302
	
l1951:
		movff	(c:sound_alarm@pat),(c:_pat_base)

	line	303
		movff	(c:sound_alarm@pat),(c:_pat_cur)

	line	304
	
l1953:
	clrf	((c:_pat_left))^00h,c
	line	305
	
l252:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sound_alarm
	__end_of_sound_alarm:
	signat	_sound_alarm,4217
	global	_set_pump

;; *************** function _set_pump *****************
;; Defined at:
;;		line 331 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;  on              1    wreg     _Bool 
;; Auto vars:     Size  Location     Type
;;  on              1    1[COMRAM] _Bool 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_control_step
;;		_handle_buttons
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	331
global __ptext27
__ptext27:
psect	text27
	file	"reservatorio.c"
	line	331
	
_set_pump:
;incstack = 0
	callstack 28
	line	333
	movwf	((c:set_pump@on))^00h,c
	
l1955:
	movf	((c:set_pump@on))^00h,c,w
	btfsc	status,2
	goto	u1281
	goto	u1280
u1281:
	goto	l265
u1280:
	
l1957:
	movf	((c:_pump_on))^00h,c,w
	btfss	status,2
	goto	u1291
	goto	u1290
u1291:
	goto	l265
u1290:
	line	334
	
l1959:
	movff	(c:_level_pct),(c:_fault_ref)
	line	335
	clrf	((c:_fault_cnt))^00h,c
	line	336
	
l265:
	line	337
	movff	(c:set_pump@on),(c:_pump_on)
	line	338
	
l1961:
	movf	((c:set_pump@on))^00h,c,w
	btfss	status,2
	goto	u1301
	goto	u1300
u1301:
	clrf	(??_set_pump+0)^00h,c
	incf	(??_set_pump+0)^00h,c
	goto	u1318
u1300:
	clrf	(??_set_pump+0)^00h,c
u1318:
	movf	((c:3979))^0f00h,c,w	;volatile
	xorwf	(??_set_pump+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_set_pump+0)^00h,c,w
	movwf	((c:3979))^0f00h,c	;volatile
	line	339
	movf	((c:set_pump@on))^00h,c,w
	btfss	status,2
	goto	u1321
	goto	u1320
u1321:
	clrf	(??_set_pump+0)^00h,c
	incf	(??_set_pump+0)^00h,c
	goto	u1338
u1320:
	clrf	(??_set_pump+0)^00h,c
u1338:
	swapf	(??_set_pump+0)^00h,c
	movf	((c:3978))^0f00h,c,w	;volatile
	xorwf	(??_set_pump+0)^00h,c,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_set_pump+0)^00h,c,w
	movwf	((c:3978))^0f00h,c	;volatile
	line	340
	
l266:
	return	;funcret
	callstack 0
GLOBAL	__end_of_set_pump
	__end_of_set_pump:
	signat	_set_pump,4217
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 101 in file "reservatorio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
	file	"reservatorio.s"
	line	#
global __pintcode
__pintcode:
psect	intcode
	file	"reservatorio.c"
	line	101
	
_isr:
;incstack = 0
	callstack 26
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	global	int_func
	call	int_func,f	;refresh shadow registers
psect	intcode_body,class=CODE,space=0,reloc=2
global __pintcode_body
__pintcode_body:
int_func:

	pop	; remove dummy address from shadow register refresh
	line	104
	
i2l1675:
	btfss	((c:4082))^0f00h,c,5	;volatile
	goto	i2u90_41
	goto	i2u90_40
i2u90_41:
	goto	i2l115
i2u90_40:
	
i2l1677:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u91_41
	goto	i2u91_40
i2u91_41:
	goto	i2l115
i2u91_40:
	line	105
	
i2l1679:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	106
	
i2l1681:
	movlw	low(0F6h)
	movwf	((c:4055))^0f00h,c	;volatile
	line	107
	movlw	low(03Ch)
	movwf	((c:4054))^0f00h,c	;volatile
	line	108
	
i2l1683:
		movlw	0FAh-0
	cpfslt	((c:_ticks))^00h,c	;volatile
	goto	i2u92_41
	goto	i2u92_40

i2u92_41:
	goto	i2l1687
i2u92_40:
	
i2l1685:
	incf	((c:_ticks))^00h,c	;volatile
	line	110
	
i2l1687:
	movf	((c:_deb))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u93_41
	goto	i2u93_40
i2u93_41:
	goto	i2l1693
i2u93_40:
	
i2l1689:
	decfsz	((c:_deb))^00h,c	;volatile
	
	goto	i2l1693
	
i2l1691:
	bcf	((c:4082))^0f00h,c,1	;volatile
	bsf	((c:4082))^0f00h,c,4	;volatile
	line	111
	
i2l1693:
	movf	(0+((c:_deb)+01h))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u94_41
	goto	i2u94_40
i2u94_41:
	goto	i2l1699
i2u94_40:
	
i2l1695:
	decfsz	(0+((c:_deb)+01h))^00h,c	;volatile
	
	goto	i2l1699
	
i2l1697:
	bcf	((c:4080))^0f00h,c,0	;volatile
	bsf	((c:4080))^0f00h,c,3	;volatile
	line	112
	
i2l1699:
	movf	(0+((c:_deb)+02h))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u95_41
	goto	i2u95_40
i2u95_41:
	goto	i2l115
i2u95_40:
	
i2l1701:
	decfsz	(0+((c:_deb)+02h))^00h,c	;volatile
	
	goto	i2l115
	
i2l1703:
	bcf	((c:4080))^0f00h,c,1	;volatile
	bsf	((c:4080))^0f00h,c,4	;volatile
	line	113
	
i2l115:
	line	116
	btfss	((c:4082))^0f00h,c,4	;volatile
	goto	i2u96_41
	goto	i2u96_40
i2u96_41:
	goto	i2l1711
i2u96_40:
	
i2l1705:
	btfss	((c:4082))^0f00h,c,1	;volatile
	goto	i2u97_41
	goto	i2u97_40
i2u97_41:
	goto	i2l1711
i2u97_40:
	line	117
	
i2l1707:
	bcf	((c:4082))^0f00h,c,1	;volatile
	line	118
	bcf	((c:4082))^0f00h,c,4	;volatile
	line	119
	
i2l1709:
	movlw	low(05h)
	movwf	((c:_deb))^00h,c	;volatile
	line	120
	movlw	low(01h)
	movwf	((c:_evt_mode))^00h,c	;volatile
	line	123
	
i2l1711:
	btfss	((c:4080))^0f00h,c,3	;volatile
	goto	i2u98_41
	goto	i2u98_40
i2u98_41:
	goto	i2l1719
i2u98_40:
	
i2l1713:
	btfss	((c:4080))^0f00h,c,0	;volatile
	goto	i2u99_41
	goto	i2u99_40
i2u99_41:
	goto	i2l1719
i2u99_40:
	line	124
	
i2l1715:
	bcf	((c:4080))^0f00h,c,0	;volatile
	line	125
	bcf	((c:4080))^0f00h,c,3	;volatile
	line	126
	
i2l1717:
	movlw	low(05h)
	movwf	(0+((c:_deb)+01h))^00h,c	;volatile
	line	127
	movlw	low(01h)
	movwf	((c:_evt_pump))^00h,c	;volatile
	line	130
	
i2l1719:
	btfss	((c:4080))^0f00h,c,4	;volatile
	goto	i2u100_41
	goto	i2u100_40
i2u100_41:
	goto	i2l123
i2u100_40:
	
i2l1721:
	btfss	((c:4080))^0f00h,c,1	;volatile
	goto	i2u101_41
	goto	i2u101_40
i2u101_41:
	goto	i2l123
i2u101_40:
	line	131
	
i2l1723:
	bcf	((c:4080))^0f00h,c,1	;volatile
	line	132
	bcf	((c:4080))^0f00h,c,4	;volatile
	line	133
	
i2l1725:
	movlw	low(05h)
	movwf	(0+((c:_deb)+02h))^00h,c	;volatile
	line	134
	movlw	low(01h)
	movwf	((c:_evt_ack))^00h,c	;volatile
	line	136
	
i2l123:
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	callstack 0
GLOBAL	__end_of_isr
	__end_of_isr:
	signat	_isr,89
psect	smallconst
	db 0	; dummy byte at the end
	global	__smallconst
__smallconst	set	__psmallconst
	global	__mediumconst
__mediumconst	set	__psmallconst
	GLOBAL	__activetblptr
__activetblptr	EQU	1
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	global	btemp
	btemp set 01h

	DABS	1,1,1	;btemp
	global	int$flags
	int$flags	set btemp
	global btemp0
	btemp0 set btemp+0
	global btemp1
	btemp1 set btemp+1
	end
