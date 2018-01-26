opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 17 "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	psect config,class=CONFIG,delta=2 ;#
# 17 "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	dw 0x3F32 ;#
	FNCALL	_main,_send_config
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_send_char
	FNCALL	_main,_read_adc
	FNCALL	_main,_read_temp
	FNCALL	_main,___lwdiv
	FNCALL	_main,_dis_num
	FNCALL	_main,___lwmod
	FNCALL	_main,_putch
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,___wmul
	FNCALL	_dis_num,___lldiv
	FNCALL	_dis_num,___llmod
	FNCALL	_dis_num,_send_char
	FNCALL	_lcd_goto,_send_config
	FNCALL	_send_char,_delay
	FNCALL	_send_char,_e_pulse
	FNCALL	_send_config,_delay
	FNCALL	_send_config,_e_pulse
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_e_pulse,_delay
	FNCALL	_putch,_delay
	FNCALL	_read_adc,___lldiv
	FNROOT	_main
	global	_MPP
	global	_current
	global	_e
	global	_light
	global	_temp
	global	_temperature
	global	_transfer
	global	_voltage
	global	_c
	global	_dummy
	global	_i
	global	_result
	global	_ADCON0
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_TXREG
_TXREG	set	25
	global	_ADGO
_ADGO	set	250
	global	_CREN
_CREN	set	196
	global	_RB0
_RB0	set	48
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_BRGH
_BRGH	set	1218
	global	_SYNC
_SYNC	set	1220
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	file	"3-MPLAB.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_MPP:
       ds      2

_current:
       ds      2

_e:
       ds      2

_light:
       ds      2

_temp:
       ds      2

_temperature:
       ds      2

_transfer:
       ds      2

_voltage:
       ds      2

_c:
       ds      1

_dummy:
       ds      1

_i:
       ds      1

_result:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+015h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_send_config
?_send_config:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_send_char
?_send_char:	; 0 bytes @ 0x0
	global	?_read_adc
?_read_adc:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_e_pulse
?_e_pulse:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_temp
?_read_temp:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___llmod
?___llmod:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	delay@i
delay@i:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	___llmod@divisor
___llmod@divisor:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	2
	global	??_send_config
??_send_config:	; 0 bytes @ 0x2
	global	??_send_char
??_send_char:	; 0 bytes @ 0x2
	global	??_read_temp
??_read_temp:	; 0 bytes @ 0x2
	global	??_putch
??_putch:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_e_pulse
??_e_pulse:	; 0 bytes @ 0x2
	global	send_config@data
send_config@data:	; 1 bytes @ 0x2
	global	send_char@data
send_char@data:	; 1 bytes @ 0x2
	global	putch@c
putch@c:	; 1 bytes @ 0x2
	global	read_temp@temp
read_temp@temp:	; 2 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	lcd_goto@data
lcd_goto@data:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	global	___llmod@dividend
___llmod@dividend:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??___llmod
??___llmod:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	1
	global	___llmod@counter
___llmod@counter:	; 1 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	3
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
	ds	1
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x0
	global	?_dis_num
?_dis_num:	; 0 bytes @ 0x0
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	dis_num@data
dis_num@data:	; 4 bytes @ 0x0
	ds	4
	global	??_dis_num
??_dis_num:	; 0 bytes @ 0x4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	global	read_adc@result_temp
read_adc@result_temp:	; 4 bytes @ 0x4
	ds	1
	global	dis_num@hundred_thousand
dis_num@hundred_thousand:	; 1 bytes @ 0x5
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	1
	global	dis_num@ten_thousand
dis_num@ten_thousand:	; 1 bytes @ 0x6
	ds	1
	global	dis_num@thousand
dis_num@thousand:	; 1 bytes @ 0x7
	ds	1
	global	dis_num@hundred
dis_num@hundred:	; 1 bytes @ 0x8
	global	read_adc@i
read_adc@i:	; 2 bytes @ 0x8
	ds	1
	global	dis_num@tenth
dis_num@tenth:	; 1 bytes @ 0x9
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0xA
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0xA
	ds	3
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xD
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xD
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x10
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x13
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x17
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x18
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1B
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1C
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     29      50
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?_read_temp	unsigned short  size(1) Largest target is 2
;;		 -> result(BANK0[2]), 
;;
;; ?___llmod	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _dis_num->___lldiv
;;   _lcd_goto->_send_config
;;   _send_char->_delay
;;   _send_config->_delay
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;   _e_pulse->_delay
;;   _putch->_delay
;;   _read_adc->___lldiv
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftmul
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    3501
;;                        _send_config
;;                           _lcd_goto
;;                          _send_char
;;                           _read_adc
;;                          _read_temp
;;                            ___lwdiv
;;                            _dis_num
;;                            ___lwmod
;;                              _putch
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (1) _dis_num                                             10     6      4    1279
;;                                              0 BANK0     10     6      4
;;                            ___lldiv
;;                            ___llmod
;;                          _send_char
;;                            ___lwdiv (ARG)
;;                            ___lwmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     2      0     201
;;                                              3 COMMON     2     2      0
;;                        _send_config
;; ---------------------------------------------------------------------------------
;; (2) _send_char                                            1     1      0     156
;;                                              2 COMMON     1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (2) _send_config                                          1     1      0     112
;;                                              2 COMMON     1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (1) ___lwtoft                                             4     1      3     231
;;                                             12 COMMON     1     1      0
;;                                             10 BANK0      3     0      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     535
;;                                             13 BANK0     16    10      6
;;                           ___ftpack
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _e_pulse                                              0     0      0      45
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _putch                                                1     1      0      67
;;                                              2 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _read_adc                                            10    10      0     232
;;                                              0 BANK0     10    10      0
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             14     6      8     162
;;                                              0 COMMON    14     6      8
;; ---------------------------------------------------------------------------------
;; (2) ___llmod                                             10     2      8     159
;;                                              0 COMMON    10     2      8
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                2     0      2      45
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _read_temp                                            4     2      2      23
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _send_config
;;     _delay
;;     _e_pulse
;;       _delay
;;   _lcd_goto
;;     _send_config
;;       _delay
;;       _e_pulse
;;         _delay
;;   _send_char
;;     _delay
;;     _e_pulse
;;       _delay
;;   _read_adc
;;     ___lldiv
;;   _read_temp
;;   ___lwdiv
;;   _dis_num
;;     ___lldiv
;;     ___llmod
;;     _send_char
;;       _delay
;;       _e_pulse
;;         _delay
;;     ___lwdiv (ARG)
;;     ___lwmod (ARG)
;;   ___lwmod
;;   _putch
;;     _delay
;;   ___lwtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;   ___wmul
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      40       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1D      32       5       62.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      44      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 60 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_send_config
;;		_lcd_goto
;;		_send_char
;;		_read_adc
;;		_read_temp
;;		___lwdiv
;;		_dis_num
;;		___lwmod
;;		_putch
;;		___lwtoft
;;		___ftmul
;;		___fttol
;;		___wmul
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	60
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	61
	
l3260:	
;MPLAB3.c: 61: ADRESH=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	62
;MPLAB3.c: 62: ADRESL=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(158)^080h	;volatile
	line	65
	
l3262:	
;MPLAB3.c: 65: ADCON1=0b11000000;
	movlw	(0C0h)
	movwf	(159)^080h	;volatile
	line	68
	
l3264:	
;MPLAB3.c: 68: TRISA=0b11111111;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	69
;MPLAB3.c: 69: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	70
;MPLAB3.c: 70: TRISC=0b00000000;
	clrf	(135)^080h	;volatile
	line	71
;MPLAB3.c: 71: TRISD=0b00000000;
	clrf	(136)^080h	;volatile
	line	72
;MPLAB3.c: 72: PORTA=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	73
;MPLAB3.c: 73: PORTB=0;
	clrf	(6)	;volatile
	line	74
;MPLAB3.c: 74: PORTC=0;
	clrf	(7)	;volatile
	line	77
	
l3266:	
;MPLAB3.c: 77: send_config(0b00000001);
	movlw	(01h)
	fcall	_send_config
	line	78
	
l3268:	
;MPLAB3.c: 78: send_config(0b00000010);
	movlw	(02h)
	fcall	_send_config
	line	79
	
l3270:	
;MPLAB3.c: 79: send_config(0b00000110);
	movlw	(06h)
	fcall	_send_config
	line	80
	
l3272:	
;MPLAB3.c: 80: send_config(0b00001100);
	movlw	(0Ch)
	fcall	_send_config
	line	81
	
l3274:	
;MPLAB3.c: 81: send_config(0b00111000);
	movlw	(038h)
	fcall	_send_config
	line	87
	
l3276:	
;MPLAB3.c: 87: TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1086/8)^080h,(1086)&7
	line	88
	
l3278:	
;MPLAB3.c: 88: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	91
	
l3280:	
;MPLAB3.c: 91: SPBRG = 129;
	movlw	(081h)
	movwf	(153)^080h	;volatile
	line	93
	
l3282:	
;MPLAB3.c: 93: BRGH = 1;
	bsf	(1218/8)^080h,(1218)&7
	line	96
	
l3284:	
;MPLAB3.c: 96: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	line	99
	
l3286:	
;MPLAB3.c: 99: TX9 = 0;
	bcf	(1222/8)^080h,(1222)&7
	line	100
	
l3288:	
;MPLAB3.c: 100: TXEN = 1;
	bsf	(1221/8)^080h,(1221)&7
	line	103
	
l3290:	
;MPLAB3.c: 103: RX9 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	104
	
l3292:	
;MPLAB3.c: 104: CREN = 1;
	bsf	(196/8),(196)&7
	line	107
	
l3294:	
;MPLAB3.c: 107: SPEN = 1;
	bsf	(199/8),(199)&7
	goto	l3296
	line	111
;MPLAB3.c: 111: while(1)
	
l729:	
	line	116
	
l3296:	
;MPLAB3.c: 112: {
;MPLAB3.c: 116: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	120
	
l3298:	
;MPLAB3.c: 120: send_char('L');
	movlw	(04Ch)
	fcall	_send_char
	line	121
	
l3300:	
;MPLAB3.c: 121: send_char('I');
	movlw	(049h)
	fcall	_send_char
	line	122
	
l3302:	
;MPLAB3.c: 122: send_char('G');
	movlw	(047h)
	fcall	_send_char
	line	123
	
l3304:	
;MPLAB3.c: 123: send_char('H');
	movlw	(048h)
	fcall	_send_char
	line	124
	
l3306:	
;MPLAB3.c: 124: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	125
	
l3308:	
;MPLAB3.c: 125: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	127
	
l3310:	
;MPLAB3.c: 127: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	131
	
l3312:	
;MPLAB3.c: 131: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	132
	
l3314:	
;MPLAB3.c: 132: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	133
	
l3316:	
;MPLAB3.c: 133: send_char('M');
	movlw	(04Dh)
	fcall	_send_char
	line	134
	
l3318:	
;MPLAB3.c: 134: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	135
	
l3320:	
;MPLAB3.c: 135: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	137
	
l3322:	
;MPLAB3.c: 137: lcd_goto(-24);
	movlw	(0E8h)
	fcall	_lcd_goto
	line	141
	
l3324:	
;MPLAB3.c: 141: send_char('V');
	movlw	(056h)
	fcall	_send_char
	line	142
	
l3326:	
;MPLAB3.c: 142: send_char('O');
	movlw	(04Fh)
	fcall	_send_char
	line	143
	
l3328:	
;MPLAB3.c: 143: send_char('L');
	movlw	(04Ch)
	fcall	_send_char
	line	144
	
l3330:	
;MPLAB3.c: 144: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	145
	
l3332:	
;MPLAB3.c: 145: send_char('A');
	movlw	(041h)
	fcall	_send_char
	line	146
	
l3334:	
;MPLAB3.c: 146: send_char('G');
	movlw	(047h)
	fcall	_send_char
	line	147
	
l3336:	
;MPLAB3.c: 147: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	148
	
l3338:	
;MPLAB3.c: 148: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	150
	
l3340:	
;MPLAB3.c: 150: lcd_goto(40);
	movlw	(028h)
	fcall	_lcd_goto
	line	154
	
l3342:	
;MPLAB3.c: 154: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	155
	
l3344:	
;MPLAB3.c: 155: send_char('U');
	movlw	(055h)
	fcall	_send_char
	line	156
	
l3346:	
;MPLAB3.c: 156: send_char('R');
	movlw	(052h)
	fcall	_send_char
	line	157
	
l3348:	
;MPLAB3.c: 157: send_char('R');
	movlw	(052h)
	fcall	_send_char
	line	158
	
l3350:	
;MPLAB3.c: 158: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	159
	
l3352:	
;MPLAB3.c: 159: send_char('N');
	movlw	(04Eh)
	fcall	_send_char
	line	160
	
l3354:	
;MPLAB3.c: 160: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	161
	
l3356:	
;MPLAB3.c: 161: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	goto	l3358
	line	164
;MPLAB3.c: 164: while(1)
	
l730:	
	line	170
	
l3358:	
;MPLAB3.c: 165: {
;MPLAB3.c: 170: ADCON0=0b10000001;
	movlw	(081h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	171
	
l3360:	
;MPLAB3.c: 171: lcd_goto(8);
	movlw	(08h)
	fcall	_lcd_goto
	line	172
	
l3362:	
;MPLAB3.c: 172: read_adc();
	fcall	_read_adc
	line	173
	
l3364:	
;MPLAB3.c: 173: light=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_light+1)
	addwf	(_light+1)
	movf	(0+(?_read_temp)),w
	clrf	(_light)
	addwf	(_light)

	line	175
	
l3366:	
;MPLAB3.c: 175: dis_num(light/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_light+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_light),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	176
	
l3368:	
;MPLAB3.c: 176: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	177
	
l3370:	
;MPLAB3.c: 177: dis_num(light%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_light+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_light),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	180
	
l3372:	
;MPLAB3.c: 180: putch(light/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_light+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_light),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	fcall	_putch
	line	187
	
l3374:	
;MPLAB3.c: 187: ADCON0=0b10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	188
	
l3376:	
;MPLAB3.c: 188: lcd_goto(28);
	movlw	(01Ch)
	fcall	_lcd_goto
	line	189
	
l3378:	
;MPLAB3.c: 189: read_adc();
	fcall	_read_adc
	line	190
	
l3380:	
;MPLAB3.c: 190: temperature=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temperature+1)
	addwf	(_temperature+1)
	movf	(0+(?_read_temp)),w
	clrf	(_temperature)
	addwf	(_temperature)

	line	191
	
l3382:	
;MPLAB3.c: 191: temperature = (temperature*0.48876);
	movf	(_temperature+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_temperature),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x3f
	movwf	(?___ftmul)
	movlw	0xfa
	movwf	(?___ftmul+1)
	movlw	0x3e
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temperature+1)
	addwf	(_temperature+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_temperature)
	addwf	(_temperature)

	line	193
	
l3384:	
;MPLAB3.c: 193: putch(temperature);
	movf	(_temperature),w
	fcall	_putch
	line	195
	
l3386:	
;MPLAB3.c: 195: dis_num(temperature);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temperature),w
	movwf	(?_dis_num)
	movf	(_temperature+1),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	197
	
l3388:	
;MPLAB3.c: 197: send_char(0b11011111);
	movlw	(0DFh)
	fcall	_send_char
	line	198
	
l3390:	
;MPLAB3.c: 198: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	199
	
l3392:	
;MPLAB3.c: 199: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	200
	
l3394:	
;MPLAB3.c: 200: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	202
	
l3396:	
;MPLAB3.c: 202: if(temperature>40)
	movlw	high(029h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_temperature+1),w
	movlw	low(029h)
	skipnz
	subwf	(_temperature),w
	skipc
	goto	u3581
	goto	u3580
u3581:
	goto	l731
u3580:
	line	204
	
l3398:	
;MPLAB3.c: 203: {
;MPLAB3.c: 204: RB0=1;
	bsf	(48/8),(48)&7
	line	205
;MPLAB3.c: 205: }
	goto	l3400
	line	207
	
l731:	
	line	209
;MPLAB3.c: 207: else
;MPLAB3.c: 208: {
;MPLAB3.c: 209: RB0=0;
	bcf	(48/8),(48)&7
	goto	l3400
	line	210
	
l732:	
	line	219
	
l3400:	
;MPLAB3.c: 210: }
;MPLAB3.c: 219: ADCON0=0b10010001;
	movlw	(091h)
	movwf	(31)	;volatile
	line	220
	
l3402:	
;MPLAB3.c: 220: lcd_goto(-16);
	movlw	(0F0h)
	fcall	_lcd_goto
	line	221
	
l3404:	
;MPLAB3.c: 221: read_adc();
	fcall	_read_adc
	line	222
	
l3406:	
;MPLAB3.c: 222: voltage=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_voltage+1)
	addwf	(_voltage+1)
	movf	(0+(?_read_temp)),w
	clrf	(_voltage)
	addwf	(_voltage)

	line	224
	
l3408:	
;MPLAB3.c: 224: voltage=(voltage*4.836587680029639272430897954192);
	movf	(_voltage+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_voltage),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0xc5
	movwf	(?___ftmul)
	movlw	0x9a
	movwf	(?___ftmul+1)
	movlw	0x40
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_voltage+1)
	addwf	(_voltage+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_voltage)
	addwf	(_voltage)

	line	227
	
l3410:	
;MPLAB3.c: 227: putch(voltage);
	movf	(_voltage),w
	fcall	_putch
	line	229
	
l3412:	
;MPLAB3.c: 229: dis_num(voltage/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_voltage+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_voltage),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	230
	
l3414:	
;MPLAB3.c: 230: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	231
	
l3416:	
;MPLAB3.c: 231: dis_num(voltage%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_voltage+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_voltage),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	232
	
l3418:	
;MPLAB3.c: 232: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	233
	
l3420:	
;MPLAB3.c: 233: send_char('V');
	movlw	(056h)
	fcall	_send_char
	line	234
	
l3422:	
;MPLAB3.c: 234: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	240
	
l3424:	
;MPLAB3.c: 240: ADCON0=0b10011001;
	movlw	(099h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	241
;MPLAB3.c: 241: lcd_goto(48);
	movlw	(030h)
	fcall	_lcd_goto
	line	242
;MPLAB3.c: 242: read_adc();
	fcall	_read_adc
	line	243
;MPLAB3.c: 243: current=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_current+1)
	addwf	(_current+1)
	movf	(0+(?_read_temp)),w
	clrf	(_current)
	addwf	(_current)

	line	245
;MPLAB3.c: 245: current=current/3;
	movlw	low(03h)
	movwf	(?___lwdiv)
	movlw	high(03h)
	movwf	((?___lwdiv))+1
	movf	(_current+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_current),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_current+1)
	addwf	(_current+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_current)
	addwf	(_current)

	line	248
;MPLAB3.c: 248: putch(current);
	movf	(_current),w
	fcall	_putch
	line	250
;MPLAB3.c: 250: dis_num(current/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_current+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_current),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	251
;MPLAB3.c: 251: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	252
;MPLAB3.c: 252: dis_num(current%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_current+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_current),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	254
;MPLAB3.c: 254: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	255
;MPLAB3.c: 255: send_char('A');
	movlw	(041h)
	fcall	_send_char
	line	256
;MPLAB3.c: 256: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	263
;MPLAB3.c: 263: lcd_goto(55);
	movlw	(037h)
	fcall	_lcd_goto
	line	269
;MPLAB3.c: 269: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	270
;MPLAB3.c: 270: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	273
;MPLAB3.c: 273: MPP=voltage * current;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_voltage+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_voltage),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movf	(_current+1),w
	clrf	1+(?___wmul)+02h
	addwf	1+(?___wmul)+02h
	movf	(_current),w
	clrf	0+(?___wmul)+02h
	addwf	0+(?___wmul)+02h

	fcall	___wmul
	movf	(1+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_MPP+1)
	addwf	(_MPP+1)
	movf	(0+(?___wmul)),w
	clrf	(_MPP)
	addwf	(_MPP)

	line	274
;MPLAB3.c: 274: MPP=MPP/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_MPP+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_MPP),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_MPP+1)
	addwf	(_MPP+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_MPP)
	addwf	(_MPP)

	line	275
;MPLAB3.c: 275: putch(MPP);
	movf	(_MPP),w
	fcall	_putch
	line	276
;MPLAB3.c: 276: dis_num(MPP/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_MPP+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_MPP),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	277
;MPLAB3.c: 277: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	278
;MPLAB3.c: 278: dis_num(MPP%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_MPP+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_MPP),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	goto	l3358
	line	279
	
l733:	
	line	164
	goto	l3358
	
l734:	
	goto	l3296
	line	281
	
l735:	
	line	111
	goto	l3296
	
l736:	
	line	283
	
l737:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dis_num
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function _dis_num *****************
;; Defined at:
;;		line 347 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  data            4    0[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  tenth           1    9[BANK0 ] unsigned char 
;;  hundred         1    8[BANK0 ] unsigned char 
;;  thousand        1    7[BANK0 ] unsigned char 
;;  ten_thousand    1    6[BANK0 ] unsigned char 
;;  hundred_thou    1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lldiv
;;		___llmod
;;		_send_char
;; This function is called by:
;;		_main
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text397
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	347
	global	__size_of_dis_num
	__size_of_dis_num	equ	__end_of_dis_num-_dis_num
	
_dis_num:	
	opt	stack 4
; Regs used in _dis_num: [wreg+status,2+status,0+pclath+cstack]
	line	354
	
l3236:	
;MPLAB3.c: 348: unsigned char hundred_thousand;
;MPLAB3.c: 349: unsigned char ten_thousand;
;MPLAB3.c: 350: unsigned char thousand;
;MPLAB3.c: 351: unsigned char hundred;
;MPLAB3.c: 352: unsigned char tenth;
;MPLAB3.c: 354: hundred_thousand = data/100000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	01h
	movwf	(?___lldiv+2)
	movlw	086h
	movwf	(?___lldiv+1)
	movlw	0A0h
	movwf	(?___lldiv)

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@hundred_thousand)
	line	355
;MPLAB3.c: 355: data = data % 100000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	01h
	movwf	(?___llmod+2)
	movlw	086h
	movwf	(?___llmod+1)
	movlw	0A0h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	356
;MPLAB3.c: 356: ten_thousand = data/10000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	027h
	movwf	(?___lldiv+1)
	movlw	010h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@ten_thousand)
	line	357
;MPLAB3.c: 357: data = data % 10000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	027h
	movwf	(?___llmod+1)
	movlw	010h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	358
;MPLAB3.c: 358: thousand = data / 1000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	03h
	movwf	(?___lldiv+1)
	movlw	0E8h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@thousand)
	line	359
;MPLAB3.c: 359: data = data % 1000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	03h
	movwf	(?___llmod+1)
	movlw	0E8h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	360
;MPLAB3.c: 360: hundred = data / 100;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	064h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@hundred)
	line	361
;MPLAB3.c: 361: data = data % 100;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	064h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	362
;MPLAB3.c: 362: tenth = data / 10;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	0Ah
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@tenth)
	line	363
;MPLAB3.c: 363: data = data % 10;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	0Ah
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	365
	
l3238:	
;MPLAB3.c: 365: if(hundred_thousand>0)
	movf	(dis_num@hundred_thousand),w
	skipz
	goto	u3530
	goto	l3242
u3530:
	line	367
	
l3240:	
;MPLAB3.c: 366: {
;MPLAB3.c: 367: send_char(hundred_thousand + 0x30);
	movf	(dis_num@hundred_thousand),w
	addlw	030h
	fcall	_send_char
	line	368
;MPLAB3.c: 368: send_char(ten_thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	369
;MPLAB3.c: 369: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	370
;MPLAB3.c: 370: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	371
;MPLAB3.c: 371: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	372
;MPLAB3.c: 372: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	373
;MPLAB3.c: 373: }
	goto	l775
	line	375
	
l765:	
	
l3242:	
;MPLAB3.c: 375: else if(ten_thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	skipz
	goto	u3540
	goto	l3246
u3540:
	line	377
	
l3244:	
;MPLAB3.c: 376: {
;MPLAB3.c: 377: send_char(ten_thousand + 0x30);
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	378
;MPLAB3.c: 378: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	379
;MPLAB3.c: 379: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	380
;MPLAB3.c: 380: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	381
;MPLAB3.c: 381: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	382
;MPLAB3.c: 382: }
	goto	l775
	line	383
	
l767:	
	
l3246:	
;MPLAB3.c: 383: else if(thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	skipz
	goto	u3550
	goto	l3250
u3550:
	line	385
	
l3248:	
;MPLAB3.c: 384: {
;MPLAB3.c: 385: send_char(thousand + 0x30);
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	386
;MPLAB3.c: 386: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	387
;MPLAB3.c: 387: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	388
;MPLAB3.c: 388: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	389
;MPLAB3.c: 389: }
	goto	l775
	line	390
	
l769:	
	
l3250:	
;MPLAB3.c: 390: else if(hundred>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	skipz
	goto	u3560
	goto	l3254
u3560:
	line	392
	
l3252:	
;MPLAB3.c: 391: {
;MPLAB3.c: 392: send_char(hundred + 0x30);
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	393
;MPLAB3.c: 393: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	394
;MPLAB3.c: 394: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	395
;MPLAB3.c: 395: }
	goto	l775
	line	396
	
l771:	
	
l3254:	
;MPLAB3.c: 396: else if(tenth>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	skipz
	goto	u3570
	goto	l3258
u3570:
	line	398
	
l3256:	
;MPLAB3.c: 397: {
;MPLAB3.c: 398: send_char(tenth + 0x30);
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	399
;MPLAB3.c: 399: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	400
;MPLAB3.c: 400: }
	goto	l775
	line	401
	
l773:	
	
l3258:	
;MPLAB3.c: 401: else send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	goto	l775
	
l774:	
	goto	l775
	
l772:	
	goto	l775
	
l770:	
	goto	l775
	
l768:	
	goto	l775
	
l766:	
	line	402
	
l775:	
	return
	opt stack 0
GLOBAL	__end_of_dis_num
	__end_of_dis_num:
;; =============== function _dis_num ends ============

	signat	_dis_num,4216
	global	_lcd_goto
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 316 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_send_config
;; This function is called by:
;;		_main
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text398
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	316
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 4
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@data stored from wreg
	movwf	(lcd_goto@data)
	line	317
	
l3228:	
;MPLAB3.c: 317: if(data<16)
	movlw	(010h)
	subwf	(lcd_goto@data),w
	skipnc
	goto	u3521
	goto	u3520
u3521:
	goto	l3232
u3520:
	line	319
	
l3230:	
;MPLAB3.c: 318: {
;MPLAB3.c: 319: send_config(0x80+data);
	movf	(lcd_goto@data),w
	addlw	080h
	fcall	_send_config
	line	320
;MPLAB3.c: 320: }
	goto	l751
	line	321
	
l749:	
	line	323
	
l3232:	
;MPLAB3.c: 321: else
;MPLAB3.c: 322: {
;MPLAB3.c: 323: data=data-20;
	movf	(lcd_goto@data),w
	addlw	0ECh
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(lcd_goto@data)
	line	324
	
l3234:	
;MPLAB3.c: 324: send_config(0xc0+data);
	movf	(lcd_goto@data),w
	addlw	0C0h
	fcall	_send_config
	goto	l751
	line	325
	
l750:	
	line	326
	
l751:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_send_char
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:

;; *************** function _send_char *****************
;; Defined at:
;;		line 304 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_main
;;		_dis_num
;;		_send_string
;; This function uses a non-reentrant model
;;
psect	text399
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	304
	global	__size_of_send_char
	__size_of_send_char	equ	__end_of_send_char-_send_char
	
_send_char:	
	opt	stack 4
; Regs used in _send_char: [wreg+status,2+status,0+pclath+cstack]
;send_char@data stored from wreg
	movwf	(send_char@data)
	line	305
	
l3220:	
;MPLAB3.c: 305: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	307
	
l3222:	
;MPLAB3.c: 307: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	308
;MPLAB3.c: 308: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	309
;MPLAB3.c: 309: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	310
	
l3224:	
;MPLAB3.c: 310: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	311
	
l3226:	
;MPLAB3.c: 311: e_pulse();
	fcall	_e_pulse
	line	312
	
l746:	
	return
	opt stack 0
GLOBAL	__end_of_send_char
	__end_of_send_char:
;; =============== function _send_char ends ============

	signat	_send_char,4216
	global	_send_config
psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:

;; *************** function _send_config *****************
;; Defined at:
;;		line 288 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_main
;;		_lcd_goto
;;		_lcd_clr
;; This function uses a non-reentrant model
;;
psect	text400
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	288
	global	__size_of_send_config
	__size_of_send_config	equ	__end_of_send_config-_send_config
	
_send_config:	
	opt	stack 4
; Regs used in _send_config: [wreg+status,2+status,0+pclath+cstack]
;send_config@data stored from wreg
	movwf	(send_config@data)
	line	289
	
l3212:	
;MPLAB3.c: 289: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	290
	
l3214:	
;MPLAB3.c: 290: PORTD=data;
	movf	(send_config@data),w
	movwf	(8)	;volatile
	line	291
	
l3216:	
;MPLAB3.c: 291: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	292
	
l3218:	
;MPLAB3.c: 292: e_pulse();
	fcall	_e_pulse
	line	293
	
l740:	
	return
	opt stack 0
GLOBAL	__end_of_send_config
	__end_of_send_config:
;; =============== function _send_config ends ============

	signat	_send_config,4216
	global	___lwtoft
psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   10[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text401
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3208:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	l1039
	
l3210:	
	line	31
	
l1039:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   13[BANK0 ] float 
;;  f2              3   16[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   24[BANK0 ] unsigned um
;;  sign            1   28[BANK0 ] unsigned char 
;;  cntr            1   27[BANK0 ] unsigned char 
;;  exp             1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   13[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text402
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l3158:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l3164
u3380:
	line	57
	
l3160:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l915
	
l3162:	
	goto	l915
	
l914:	
	line	58
	
l3164:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l3170
u3390:
	line	59
	
l3166:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l915
	
l3168:	
	goto	l915
	
l916:	
	line	60
	
l3170:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3405:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3400:
	addlw	-1
	skipz
	goto	u3405
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3415:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3410:
	addlw	-1
	skipz
	goto	u3415
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l3172:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l3174:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l3176:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l3178:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l3180:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3182
	line	70
	
l917:	
	line	71
	
l3182:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l3186
u3420:
	line	72
	
l3184:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3431
	addwf	(___ftmul@f3_as_product+1),f
u3431:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3432
	addwf	(___ftmul@f3_as_product+2),f
u3432:

	goto	l3186
	
l918:	
	line	73
	
l3186:	
	movlw	01h
u3445:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3445

	line	74
	
l3188:	
	movlw	01h
u3455:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3455
	line	75
	
l3190:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3461
	goto	u3460
u3461:
	goto	l3182
u3460:
	goto	l3192
	
l919:	
	line	76
	
l3192:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3194
	line	77
	
l920:	
	line	78
	
l3194:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3471
	goto	u3470
u3471:
	goto	l3198
u3470:
	line	79
	
l3196:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3481
	addwf	(___ftmul@f3_as_product+1),f
u3481:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3482
	addwf	(___ftmul@f3_as_product+2),f
u3482:

	goto	l3198
	
l921:	
	line	80
	
l3198:	
	movlw	01h
u3495:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3495

	line	81
	
l3200:	
	movlw	01h
u3505:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3505

	line	82
	
l3202:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3511
	goto	u3510
u3511:
	goto	l3194
u3510:
	goto	l3204
	
l922:	
	line	83
	
l3204:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l915
	
l3206:	
	line	84
	
l915:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_e_pulse
psect	text403,local,class=CODE,delta=2
global __ptext403
__ptext403:

;; *************** function _e_pulse *****************
;; Defined at:
;;		line 296 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_send_config
;;		_send_char
;; This function uses a non-reentrant model
;;
psect	text403
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	296
	global	__size_of_e_pulse
	__size_of_e_pulse	equ	__end_of_e_pulse-_e_pulse
	
_e_pulse:	
	opt	stack 4
; Regs used in _e_pulse: [wreg+status,2+status,0+pclath+cstack]
	line	297
	
l3152:	
;MPLAB3.c: 297: RB5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	line	298
	
l3154:	
;MPLAB3.c: 298: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	299
	
l3156:	
;MPLAB3.c: 299: RB5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
	line	300
;MPLAB3.c: 300: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	301
	
l743:	
	return
	opt stack 0
GLOBAL	__end_of_e_pulse
	__end_of_e_pulse:
;; =============== function _e_pulse ends ============

	signat	_e_pulse,88
	global	_putch
psect	text404,local,class=CODE,delta=2
global __ptext404
__ptext404:

;; *************** function _putch *****************
;; Defined at:
;;		line 477 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text404
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	477
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 6
; Regs used in _putch: [wreg+status,2+status,0+pclath+cstack]
;putch@c stored from wreg
	movwf	(putch@c)
	line	478
	
l3146:	
;MPLAB3.c: 478: while(!TXIF)
	goto	l804
	
l805:	
	line	481
# 481 "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
clrwdt ;#
psect	text404
	line	482
	
l804:	
	line	478
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l805
u3370:
	goto	l3148
	
l806:	
	line	483
	
l3148:	
;MPLAB3.c: 482: }
;MPLAB3.c: 483: TXREG=c;
	movf	(putch@c),w
	movwf	(25)	;volatile
	line	484
	
l3150:	
;MPLAB3.c: 484: delay(60);
	movlw	low(03Ch)
	movwf	(?_delay)
	movlw	high(03Ch)
	movwf	((?_delay))+1
	fcall	_delay
	line	485
	
l807:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_read_adc
psect	text405,local,class=CODE,delta=2
global __ptext405
__ptext405:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 420 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  result_temp     4    4[BANK0 ] unsigned long 
;;  i               2    8[BANK0 ] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text405
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	420
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 6
; Regs used in _read_adc: [wreg+status,2+status,0+pclath+cstack]
	line	422
	
l3134:	
;MPLAB3.c: 421: unsigned short i;
;MPLAB3.c: 422: unsigned long result_temp=0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(read_adc@result_temp+3)
	movlw	0
	movwf	(read_adc@result_temp+2)
	movlw	0
	movwf	(read_adc@result_temp+1)
	movlw	0
	movwf	(read_adc@result_temp)

	line	423
;MPLAB3.c: 423: for(i=2000;i>0;i-=1)
	movlw	low(07D0h)
	movwf	(read_adc@i)
	movlw	high(07D0h)
	movwf	((read_adc@i))+1
	
l3136:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l783
u3330:
	goto	l3144
	
l3138:	
	goto	l3144
	line	425
	
l783:	
	line	427
;MPLAB3.c: 425: {
;MPLAB3.c: 427: ADGO = 1;
	bsf	(250/8),(250)&7
	line	428
;MPLAB3.c: 428: while(ADGO==1);
	goto	l785
	
l786:	
	
l785:	
	btfsc	(250/8),(250)&7
	goto	u3341
	goto	u3340
u3341:
	goto	l785
u3340:
	goto	l3140
	
l787:	
	line	429
	
l3140:	
;MPLAB3.c: 429: result=ADRESH;
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	430
;MPLAB3.c: 430: result=result<<8;
	movf	(_result),w
	movwf	(??_read_adc+0)+0+1
	clrf	(??_read_adc+0)+0
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	431
;MPLAB3.c: 431: result=256*result|ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	(_result),w
	movwf	(??_read_adc+2)+0+1
	clrf	(??_read_adc+2)+0
	movf	0+(??_read_adc+0)+0,w
	iorwf	0+(??_read_adc+2)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	iorwf	1+(??_read_adc+2)+0,w
	movwf	1+(_result)
	line	432
;MPLAB3.c: 432: result_temp+=result;
	movf	(_result),w
	movwf	((??_read_adc+0)+0)
	movf	(_result+1),w
	movwf	((??_read_adc+0)+0+1)
	clrf	((??_read_adc+0)+0+2)
	clrf	((??_read_adc+0)+0+3)
	movf	0+(??_read_adc+0)+0,w
	addwf	(read_adc@result_temp),f
	movf	1+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3351
	addwf	(read_adc@result_temp+1),f
u3351:
	movf	2+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3352
	addwf	(read_adc@result_temp+2),f
u3352:
	movf	3+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3353
	addwf	(read_adc@result_temp+3),f
u3353:

	line	423
	movlw	low(01h)
	subwf	(read_adc@i),f
	movlw	high(01h)
	skipc
	decf	(read_adc@i+1),f
	subwf	(read_adc@i+1),f
	
l3142:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l783
u3360:
	goto	l3144
	
l784:	
	line	437
	
l3144:	
;MPLAB3.c: 434: }
;MPLAB3.c: 437: result = result_temp/2000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	07h
	movwf	(?___lldiv+1)
	movlw	0D0h
	movwf	(?___lldiv)

	movf	(read_adc@result_temp+3),w
	movwf	3+(?___lldiv)+04h
	movf	(read_adc@result_temp+2),w
	movwf	2+(?___lldiv)+04h
	movf	(read_adc@result_temp+1),w
	movwf	1+(?___lldiv)+04h
	movf	(read_adc@result_temp),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_result+1)
	addwf	(_result+1)
	movf	0+(((0+(?___lldiv)))),w
	clrf	(_result)
	addwf	(_result)

	line	439
	
l788:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,88
	global	___lldiv
psect	text406,local,class=CODE,delta=2
global __ptext406
__ptext406:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    9[COMMON] unsigned long 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dis_num
;;		_read_adc
;; This function uses a non-reentrant model
;;
psect	text406
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l3068:	
	movlw	0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	10
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u3201
	goto	u3200
u3201:
	goto	l3088
u3200:
	line	11
	
l3070:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l3074
	
l990:	
	line	13
	
l3072:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3215:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3215
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l3074
	line	15
	
l989:	
	line	12
	
l3074:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3221
	goto	u3220
u3221:
	goto	l3072
u3220:
	goto	l3076
	
l991:	
	goto	l3076
	line	16
	
l992:	
	line	17
	
l3076:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3235:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3235
	line	18
	
l3078:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u3245
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u3245
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u3245
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u3245:
	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l3084
u3240:
	line	19
	
l3080:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l3082:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l3084
	line	21
	
l993:	
	line	22
	
l3084:	
	movlw	01h
u3255:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u3255

	line	23
	
l3086:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u3261
	goto	u3260
u3261:
	goto	l3076
u3260:
	goto	l3088
	
l994:	
	goto	l3088
	line	24
	
l988:	
	line	25
	
l3088:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l995
	
l3090:	
	line	26
	
l995:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___llmod
psect	text407,local,class=CODE,delta=2
global __ptext407
__ptext407:

;; *************** function ___llmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\llmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  counter         1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dis_num
;; This function uses a non-reentrant model
;;
psect	text407
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\llmod.c"
	line	5
	global	__size_of___llmod
	__size_of___llmod	equ	__end_of___llmod-___llmod
	
___llmod:	
	opt	stack 6
; Regs used in ___llmod: [wreg+status,2+status,0]
	line	8
	
l3048:	
	movf	(___llmod@divisor+3),w
	iorwf	(___llmod@divisor+2),w
	iorwf	(___llmod@divisor+1),w
	iorwf	(___llmod@divisor),w
	skipnz
	goto	u3141
	goto	u3140
u3141:
	goto	l3064
u3140:
	line	9
	
l3050:	
	clrf	(___llmod@counter)
	bsf	status,0
	rlf	(___llmod@counter),f
	line	10
	goto	l3054
	
l971:	
	line	11
	
l3052:	
	movlw	01h
	movwf	(??___llmod+0)+0
u3155:
	clrc
	rlf	(___llmod@divisor),f
	rlf	(___llmod@divisor+1),f
	rlf	(___llmod@divisor+2),f
	rlf	(___llmod@divisor+3),f
	decfsz	(??___llmod+0)+0
	goto	u3155
	line	12
	movlw	(01h)
	movwf	(??___llmod+0)+0
	movf	(??___llmod+0)+0,w
	addwf	(___llmod@counter),f
	goto	l3054
	line	13
	
l970:	
	line	10
	
l3054:	
	btfss	(___llmod@divisor+3),(31)&7
	goto	u3161
	goto	u3160
u3161:
	goto	l3052
u3160:
	goto	l3056
	
l972:	
	goto	l3056
	line	14
	
l973:	
	line	15
	
l3056:	
	movf	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),w
	skipz
	goto	u3175
	movf	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),w
	skipz
	goto	u3175
	movf	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),w
	skipz
	goto	u3175
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),w
u3175:
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l3060
u3170:
	line	16
	
l3058:	
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),f
	movf	(___llmod@divisor+1),w
	skipc
	incfsz	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),f
	movf	(___llmod@divisor+2),w
	skipc
	incfsz	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),f
	movf	(___llmod@divisor+3),w
	skipc
	incfsz	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),f
	goto	l3060
	
l974:	
	line	17
	
l3060:	
	movlw	01h
u3185:
	clrc
	rrf	(___llmod@divisor+3),f
	rrf	(___llmod@divisor+2),f
	rrf	(___llmod@divisor+1),f
	rrf	(___llmod@divisor),f
	addlw	-1
	skipz
	goto	u3185

	line	18
	
l3062:	
	movlw	low(01h)
	subwf	(___llmod@counter),f
	btfss	status,2
	goto	u3191
	goto	u3190
u3191:
	goto	l3056
u3190:
	goto	l3064
	
l975:	
	goto	l3064
	line	19
	
l969:	
	line	20
	
l3064:	
	movf	(___llmod@dividend+3),w
	movwf	(?___llmod+3)
	movf	(___llmod@dividend+2),w
	movwf	(?___llmod+2)
	movf	(___llmod@dividend+1),w
	movwf	(?___llmod+1)
	movf	(___llmod@dividend),w
	movwf	(?___llmod)

	goto	l976
	
l3066:	
	line	21
	
l976:	
	return
	opt stack 0
GLOBAL	__end_of___llmod
	__end_of___llmod:
;; =============== function ___llmod ends ============

	signat	___llmod,8316
	global	___fttol
psect	text408,local,class=CODE,delta=2
global __ptext408
__ptext408:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text408
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2984:	
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l2990
u3020:
	line	50
	
l2986:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l926
	
l2988:	
	goto	l926
	
l925:	
	line	51
	
l2990:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u3035:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u3030:
	addlw	-1
	skipz
	goto	u3035
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2992:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2994:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2996:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2998:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3000:	
	btfss	(___fttol@exp1),7
	goto	u3041
	goto	u3040
u3041:
	goto	l3010
u3040:
	line	57
	
l3002:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u3051
	goto	u3050
u3051:
	goto	l3008
u3050:
	line	58
	
l3004:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l926
	
l3006:	
	goto	l926
	
l928:	
	goto	l3008
	line	59
	
l929:	
	line	60
	
l3008:	
	movlw	01h
u3065:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u3065

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u3071
	goto	u3070
u3071:
	goto	l3008
u3070:
	goto	l3020
	
l930:	
	line	62
	goto	l3020
	
l927:	
	line	63
	
l3010:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l3018
u3080:
	line	64
	
l3012:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l926
	
l3014:	
	goto	l926
	
l932:	
	line	65
	goto	l3018
	
l934:	
	line	66
	
l3016:	
	movlw	01h
	movwf	(??___fttol+0)+0
u3095:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u3095
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l3018
	line	68
	
l933:	
	line	65
	
l3018:	
	movf	(___fttol@exp1),f
	skipz
	goto	u3101
	goto	u3100
u3101:
	goto	l3016
u3100:
	goto	l3020
	
l935:	
	goto	l3020
	line	69
	
l931:	
	line	70
	
l3020:	
	movf	(___fttol@sign1),w
	skipz
	goto	u3110
	goto	l3024
u3110:
	line	71
	
l3022:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l3024
	
l936:	
	line	72
	
l3024:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l926
	
l3026:	
	line	73
	
l926:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text409,local,class=CODE,delta=2
global __ptext409
__ptext409:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftmul
;;		___lwtoft
;;		___ftadd
;;		___ftdiv
;;		___lbtoft
;;		___abtoft
;;		___awtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text409
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2910:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2830
	goto	l2914
u2830:
	
l2912:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l2920
u2840:
	goto	l2914
	
l1150:	
	line	65
	
l2914:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1151
	
l2916:	
	goto	l1151
	
l1148:	
	line	66
	goto	l2920
	
l1153:	
	line	67
	
l2918:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2855:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2855

	goto	l2920
	line	69
	
l1152:	
	line	66
	
l2920:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l2918
u2860:
	goto	l1155
	
l1154:	
	line	70
	goto	l1155
	
l1156:	
	line	71
	
l2922:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l2924:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l2926:	
	movlw	01h
u2875:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2875

	line	74
	
l1155:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l2922
u2880:
	goto	l2930
	
l1157:	
	line	75
	goto	l2930
	
l1159:	
	line	76
	
l2928:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2895:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2895
	goto	l2930
	line	78
	
l1158:	
	line	75
	
l2930:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2901
	goto	u2900
u2901:
	goto	l2928
u2900:
	
l1160:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l1161
u2910:
	line	80
	
l2932:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1161:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l2934:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2925:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2920:
	addlw	-1
	skipz
	goto	u2925
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2936:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2930
	goto	l1162
u2930:
	line	84
	
l2938:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1162:	
	line	85
	line	86
	
l1151:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text410,local,class=CODE,delta=2
global __ptext410
__ptext410:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text410
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2818:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2531
	goto	u2530
u2531:
	goto	l2836
u2530:
	line	9
	
l2820:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2826
	
l834:	
	line	11
	
l2822:	
	movlw	01h
	
u2545:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2545
	line	12
	
l2824:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2826
	line	13
	
l833:	
	line	10
	
l2826:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l2822
u2550:
	goto	l2828
	
l835:	
	goto	l2828
	line	14
	
l836:	
	line	15
	
l2828:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2565
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2565:
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l2832
u2560:
	line	16
	
l2830:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2832
	
l837:	
	line	17
	
l2832:	
	movlw	01h
	
u2575:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2575
	line	18
	
l2834:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2581
	goto	u2580
u2581:
	goto	l2828
u2580:
	goto	l2836
	
l838:	
	goto	l2836
	line	19
	
l832:	
	line	20
	
l2836:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l839
	
l2838:	
	line	21
	
l839:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text411,local,class=CODE,delta=2
global __ptext411
__ptext411:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text411
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2792:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2794:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2461
	goto	u2460
u2461:
	goto	l2814
u2460:
	line	11
	
l2796:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2802
	
l824:	
	line	13
	
l2798:	
	movlw	01h
	
u2475:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2475
	line	14
	
l2800:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2802
	line	15
	
l823:	
	line	12
	
l2802:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l2798
u2480:
	goto	l2804
	
l825:	
	goto	l2804
	line	16
	
l826:	
	line	17
	
l2804:	
	movlw	01h
	
u2495:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2495
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2505
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2505:
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l2810
u2500:
	line	19
	
l2806:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2808:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2810
	line	21
	
l827:	
	line	22
	
l2810:	
	movlw	01h
	
u2515:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2515
	line	23
	
l2812:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2521
	goto	u2520
u2521:
	goto	l2804
u2520:
	goto	l2814
	
l828:	
	goto	l2814
	line	24
	
l822:	
	line	25
	
l2814:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l829
	
l2816:	
	line	26
	
l829:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text412,local,class=CODE,delta=2
global __ptext412
__ptext412:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text412
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 7
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2780:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l2782
	line	6
	
l816:	
	line	7
	
l2782:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l817
u2420:
	line	8
	
l2784:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l817:	
	line	9
	movlw	01h
	
u2435:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2435
	line	10
	
l2786:	
	movlw	01h
	
u2445:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2445
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l2782
u2450:
	goto	l2788
	
l818:	
	line	12
	
l2788:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l819
	
l2790:	
	line	13
	
l819:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_delay
psect	text413,local,class=CODE,delta=2
global __ptext413
__ptext413:

;; *************** function _delay *****************
;; Defined at:
;;		line 456 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  i               2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_send_config
;;		_e_pulse
;;		_send_char
;;		_putch
;;		_lcd_clr
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text413
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	456
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg+status,2+status,0]
	line	458
	
l2740:	
;MPLAB3.c: 458: for(;i>0;i--);
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l2744
u2350:
	goto	l796
	
l2742:	
	goto	l796
	
l794:	
	
l2744:	
	movlw	low(01h)
	subwf	(delay@i),f
	movlw	high(01h)
	skipc
	decf	(delay@i+1),f
	subwf	(delay@i+1),f
	
l2746:	
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l2744
u2360:
	goto	l796
	
l795:	
	line	460
	
l796:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_temp
psect	text414,local,class=CODE,delta=2
global __ptext414
__ptext414:

;; *************** function _read_temp *****************
;; Defined at:
;;		line 444 in file "C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    2[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text414
	file	"C:\Users\Navid\Desktop\FYP\7- UART LABVIEW\MPLAB3.c"
	line	444
	global	__size_of_read_temp
	__size_of_read_temp	equ	__end_of_read_temp-_read_temp
	
_read_temp:	
	opt	stack 7
; Regs used in _read_temp: [wreg+status,2+status,0]
	line	447
	
l2736:	
;MPLAB3.c: 446: unsigned short temp;
;MPLAB3.c: 447: temp=result;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result+1),w
	clrf	(read_temp@temp+1)
	addwf	(read_temp@temp+1)
	movf	(_result),w
	clrf	(read_temp@temp)
	addwf	(read_temp@temp)

	line	448
;MPLAB3.c: 448: return temp;
	movf	(read_temp@temp+1),w
	clrf	(?_read_temp+1)
	addwf	(?_read_temp+1)
	movf	(read_temp@temp),w
	clrf	(?_read_temp)
	addwf	(?_read_temp)

	goto	l791
	
l2738:	
	line	450
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_read_temp
	__end_of_read_temp:
;; =============== function _read_temp ends ============

	signat	_read_temp,90
psect	text415,local,class=CODE,delta=2
global __ptext415
__ptext415:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
