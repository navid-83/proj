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
# 20 "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	psect config,class=CONFIG,delta=2 ;#
# 20 "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	dw 0x3F32 ;#
	FNCALL	_main,_send_config
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_send_char
	FNCALL	_main,_read_adc
	FNCALL	_main,_read_temp
	FNCALL	_main,___lwdiv
	FNCALL	_main,_dis_num
	FNCALL	_main,___lwmod
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,___wmul
	FNCALL	_main,_sprintf
	FNCALL	_main,_mputs
	FNCALL	_dis_num,___lldiv
	FNCALL	_dis_num,___llmod
	FNCALL	_dis_num,_send_char
	FNCALL	_lcd_goto,_send_config
	FNCALL	_mputs,_putch
	FNCALL	_send_char,_delay
	FNCALL	_send_char,_e_pulse
	FNCALL	_send_config,_delay
	FNCALL	_send_config,_e_pulse
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_putch,_delay
	FNCALL	_e_pulse,_delay
	FNCALL	_sprintf,_isdigit
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_read_adc,___lldiv
	FNROOT	_main
	global	_dpowers
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\lib\doprnt.c"
	line	350
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global	_dpowers
	global	_MPP
	global	_current
	global	_e
	global	_light
	global	_temp
	global	_temperature
	global	_voltage
	global	_c
	global	_dummy
	global	_i
	global	_result
	global	_serial_buffer
	global	_ADCON0
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
	
STR_1:	
	retlw	84	;'T'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	53	;'5'
	retlw	100	;'d'
	retlw	86	;'V'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	53	;'5'
	retlw	100	;'d'
	retlw	67	;'C'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	53	;'5'
	retlw	100	;'d'
	retlw	76	;'L'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	53	;'5'
	retlw	100	;'d'
	retlw	37	;'%'
	retlw	99	;'c'
	retlw	37	;'%'
	retlw	99	;'c'
	retlw	0
psect	strings
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

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_serial_buffer:
       ds      40

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
	movlw	low((__pbssBANK0)+013h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+028h)
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
	global	?_mputs
?_mputs:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_e_pulse
?_e_pulse:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_isdigit
?_isdigit:	; 1 bit 
	global	??_isdigit
??_isdigit:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_temp
?_read_temp:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___llmod
?___llmod:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	_isdigit$1367
_isdigit$1367:	; 1 bytes @ 0x0
	global	delay@i
delay@i:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	___llmod@divisor
___llmod@divisor:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x1
	ds	1
	global	??_send_config
??_send_config:	; 0 bytes @ 0x2
	global	??_send_char
??_send_char:	; 0 bytes @ 0x2
	global	??_read_temp
??_read_temp:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_e_pulse
??_e_pulse:	; 0 bytes @ 0x2
	global	??_putch
??_putch:	; 0 bytes @ 0x2
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
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x3
	global	??_mputs
??_mputs:	; 0 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	lcd_goto@data
lcd_goto@data:	; 1 bytes @ 0x4
	global	mputs@str
mputs@str:	; 1 bytes @ 0x4
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
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	1
	global	___llmod@counter
___llmod@counter:	; 1 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	1
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x0
	global	?_dis_num
?_dis_num:	; 0 bytes @ 0x0
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x0
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
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0xD
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xD
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xD
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x10
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x11
	ds	1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x12
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x13
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x13
	ds	1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x14
	ds	2
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x16
	ds	1
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x17
	global	sprintf@_val
sprintf@_val:	; 3 bytes @ 0x17
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x18
	ds	2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x1A
	ds	1
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1B
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1C
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1D
	ds	1
	global	_main$1695
_main$1695:	; 2 bytes @ 0x1E
	ds	2
	global	_main$1696
_main$1696:	; 2 bytes @ 0x20
	ds	2
;;Data sizes: Strings 25, constant 10, data 0, bss 59, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     34      53
;; BANK1           80      0      40
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
;; sprintf@_val._cp	PTR const unsigned char  size(1) Largest target is 1
;;		 -> sprintf@c(BANK0[1]), 
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 25
;;		 -> STR_1(CODE[25]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 40
;;		 -> serial_buffer(BANK1[40]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S1352$_cp	PTR const unsigned char  size(1) Largest target is 1
;;		 -> sprintf@c(BANK0[1]), 
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 1
;;		 -> sprintf@c(BANK0[1]), 
;;
;; mputs@str	PTR unsigned char  size(1) Largest target is 40
;;		 -> serial_buffer(BANK1[40]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lwmod
;;   _dis_num->___lldiv
;;   _dis_num->___lwmod
;;   _lcd_goto->_send_config
;;   _mputs->_putch
;;   _send_char->_delay
;;   _send_config->_delay
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;   _putch->_delay
;;   _e_pulse->_delay
;;   _sprintf->___lwmod
;;   _read_adc->___lldiv
;;   ___fttol->___ftpack
;;   ___lwmod->___lwdiv
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0    5237
;;                                             29 BANK0      5     5      0
;;                        _send_config
;;                           _lcd_goto
;;                          _send_char
;;                           _read_adc
;;                          _read_temp
;;                            ___lwdiv
;;                            _dis_num
;;                            ___lwmod
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
;;                             ___wmul
;;                            _sprintf
;;                              _mputs
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
;; (1) _mputs                                                2     2      0     112
;;                                              3 COMMON     2     2      0
;;                              _putch
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
;; (2) _putch                                                1     1      0      67
;;                                              2 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _e_pulse                                              0     0      0      45
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _sprintf                                             27    14     13    1645
;;                                              0 BANK0     27    14     13
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;;                            ___lwmod
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
;; (2) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _isdigit                                              2     2      0      68
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                2     0      2      45
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
;;       ___lwdiv (ARG)
;;   ___lwmod
;;     ___lwdiv (ARG)
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
;;   _sprintf
;;     _isdigit
;;     ___wmul
;;     ___lwdiv
;;     ___lwmod
;;       ___lwdiv (ARG)
;;   _mputs
;;     _putch
;;       _delay
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
;;ABS                  0      0      6B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     22      35       5       66.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      28       7       50.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      6F      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 67 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
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
;;		___lwtoft
;;		___ftmul
;;		___fttol
;;		___wmul
;;		_sprintf
;;		_mputs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	67
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	68
	
l3742:	
;MPLAB3.c: 68: ADRESH=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	69
;MPLAB3.c: 69: ADRESL=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(158)^080h	;volatile
	line	72
	
l3744:	
;MPLAB3.c: 72: ADCON1=0b11000000;
	movlw	(0C0h)
	movwf	(159)^080h	;volatile
	line	75
	
l3746:	
;MPLAB3.c: 75: TRISA=0b11111111;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	76
;MPLAB3.c: 76: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	77
;MPLAB3.c: 77: TRISC=0b00000000;
	clrf	(135)^080h	;volatile
	line	78
;MPLAB3.c: 78: TRISD=0b00000000;
	clrf	(136)^080h	;volatile
	line	79
;MPLAB3.c: 79: PORTA=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	80
;MPLAB3.c: 80: PORTB=0;
	clrf	(6)	;volatile
	line	81
;MPLAB3.c: 81: PORTC=0;
	clrf	(7)	;volatile
	line	84
	
l3748:	
;MPLAB3.c: 84: send_config(0b00000001);
	movlw	(01h)
	fcall	_send_config
	line	85
	
l3750:	
;MPLAB3.c: 85: send_config(0b00000010);
	movlw	(02h)
	fcall	_send_config
	line	86
	
l3752:	
;MPLAB3.c: 86: send_config(0b00000110);
	movlw	(06h)
	fcall	_send_config
	line	87
	
l3754:	
;MPLAB3.c: 87: send_config(0b00001100);
	movlw	(0Ch)
	fcall	_send_config
	line	88
	
l3756:	
;MPLAB3.c: 88: send_config(0b00111000);
	movlw	(038h)
	fcall	_send_config
	line	94
	
l3758:	
;MPLAB3.c: 94: TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1086/8)^080h,(1086)&7
	line	95
	
l3760:	
;MPLAB3.c: 95: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	98
	
l3762:	
;MPLAB3.c: 98: SPBRG = 129;
	movlw	(081h)
	movwf	(153)^080h	;volatile
	line	100
	
l3764:	
;MPLAB3.c: 100: BRGH = 1;
	bsf	(1218/8)^080h,(1218)&7
	line	103
	
l3766:	
;MPLAB3.c: 103: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	line	106
	
l3768:	
;MPLAB3.c: 106: TX9 = 0;
	bcf	(1222/8)^080h,(1222)&7
	line	107
	
l3770:	
;MPLAB3.c: 107: TXEN = 1;
	bsf	(1221/8)^080h,(1221)&7
	line	110
	
l3772:	
;MPLAB3.c: 110: RX9 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	111
	
l3774:	
;MPLAB3.c: 111: CREN = 1;
	bsf	(196/8),(196)&7
	line	114
	
l3776:	
;MPLAB3.c: 114: SPEN = 1;
	bsf	(199/8),(199)&7
	goto	l3778
	line	118
;MPLAB3.c: 118: while(1)
	
l733:	
	line	123
	
l3778:	
;MPLAB3.c: 119: {
;MPLAB3.c: 123: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	127
	
l3780:	
;MPLAB3.c: 127: send_char('L');
	movlw	(04Ch)
	fcall	_send_char
	line	128
	
l3782:	
;MPLAB3.c: 128: send_char('I');
	movlw	(049h)
	fcall	_send_char
	line	129
	
l3784:	
;MPLAB3.c: 129: send_char('G');
	movlw	(047h)
	fcall	_send_char
	line	130
	
l3786:	
;MPLAB3.c: 130: send_char('H');
	movlw	(048h)
	fcall	_send_char
	line	131
	
l3788:	
;MPLAB3.c: 131: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	132
	
l3790:	
;MPLAB3.c: 132: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	134
	
l3792:	
;MPLAB3.c: 134: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	138
	
l3794:	
;MPLAB3.c: 138: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	139
	
l3796:	
;MPLAB3.c: 139: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	140
	
l3798:	
;MPLAB3.c: 140: send_char('M');
	movlw	(04Dh)
	fcall	_send_char
	line	141
	
l3800:	
;MPLAB3.c: 141: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	142
	
l3802:	
;MPLAB3.c: 142: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	144
	
l3804:	
;MPLAB3.c: 144: lcd_goto(-24);
	movlw	(0E8h)
	fcall	_lcd_goto
	line	148
	
l3806:	
;MPLAB3.c: 148: send_char('V');
	movlw	(056h)
	fcall	_send_char
	line	149
	
l3808:	
;MPLAB3.c: 149: send_char('O');
	movlw	(04Fh)
	fcall	_send_char
	line	150
	
l3810:	
;MPLAB3.c: 150: send_char('L');
	movlw	(04Ch)
	fcall	_send_char
	line	151
	
l3812:	
;MPLAB3.c: 151: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	152
	
l3814:	
;MPLAB3.c: 152: send_char('A');
	movlw	(041h)
	fcall	_send_char
	line	153
	
l3816:	
;MPLAB3.c: 153: send_char('G');
	movlw	(047h)
	fcall	_send_char
	line	154
	
l3818:	
;MPLAB3.c: 154: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	155
	
l3820:	
;MPLAB3.c: 155: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	157
	
l3822:	
;MPLAB3.c: 157: lcd_goto(40);
	movlw	(028h)
	fcall	_lcd_goto
	line	161
	
l3824:	
;MPLAB3.c: 161: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	162
	
l3826:	
;MPLAB3.c: 162: send_char('U');
	movlw	(055h)
	fcall	_send_char
	line	163
	
l3828:	
;MPLAB3.c: 163: send_char('R');
	movlw	(052h)
	fcall	_send_char
	line	164
	
l3830:	
;MPLAB3.c: 164: send_char('R');
	movlw	(052h)
	fcall	_send_char
	line	165
	
l3832:	
;MPLAB3.c: 165: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	166
	
l3834:	
;MPLAB3.c: 166: send_char('N');
	movlw	(04Eh)
	fcall	_send_char
	line	167
	
l3836:	
;MPLAB3.c: 167: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	168
	
l3838:	
;MPLAB3.c: 168: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	goto	l3840
	line	171
;MPLAB3.c: 171: while(1)
	
l734:	
	line	177
	
l3840:	
;MPLAB3.c: 172: {
;MPLAB3.c: 177: ADCON0=0b10000001;
	movlw	(081h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	178
	
l3842:	
;MPLAB3.c: 178: lcd_goto(8);
	movlw	(08h)
	fcall	_lcd_goto
	line	179
	
l3844:	
;MPLAB3.c: 179: read_adc();
	fcall	_read_adc
	line	180
	
l3846:	
;MPLAB3.c: 180: light=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_light+1)
	addwf	(_light+1)
	movf	(0+(?_read_temp)),w
	clrf	(_light)
	addwf	(_light)

	line	182
	
l3848:	
;MPLAB3.c: 182: dis_num(light/10);
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
	line	183
	
l3850:	
;MPLAB3.c: 183: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	184
	
l3852:	
;MPLAB3.c: 184: dis_num(light%10);
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
	line	191
	
l3854:	
;MPLAB3.c: 191: ADCON0=0b10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	192
	
l3856:	
;MPLAB3.c: 192: lcd_goto(28);
	movlw	(01Ch)
	fcall	_lcd_goto
	line	193
	
l3858:	
;MPLAB3.c: 193: read_adc();
	fcall	_read_adc
	line	194
	
l3860:	
;MPLAB3.c: 194: temperature=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temperature+1)
	addwf	(_temperature+1)
	movf	(0+(?_read_temp)),w
	clrf	(_temperature)
	addwf	(_temperature)

	line	195
	
l3862:	
;MPLAB3.c: 195: temperature = (temperature*0.48876);
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

	line	199
	
l3864:	
;MPLAB3.c: 199: dis_num(temperature);
	movf	(_temperature),w
	movwf	(?_dis_num)
	movf	(_temperature+1),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	201
	
l3866:	
;MPLAB3.c: 201: send_char(0b11011111);
	movlw	(0DFh)
	fcall	_send_char
	line	202
	
l3868:	
;MPLAB3.c: 202: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	203
	
l3870:	
;MPLAB3.c: 203: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	204
	
l3872:	
;MPLAB3.c: 204: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	206
	
l3874:	
;MPLAB3.c: 206: if(temperature>40)
	movlw	high(029h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_temperature+1),w
	movlw	low(029h)
	skipnz
	subwf	(_temperature),w
	skipc
	goto	u4081
	goto	u4080
u4081:
	goto	l735
u4080:
	line	208
	
l3876:	
;MPLAB3.c: 207: {
;MPLAB3.c: 208: RB0=1;
	bsf	(48/8),(48)&7
	line	209
;MPLAB3.c: 209: }
	goto	l3878
	line	211
	
l735:	
	line	213
;MPLAB3.c: 211: else
;MPLAB3.c: 212: {
;MPLAB3.c: 213: RB0=0;
	bcf	(48/8),(48)&7
	goto	l3878
	line	214
	
l736:	
	line	221
	
l3878:	
;MPLAB3.c: 214: }
;MPLAB3.c: 221: ADCON0=0b10010001;
	movlw	(091h)
	movwf	(31)	;volatile
	line	222
	
l3880:	
;MPLAB3.c: 222: lcd_goto(-16);
	movlw	(0F0h)
	fcall	_lcd_goto
	line	223
	
l3882:	
;MPLAB3.c: 223: read_adc();
	fcall	_read_adc
	line	224
	
l3884:	
;MPLAB3.c: 224: voltage=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_voltage+1)
	addwf	(_voltage+1)
	movf	(0+(?_read_temp)),w
	clrf	(_voltage)
	addwf	(_voltage)

	line	227
	
l3886:	
;MPLAB3.c: 227: voltage=(voltage*4.836587680029639272430897954192);
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

	line	230
	
l3888:	
;MPLAB3.c: 230: dis_num(voltage/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
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
	line	231
	
l3890:	
;MPLAB3.c: 231: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	232
	
l3892:	
;MPLAB3.c: 232: dis_num(voltage%10);
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
	line	233
	
l3894:	
;MPLAB3.c: 233: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	234
	
l3896:	
;MPLAB3.c: 234: send_char('V');
	movlw	(056h)
	fcall	_send_char
	line	235
	
l3898:	
;MPLAB3.c: 235: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	241
;MPLAB3.c: 241: ADCON0=0b10011001;
	movlw	(099h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	242
	
l3900:	
;MPLAB3.c: 242: lcd_goto(48);
	movlw	(030h)
	fcall	_lcd_goto
	line	243
	
l3902:	
;MPLAB3.c: 243: read_adc();
	fcall	_read_adc
	line	244
	
l3904:	
;MPLAB3.c: 244: current=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_current+1)
	addwf	(_current+1)
	movf	(0+(?_read_temp)),w
	clrf	(_current)
	addwf	(_current)

	line	246
	
l3906:	
;MPLAB3.c: 246: current=current/3;
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

	line	250
	
l3908:	
;MPLAB3.c: 250: dis_num(current/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
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
	
l3910:	
;MPLAB3.c: 251: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	252
	
l3912:	
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
	
l3914:	
;MPLAB3.c: 254: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	255
	
l3916:	
;MPLAB3.c: 255: send_char('A');
	movlw	(041h)
	fcall	_send_char
	line	256
	
l3918:	
;MPLAB3.c: 256: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	261
	
l3920:	
;MPLAB3.c: 261: lcd_goto(51);
	movlw	(033h)
	fcall	_lcd_goto
	line	265
	
l3922:	
;MPLAB3.c: 265: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	266
	
l3924:	
;MPLAB3.c: 266: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	267
	
l3926:	
;MPLAB3.c: 267: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	268
	
l3928:	
;MPLAB3.c: 268: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	271
	
l3930:	
;MPLAB3.c: 271: MPP=voltage * current;
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

	line	273
	
l3932:	
;MPLAB3.c: 273: dis_num(MPP/100);
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
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
	line	274
	
l3934:	
;MPLAB3.c: 274: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	275
	
l3936:	
;MPLAB3.c: 275: dis_num(current%10);
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
	line	280
	
l3938:	
;MPLAB3.c: 280: sprintf(serial_buffer,"T%05dV%05dC%05dL%05d%c%c",light/10,temperature,voltage,current/10,0xA,0xD);
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
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_main$1695+1)
	addwf	(_main$1695+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_main$1695)
	addwf	(_main$1695)

	
l3940:	
;MPLAB3.c: 280: sprintf(serial_buffer,"T%05dV%05dC%05dL%05d%c%c",light/10,temperature,voltage,current/10,0xA,0xD);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
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
	clrf	(_main$1696+1)
	addwf	(_main$1696+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_main$1696)
	addwf	(_main$1696)

	
l3942:	
;MPLAB3.c: 280: sprintf(serial_buffer,"T%05dV%05dC%05dL%05d%c%c",light/10,temperature,voltage,current/10,0xA,0xD);
	movlw	((STR_1-__stringbase))&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_sprintf)
	movf	(_main$1695+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(_main$1695),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movf	(_temperature+1),w
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	movf	(_temperature),w
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movf	(_voltage+1),w
	clrf	1+(?_sprintf)+05h
	addwf	1+(?_sprintf)+05h
	movf	(_voltage),w
	clrf	0+(?_sprintf)+05h
	addwf	0+(?_sprintf)+05h

	movf	(_main$1696+1),w
	clrf	1+(?_sprintf)+07h
	addwf	1+(?_sprintf)+07h
	movf	(_main$1696),w
	clrf	0+(?_sprintf)+07h
	addwf	0+(?_sprintf)+07h

	movlw	low(0Ah)
	movwf	0+(?_sprintf)+09h
	movlw	high(0Ah)
	movwf	(0+(?_sprintf)+09h)+1
	movlw	low(0Dh)
	movwf	0+(?_sprintf)+0Bh
	movlw	high(0Dh)
	movwf	(0+(?_sprintf)+0Bh)+1
	movlw	(_serial_buffer)&0ffh
	fcall	_sprintf
	line	288
	
l3944:	
;MPLAB3.c: 288: mputs(serial_buffer);
	movlw	(_serial_buffer)&0ffh
	fcall	_mputs
	goto	l3840
	line	290
	
l737:	
	line	171
	goto	l3840
	
l738:	
	goto	l3778
	line	292
	
l739:	
	line	118
	goto	l3778
	
l740:	
	line	294
	
l741:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dis_num
psect	text457,local,class=CODE,delta=2
global __ptext457
__ptext457:

;; *************** function _dis_num *****************
;; Defined at:
;;		line 358 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text457
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	358
	global	__size_of_dis_num
	__size_of_dis_num	equ	__end_of_dis_num-_dis_num
	
_dis_num:	
	opt	stack 4
; Regs used in _dis_num: [wreg+status,2+status,0+pclath+cstack]
	line	365
	
l3718:	
;MPLAB3.c: 359: unsigned char hundred_thousand;
;MPLAB3.c: 360: unsigned char ten_thousand;
;MPLAB3.c: 361: unsigned char thousand;
;MPLAB3.c: 362: unsigned char hundred;
;MPLAB3.c: 363: unsigned char tenth;
;MPLAB3.c: 365: hundred_thousand = data/100000;
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
	line	366
;MPLAB3.c: 366: data = data % 100000;
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

	line	367
;MPLAB3.c: 367: ten_thousand = data/10000;
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
	line	368
;MPLAB3.c: 368: data = data % 10000;
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

	line	369
;MPLAB3.c: 369: thousand = data / 1000;
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
	line	370
;MPLAB3.c: 370: data = data % 1000;
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

	line	371
;MPLAB3.c: 371: hundred = data / 100;
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
	line	372
;MPLAB3.c: 372: data = data % 100;
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

	line	373
;MPLAB3.c: 373: tenth = data / 10;
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
	line	374
;MPLAB3.c: 374: data = data % 10;
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

	line	376
	
l3720:	
;MPLAB3.c: 376: if(hundred_thousand>0)
	movf	(dis_num@hundred_thousand),w
	skipz
	goto	u4030
	goto	l3724
u4030:
	line	378
	
l3722:	
;MPLAB3.c: 377: {
;MPLAB3.c: 378: send_char(hundred_thousand + 0x30);
	movf	(dis_num@hundred_thousand),w
	addlw	030h
	fcall	_send_char
	line	379
;MPLAB3.c: 379: send_char(ten_thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	380
;MPLAB3.c: 380: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	381
;MPLAB3.c: 381: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	382
;MPLAB3.c: 382: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	383
;MPLAB3.c: 383: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	384
;MPLAB3.c: 384: }
	goto	l779
	line	386
	
l769:	
	
l3724:	
;MPLAB3.c: 386: else if(ten_thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	skipz
	goto	u4040
	goto	l3728
u4040:
	line	388
	
l3726:	
;MPLAB3.c: 387: {
;MPLAB3.c: 388: send_char(ten_thousand + 0x30);
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	389
;MPLAB3.c: 389: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	390
;MPLAB3.c: 390: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	391
;MPLAB3.c: 391: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	392
;MPLAB3.c: 392: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	393
;MPLAB3.c: 393: }
	goto	l779
	line	394
	
l771:	
	
l3728:	
;MPLAB3.c: 394: else if(thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	skipz
	goto	u4050
	goto	l3732
u4050:
	line	396
	
l3730:	
;MPLAB3.c: 395: {
;MPLAB3.c: 396: send_char(thousand + 0x30);
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	397
;MPLAB3.c: 397: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	398
;MPLAB3.c: 398: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l779
	line	401
	
l773:	
	
l3732:	
;MPLAB3.c: 401: else if(hundred>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	skipz
	goto	u4060
	goto	l3736
u4060:
	line	403
	
l3734:	
;MPLAB3.c: 402: {
;MPLAB3.c: 403: send_char(hundred + 0x30);
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	404
;MPLAB3.c: 404: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	405
;MPLAB3.c: 405: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	406
;MPLAB3.c: 406: }
	goto	l779
	line	407
	
l775:	
	
l3736:	
;MPLAB3.c: 407: else if(tenth>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	skipz
	goto	u4070
	goto	l3740
u4070:
	line	409
	
l3738:	
;MPLAB3.c: 408: {
;MPLAB3.c: 409: send_char(tenth + 0x30);
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	410
;MPLAB3.c: 410: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	411
;MPLAB3.c: 411: }
	goto	l779
	line	412
	
l777:	
	
l3740:	
;MPLAB3.c: 412: else send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	goto	l779
	
l778:	
	goto	l779
	
l776:	
	goto	l779
	
l774:	
	goto	l779
	
l772:	
	goto	l779
	
l770:	
	line	413
	
l779:	
	return
	opt stack 0
GLOBAL	__end_of_dis_num
	__end_of_dis_num:
;; =============== function _dis_num ends ============

	signat	_dis_num,4216
	global	_lcd_goto
psect	text458,local,class=CODE,delta=2
global __ptext458
__ptext458:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 327 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text458
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	327
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 4
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@data stored from wreg
	movwf	(lcd_goto@data)
	line	328
	
l3710:	
;MPLAB3.c: 328: if(data<16)
	movlw	(010h)
	subwf	(lcd_goto@data),w
	skipnc
	goto	u4021
	goto	u4020
u4021:
	goto	l3714
u4020:
	line	330
	
l3712:	
;MPLAB3.c: 329: {
;MPLAB3.c: 330: send_config(0x80+data);
	movf	(lcd_goto@data),w
	addlw	080h
	fcall	_send_config
	line	331
;MPLAB3.c: 331: }
	goto	l755
	line	332
	
l753:	
	line	334
	
l3714:	
;MPLAB3.c: 332: else
;MPLAB3.c: 333: {
;MPLAB3.c: 334: data=data-20;
	movf	(lcd_goto@data),w
	addlw	0ECh
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(lcd_goto@data)
	line	335
	
l3716:	
;MPLAB3.c: 335: send_config(0xc0+data);
	movf	(lcd_goto@data),w
	addlw	0C0h
	fcall	_send_config
	goto	l755
	line	336
	
l754:	
	line	337
	
l755:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_mputs
psect	text459,local,class=CODE,delta=2
global __ptext459
__ptext459:

;; *************** function _mputs *****************
;; Defined at:
;;		line 489 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> serial_buffer(40), 
;; Auto vars:     Size  Location     Type
;;  str             1    4[COMMON] PTR unsigned char 
;;		 -> serial_buffer(40), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text459
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	489
	global	__size_of_mputs
	__size_of_mputs	equ	__end_of_mputs-_mputs
	
_mputs:	
	opt	stack 5
; Regs used in _mputs: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;mputs@str stored from wreg
	movwf	(mputs@str)
	line	490
	
l3702:	
;MPLAB3.c: 490: while((*str)!=0)
	goto	l3708
	
l809:	
	line	492
	
l3704:	
;MPLAB3.c: 491: {
;MPLAB3.c: 492: putch(*str);
	movf	(mputs@str),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_putch
	line	493
	
l3706:	
;MPLAB3.c: 493: str++;
	movlw	(01h)
	movwf	(??_mputs+0)+0
	movf	(??_mputs+0)+0,w
	addwf	(mputs@str),f
	goto	l3708
	line	494
	
l808:	
	line	490
	
l3708:	
	movf	(mputs@str),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u4011
	goto	u4010
u4011:
	goto	l3704
u4010:
	goto	l811
	
l810:	
	line	495
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_mputs
	__end_of_mputs:
;; =============== function _mputs ends ============

	signat	_mputs,4216
	global	_send_char
psect	text460,local,class=CODE,delta=2
global __ptext460
__ptext460:

;; *************** function _send_char *****************
;; Defined at:
;;		line 315 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text460
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	315
	global	__size_of_send_char
	__size_of_send_char	equ	__end_of_send_char-_send_char
	
_send_char:	
	opt	stack 4
; Regs used in _send_char: [wreg+status,2+status,0+pclath+cstack]
;send_char@data stored from wreg
	movwf	(send_char@data)
	line	316
	
l3694:	
;MPLAB3.c: 316: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	318
	
l3696:	
;MPLAB3.c: 318: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	319
;MPLAB3.c: 319: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	320
;MPLAB3.c: 320: PORTD=data;
	movf	(send_char@data),w
	movwf	(8)	;volatile
	line	321
	
l3698:	
;MPLAB3.c: 321: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	322
	
l3700:	
;MPLAB3.c: 322: e_pulse();
	fcall	_e_pulse
	line	323
	
l750:	
	return
	opt stack 0
GLOBAL	__end_of_send_char
	__end_of_send_char:
;; =============== function _send_char ends ============

	signat	_send_char,4216
	global	_send_config
psect	text461,local,class=CODE,delta=2
global __ptext461
__ptext461:

;; *************** function _send_config *****************
;; Defined at:
;;		line 299 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text461
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	299
	global	__size_of_send_config
	__size_of_send_config	equ	__end_of_send_config-_send_config
	
_send_config:	
	opt	stack 4
; Regs used in _send_config: [wreg+status,2+status,0+pclath+cstack]
;send_config@data stored from wreg
	movwf	(send_config@data)
	line	300
	
l3686:	
;MPLAB3.c: 300: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	301
	
l3688:	
;MPLAB3.c: 301: PORTD=data;
	movf	(send_config@data),w
	movwf	(8)	;volatile
	line	302
	
l3690:	
;MPLAB3.c: 302: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	303
	
l3692:	
;MPLAB3.c: 303: e_pulse();
	fcall	_e_pulse
	line	304
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_send_config
	__end_of_send_config:
;; =============== function _send_config ends ============

	signat	_send_config,4216
	global	___lwtoft
psect	text462,local,class=CODE,delta=2
global __ptext462
__ptext462:

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
psect	text462
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3682:	
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
	goto	l1115
	
l3684:	
	line	31
	
l1115:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text463,local,class=CODE,delta=2
global __ptext463
__ptext463:

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
psect	text463
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l3632:	
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
	goto	u3871
	goto	u3870
u3871:
	goto	l3638
u3870:
	line	57
	
l3634:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l991
	
l3636:	
	goto	l991
	
l990:	
	line	58
	
l3638:	
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
	goto	u3881
	goto	u3880
u3881:
	goto	l3644
u3880:
	line	59
	
l3640:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l991
	
l3642:	
	goto	l991
	
l992:	
	line	60
	
l3644:	
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
u3895:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3890:
	addlw	-1
	skipz
	goto	u3895
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
u3905:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3900:
	addlw	-1
	skipz
	goto	u3905
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
	
l3646:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l3648:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l3650:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l3652:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l3654:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3656
	line	70
	
l993:	
	line	71
	
l3656:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l3660
u3910:
	line	72
	
l3658:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3921
	addwf	(___ftmul@f3_as_product+1),f
u3921:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3922
	addwf	(___ftmul@f3_as_product+2),f
u3922:

	goto	l3660
	
l994:	
	line	73
	
l3660:	
	movlw	01h
u3935:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3935

	line	74
	
l3662:	
	movlw	01h
u3945:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3945
	line	75
	
l3664:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3951
	goto	u3950
u3951:
	goto	l3656
u3950:
	goto	l3666
	
l995:	
	line	76
	
l3666:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3668
	line	77
	
l996:	
	line	78
	
l3668:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l3672
u3960:
	line	79
	
l3670:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3971
	addwf	(___ftmul@f3_as_product+1),f
u3971:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3972
	addwf	(___ftmul@f3_as_product+2),f
u3972:

	goto	l3672
	
l997:	
	line	80
	
l3672:	
	movlw	01h
u3985:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3985

	line	81
	
l3674:	
	movlw	01h
u3995:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3995

	line	82
	
l3676:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u4001
	goto	u4000
u4001:
	goto	l3668
u4000:
	goto	l3678
	
l998:	
	line	83
	
l3678:	
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
	goto	l991
	
l3680:	
	line	84
	
l991:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_putch
psect	text464,local,class=CODE,delta=2
global __ptext464
__ptext464:

;; *************** function _putch *****************
;; Defined at:
;;		line 499 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
;;		_mputs
;; This function uses a non-reentrant model
;;
psect	text464
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	499
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 5
; Regs used in _putch: [wreg+status,2+status,0+pclath+cstack]
;putch@c stored from wreg
	movwf	(putch@c)
	line	500
	
l3626:	
;MPLAB3.c: 500: while(!TXIF)
	goto	l814
	
l815:	
	line	503
# 503 "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
clrwdt ;#
psect	text464
	line	504
	
l814:	
	line	500
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u3861
	goto	u3860
u3861:
	goto	l815
u3860:
	goto	l3628
	
l816:	
	line	505
	
l3628:	
;MPLAB3.c: 504: }
;MPLAB3.c: 505: TXREG=c;
	movf	(putch@c),w
	movwf	(25)	;volatile
	line	506
	
l3630:	
;MPLAB3.c: 506: delay(60);
	movlw	low(03Ch)
	movwf	(?_delay)
	movlw	high(03Ch)
	movwf	((?_delay))+1
	fcall	_delay
	line	507
	
l817:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_e_pulse
psect	text465,local,class=CODE,delta=2
global __ptext465
__ptext465:

;; *************** function _e_pulse *****************
;; Defined at:
;;		line 307 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text465
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	307
	global	__size_of_e_pulse
	__size_of_e_pulse	equ	__end_of_e_pulse-_e_pulse
	
_e_pulse:	
	opt	stack 4
; Regs used in _e_pulse: [wreg+status,2+status,0+pclath+cstack]
	line	308
	
l3620:	
;MPLAB3.c: 308: RB5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	line	309
	
l3622:	
;MPLAB3.c: 309: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	310
	
l3624:	
;MPLAB3.c: 310: RB5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
	line	311
;MPLAB3.c: 311: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	312
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_e_pulse
	__end_of_e_pulse:
;; =============== function _e_pulse ends ============

	signat	_e_pulse,88
	global	_sprintf
psect	text466,local,class=CODE,delta=2
global __ptext466
__ptext466:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.81\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> serial_buffer(40), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_1(25), 
;; Auto vars:     Size  Location     Type
;;  sp              1   22[BANK0 ] PTR unsigned char 
;;		 -> serial_buffer(40), 
;;  _val            3   23[BANK0 ] struct .
;;  width           2   20[BANK0 ] int 
;;  c               1   26[BANK0 ] char 
;;  flag            1   19[BANK0 ] unsigned char 
;;  ap              1   18[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   17[BANK0 ] char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0      13       0       0       0
;;      Locals:         0      10       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      27       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_isdigit
;;		___wmul
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text466
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 6
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	
l3480:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l3614
	
l829:	
	line	542
	
l3482:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u3641
	goto	u3640
u3641:
	goto	l3488
u3640:
	line	545
	
l3484:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3486:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l3614
	line	547
	
l830:	
	line	550
	
l3488:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l3490:	
	clrf	(sprintf@flag)
	goto	l3496
	line	554
	
l831:	
	line	555
	goto	l3496
	line	583
	
l833:	
	line	584
	bsf	(sprintf@flag)+(2/8),(2)&7
	line	585
	
l3492:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	586
	goto	l3496
	line	588
	
l3494:	
	goto	l3498
	line	555
	
l832:	
	
l3496:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 48 to 48
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           14    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	48^0	; case 48
	skipnz
	goto	l833
	goto	l3498
	opt asmopt_on

	line	588
	
l835:	
	line	589
	goto	l3498
	line	590
	
l834:	
	goto	l3496
	
l836:	
	line	601
	
l3498:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u3651
	goto	u3650
u3651:
	goto	l3538
u3650:
	line	602
	
l3500:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l3502
	line	603
	
l838:	
	line	604
	
l3502:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	movf	(sprintf@width+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(sprintf@width),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_sprintf+0)+0,w
	addwf	(0+(?___wmul)),w
	movwf	(??_sprintf+2)+0
	movf	1+(??_sprintf+0)+0,w
	skipnc
	incf	1+(??_sprintf+0)+0,w
	addwf	(1+(?___wmul)),w
	movwf	1+(??_sprintf+2)+0
	movf	0+(??_sprintf+2)+0,w
	addlw	low(0FFD0h)
	movwf	(sprintf@width)
	movf	1+(??_sprintf+2)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD0h)
	movwf	1+(sprintf@width)
	
l3504:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l3506:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u3661
	goto	u3660
u3661:
	goto	l3502
u3660:
	goto	l3538
	
l839:	
	goto	l3538
	line	611
	
l837:	
	line	638
	goto	l3538
	line	640
	
l841:	
	line	641
	goto	l3616
	line	700
	
l843:	
	goto	l3540
	line	701
	
l844:	
	line	702
	goto	l3540
	line	753
	
l846:	
	line	760
	
l3508:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@width+1),w
	subwf	1+(sprintf@_val)+01h,w
	skipz
	goto	u3675
	movf	(sprintf@width),w
	subwf	0+(sprintf@_val)+01h,w
u3675:
	skipnc
	goto	u3671
	goto	u3670
u3671:
	goto	l3512
u3670:
	line	761
	
l3510:	
	movf	0+(sprintf@_val)+01h,w
	subwf	(sprintf@width),f
	movf	1+(sprintf@_val)+01h,w
	skipc
	decf	(sprintf@width+1),f
	subwf	(sprintf@width+1),f
	goto	l3518
	line	762
	
l847:	
	line	763
	
l3512:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l3518
	
l848:	
	line	767
	goto	l3518
	
l850:	
	line	768
	
l3514:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3516:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3518
	
l849:	
	line	767
	
l3518:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movlw	high(-1)
	xorwf	((sprintf@width+1)),w
	skipz
	goto	u3685
	movlw	low(-1)
	xorwf	((sprintf@width)),w
u3685:

	skipz
	goto	u3681
	goto	u3680
u3681:
	goto	l3514
u3680:
	goto	l3526
	
l851:	
	line	770
	goto	l3526
	
l853:	
	line	771
	
l3520:	
	movf	(sprintf@_val),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	movwf	indf
	
l3522:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@_val),f
	
l3524:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3526
	
l852:	
	line	770
	
l3526:	
	movlw	low(01h)
	subwf	0+(sprintf@_val)+01h,f
	movlw	high(01h)
	skipc
	decf	1+(sprintf@_val)+01h,f
	subwf	1+(sprintf@_val)+01h,f
	movlw	high(0FFFFh)
	xorwf	(1+(sprintf@_val)+01h),w
	skipz
	goto	u3695
	movlw	low(0FFFFh)
	xorwf	(0+(sprintf@_val)+01h),w
u3695:

	skipz
	goto	u3691
	goto	u3690
u3691:
	goto	l3520
u3690:
	goto	l3614
	
l854:	
	line	777
	goto	l3614
	line	787
	
l855:	
	line	802
	
l3528:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	
l3530:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	goto	l3532
	line	805
	
l856:	
	line	808
	
l3532:	
	movlw	(sprintf@c)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@_val)
	line	809
	
l3534:	
	movlw	low(01h)
	movwf	0+(sprintf@_val)+01h
	movlw	high(01h)
	movwf	(0+(sprintf@_val)+01h)+1
	line	810
	goto	l3508
	line	825
	
l3536:	
	goto	l3540
	line	638
	
l840:	
	
l3538:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 105
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
; rangetable           110     6 (fixed)
; spacedrange          218     9 (fixed)
; locatedrange         106     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3616
	xorlw	99^0	; case 99
	skipnz
	goto	l3528
	xorlw	100^99	; case 100
	skipnz
	goto	l3540
	xorlw	105^100	; case 105
	skipnz
	goto	l3540
	goto	l3532
	opt asmopt_on

	line	825
	
l845:	
	line	1254
	
l3540:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l3542:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l3544:	
	btfss	(sprintf@_val+1),7
	goto	u3701
	goto	u3700
u3701:
	goto	l3550
u3700:
	line	1257
	
l3546:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l3548:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l3550
	line	1259
	
l857:	
	line	1300
	
l3550:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l3552:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l3556
u3710:
	goto	l3564
	
l3554:	
	goto	l3564
	line	1301
	
l858:	
	
l3556:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u3725
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u3725:
	skipnc
	goto	u3721
	goto	u3720
u3721:
	goto	l3560
u3720:
	goto	l3564
	line	1302
	
l3558:	
	goto	l3564
	
l860:	
	line	1300
	
l3560:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l3562:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l3556
u3730:
	goto	l3564
	
l859:	
	line	1340
	
l3564:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u3741
	goto	u3740
u3741:
	goto	l861
u3740:
	
l3566:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u3751
	goto	u3750
u3751:
	goto	l861
u3750:
	line	1341
	
l3568:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	
l861:	
	line	1376
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	1+(??_sprintf+0)+0,w
	xorlw	80h
	movwf	(??_sprintf+2)+0
	movf	(sprintf@width+1),w
	xorlw	80h
	subwf	(??_sprintf+2)+0,w
	skipz
	goto	u3765
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u3765:

	skipnc
	goto	u3761
	goto	u3760
u3761:
	goto	l3572
u3760:
	line	1377
	
l3570:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	0+(??_sprintf+0)+0,w
	subwf	(sprintf@width),f
	movf	1+(??_sprintf+0)+0,w
	skipc
	decf	(sprintf@width+1),f
	subwf	(sprintf@width+1),f
	goto	l3574
	line	1378
	
l862:	
	line	1379
	
l3572:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l3574
	
l863:	
	line	1382
	
l3574:	
	btfss	(sprintf@flag),(2)&7
	goto	u3771
	goto	u3770
u3771:
	goto	l3590
u3770:
	line	1387
	
l3576:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u3781
	goto	u3780
u3781:
	goto	l3582
u3780:
	line	1388
	
l3578:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3580:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3582
	
l865:	
	line	1410
	
l3582:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u3791
	goto	u3790
u3791:
	goto	l3604
u3790:
	goto	l3584
	line	1411
	
l867:	
	line	1412
	
l3584:	
	movlw	(030h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3586:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1413
	
l3588:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u3801
	goto	u3800
u3801:
	goto	l3584
u3800:
	goto	l3604
	
l868:	
	goto	l3604
	
l866:	
	line	1415
	goto	l3604
	
l864:	
	line	1423
	
l3590:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u3811
	goto	u3810
u3811:
	goto	l3598
u3810:
	goto	l3592
	line	1424
	
l871:	
	line	1425
	
l3592:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3594:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l3596:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u3821
	goto	u3820
u3821:
	goto	l3592
u3820:
	goto	l3598
	
l872:	
	goto	l3598
	
l870:	
	line	1433
	
l3598:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u3831
	goto	u3830
u3831:
	goto	l3604
u3830:
	line	1434
	
l3600:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3602:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3604
	
l873:	
	goto	l3604
	line	1464
	
l869:	
	line	1467
	
l3604:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l3612
	
l875:	
	line	1484
	
l3606:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)
	fcall	stringdir
	movwf	(?___lwdiv+1)
	movf	(sprintf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(sprintf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1516
	
l3608:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3610:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3612
	line	1517
	
l874:	
	line	1469
	
l3612:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u3841
	goto	u3840
u3841:
	goto	l3606
u3840:
	goto	l3614
	
l876:	
	goto	l3614
	line	1525
	
l828:	
	line	540
	
l3614:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u3851
	goto	u3850
u3851:
	goto	l3482
u3850:
	goto	l3616
	
l877:	
	goto	l3616
	line	1527
	
l842:	
	line	1530
	
l3616:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l878
	line	1532
	
l3618:	
	line	1533
;	Return value of _sprintf is never used
	
l878:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_read_adc
psect	text467,local,class=CODE,delta=2
global __ptext467
__ptext467:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 431 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text467
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	431
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 6
; Regs used in _read_adc: [wreg+status,2+status,0+pclath+cstack]
	line	433
	
l3468:	
;MPLAB3.c: 432: unsigned short i;
;MPLAB3.c: 433: unsigned long result_temp=0;
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

	line	434
;MPLAB3.c: 434: for(i=2000;i>0;i-=1)
	movlw	low(07D0h)
	movwf	(read_adc@i)
	movlw	high(07D0h)
	movwf	((read_adc@i))+1
	
l3470:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u3601
	goto	u3600
u3601:
	goto	l787
u3600:
	goto	l3478
	
l3472:	
	goto	l3478
	line	436
	
l787:	
	line	438
;MPLAB3.c: 436: {
;MPLAB3.c: 438: ADGO = 1;
	bsf	(250/8),(250)&7
	line	439
;MPLAB3.c: 439: while(ADGO==1);
	goto	l789
	
l790:	
	
l789:	
	btfsc	(250/8),(250)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l789
u3610:
	goto	l3474
	
l791:	
	line	440
	
l3474:	
;MPLAB3.c: 440: result=ADRESH;
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	441
;MPLAB3.c: 441: result=result<<8;
	movf	(_result),w
	movwf	(??_read_adc+0)+0+1
	clrf	(??_read_adc+0)+0
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	442
;MPLAB3.c: 442: result=256*result|ADRESL;
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
	line	443
;MPLAB3.c: 443: result_temp+=result;
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
	goto	u3621
	addwf	(read_adc@result_temp+1),f
u3621:
	movf	2+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3622
	addwf	(read_adc@result_temp+2),f
u3622:
	movf	3+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3623
	addwf	(read_adc@result_temp+3),f
u3623:

	line	434
	movlw	low(01h)
	subwf	(read_adc@i),f
	movlw	high(01h)
	skipc
	decf	(read_adc@i+1),f
	subwf	(read_adc@i+1),f
	
l3476:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u3631
	goto	u3630
u3631:
	goto	l787
u3630:
	goto	l3478
	
l788:	
	line	448
	
l3478:	
;MPLAB3.c: 445: }
;MPLAB3.c: 448: result = result_temp/2000;
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

	line	450
	
l792:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,88
	global	___lldiv
psect	text468,local,class=CODE,delta=2
global __ptext468
__ptext468:

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
psect	text468
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l3402:	
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
	goto	u3471
	goto	u3470
u3471:
	goto	l3422
u3470:
	line	11
	
l3404:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l3408
	
l1066:	
	line	13
	
l3406:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3485:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3485
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l3408
	line	15
	
l1065:	
	line	12
	
l3408:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3491
	goto	u3490
u3491:
	goto	l3406
u3490:
	goto	l3410
	
l1067:	
	goto	l3410
	line	16
	
l1068:	
	line	17
	
l3410:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3505:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3505
	line	18
	
l3412:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u3515
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u3515
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u3515
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u3515:
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l3418
u3510:
	line	19
	
l3414:	
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
	
l3416:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l3418
	line	21
	
l1069:	
	line	22
	
l3418:	
	movlw	01h
u3525:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u3525

	line	23
	
l3420:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u3531
	goto	u3530
u3531:
	goto	l3410
u3530:
	goto	l3422
	
l1070:	
	goto	l3422
	line	24
	
l1064:	
	line	25
	
l3422:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l1071
	
l3424:	
	line	26
	
l1071:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___llmod
psect	text469,local,class=CODE,delta=2
global __ptext469
__ptext469:

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
psect	text469
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\llmod.c"
	line	5
	global	__size_of___llmod
	__size_of___llmod	equ	__end_of___llmod-___llmod
	
___llmod:	
	opt	stack 6
; Regs used in ___llmod: [wreg+status,2+status,0]
	line	8
	
l3382:	
	movf	(___llmod@divisor+3),w
	iorwf	(___llmod@divisor+2),w
	iorwf	(___llmod@divisor+1),w
	iorwf	(___llmod@divisor),w
	skipnz
	goto	u3411
	goto	u3410
u3411:
	goto	l3398
u3410:
	line	9
	
l3384:	
	clrf	(___llmod@counter)
	bsf	status,0
	rlf	(___llmod@counter),f
	line	10
	goto	l3388
	
l1047:	
	line	11
	
l3386:	
	movlw	01h
	movwf	(??___llmod+0)+0
u3425:
	clrc
	rlf	(___llmod@divisor),f
	rlf	(___llmod@divisor+1),f
	rlf	(___llmod@divisor+2),f
	rlf	(___llmod@divisor+3),f
	decfsz	(??___llmod+0)+0
	goto	u3425
	line	12
	movlw	(01h)
	movwf	(??___llmod+0)+0
	movf	(??___llmod+0)+0,w
	addwf	(___llmod@counter),f
	goto	l3388
	line	13
	
l1046:	
	line	10
	
l3388:	
	btfss	(___llmod@divisor+3),(31)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l3386
u3430:
	goto	l3390
	
l1048:	
	goto	l3390
	line	14
	
l1049:	
	line	15
	
l3390:	
	movf	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),w
	skipz
	goto	u3445
	movf	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),w
	skipz
	goto	u3445
	movf	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),w
	skipz
	goto	u3445
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),w
u3445:
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l3394
u3440:
	line	16
	
l3392:	
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
	goto	l3394
	
l1050:	
	line	17
	
l3394:	
	movlw	01h
u3455:
	clrc
	rrf	(___llmod@divisor+3),f
	rrf	(___llmod@divisor+2),f
	rrf	(___llmod@divisor+1),f
	rrf	(___llmod@divisor),f
	addlw	-1
	skipz
	goto	u3455

	line	18
	
l3396:	
	movlw	low(01h)
	subwf	(___llmod@counter),f
	btfss	status,2
	goto	u3461
	goto	u3460
u3461:
	goto	l3390
u3460:
	goto	l3398
	
l1051:	
	goto	l3398
	line	19
	
l1045:	
	line	20
	
l3398:	
	movf	(___llmod@dividend+3),w
	movwf	(?___llmod+3)
	movf	(___llmod@dividend+2),w
	movwf	(?___llmod+2)
	movf	(___llmod@dividend+1),w
	movwf	(?___llmod+1)
	movf	(___llmod@dividend),w
	movwf	(?___llmod)

	goto	l1052
	
l3400:	
	line	21
	
l1052:	
	return
	opt stack 0
GLOBAL	__end_of___llmod
	__end_of___llmod:
;; =============== function ___llmod ends ============

	signat	___llmod,8316
	global	___fttol
psect	text470,local,class=CODE,delta=2
global __ptext470
__ptext470:

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
psect	text470
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l3318:	
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
	goto	u3291
	goto	u3290
u3291:
	goto	l3324
u3290:
	line	50
	
l3320:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1002
	
l3322:	
	goto	l1002
	
l1001:	
	line	51
	
l3324:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u3305:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u3300:
	addlw	-1
	skipz
	goto	u3305
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l3326:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l3328:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l3330:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l3332:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3334:	
	btfss	(___fttol@exp1),7
	goto	u3311
	goto	u3310
u3311:
	goto	l3344
u3310:
	line	57
	
l3336:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u3321
	goto	u3320
u3321:
	goto	l3342
u3320:
	line	58
	
l3338:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1002
	
l3340:	
	goto	l1002
	
l1004:	
	goto	l3342
	line	59
	
l1005:	
	line	60
	
l3342:	
	movlw	01h
u3335:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u3335

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l3342
u3340:
	goto	l3354
	
l1006:	
	line	62
	goto	l3354
	
l1003:	
	line	63
	
l3344:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u3351
	goto	u3350
u3351:
	goto	l3352
u3350:
	line	64
	
l3346:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1002
	
l3348:	
	goto	l1002
	
l1008:	
	line	65
	goto	l3352
	
l1010:	
	line	66
	
l3350:	
	movlw	01h
	movwf	(??___fttol+0)+0
u3365:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u3365
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l3352
	line	68
	
l1009:	
	line	65
	
l3352:	
	movf	(___fttol@exp1),f
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l3350
u3370:
	goto	l3354
	
l1011:	
	goto	l3354
	line	69
	
l1007:	
	line	70
	
l3354:	
	movf	(___fttol@sign1),w
	skipz
	goto	u3380
	goto	l3358
u3380:
	line	71
	
l3356:	
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
	goto	l3358
	
l1012:	
	line	72
	
l3358:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l1002
	
l3360:	
	line	73
	
l1002:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text471,local,class=CODE,delta=2
global __ptext471
__ptext471:

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
psect	text471
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l3244:	
	movf	(___ftpack@exp),w
	skipz
	goto	u3100
	goto	l3248
u3100:
	
l3246:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l3254
u3110:
	goto	l3248
	
l1226:	
	line	65
	
l3248:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1227
	
l3250:	
	goto	l1227
	
l1224:	
	line	66
	goto	l3254
	
l1229:	
	line	67
	
l3252:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u3125:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3125

	goto	l3254
	line	69
	
l1228:	
	line	66
	
l3254:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l3252
u3130:
	goto	l1231
	
l1230:	
	line	70
	goto	l1231
	
l1232:	
	line	71
	
l3256:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l3258:	
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
	
l3260:	
	movlw	01h
u3145:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3145

	line	74
	
l1231:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3151
	goto	u3150
u3151:
	goto	l3256
u3150:
	goto	l3264
	
l1233:	
	line	75
	goto	l3264
	
l1235:	
	line	76
	
l3262:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u3165:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u3165
	goto	l3264
	line	78
	
l1234:	
	line	75
	
l3264:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u3171
	goto	u3170
u3171:
	goto	l3262
u3170:
	
l1236:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l1237
u3180:
	line	80
	
l3266:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1237:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l3268:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u3195:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u3190:
	addlw	-1
	skipz
	goto	u3195
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l3270:	
	movf	(___ftpack@sign),w
	skipz
	goto	u3200
	goto	l1238
u3200:
	line	84
	
l3272:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1238:	
	line	85
	line	86
	
l1227:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text472,local,class=CODE,delta=2
global __ptext472
__ptext472:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text472
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3152:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2801
	goto	u2800
u2801:
	goto	l3170
u2800:
	line	9
	
l3154:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l3160
	
l910:	
	line	11
	
l3156:	
	movlw	01h
	
u2815:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2815
	line	12
	
l3158:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l3160
	line	13
	
l909:	
	line	10
	
l3160:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2821
	goto	u2820
u2821:
	goto	l3156
u2820:
	goto	l3162
	
l911:	
	goto	l3162
	line	14
	
l912:	
	line	15
	
l3162:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2835
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2835:
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l3166
u2830:
	line	16
	
l3164:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l3166
	
l913:	
	line	17
	
l3166:	
	movlw	01h
	
u2845:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2845
	line	18
	
l3168:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2851
	goto	u2850
u2851:
	goto	l3162
u2850:
	goto	l3170
	
l914:	
	goto	l3170
	line	19
	
l908:	
	line	20
	
l3170:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l915
	
l3172:	
	line	21
	
l915:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text473,local,class=CODE,delta=2
global __ptext473
__ptext473:

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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text473
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3126:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3128:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2731
	goto	u2730
u2731:
	goto	l3148
u2730:
	line	11
	
l3130:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l3136
	
l900:	
	line	13
	
l3132:	
	movlw	01h
	
u2745:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2745
	line	14
	
l3134:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l3136
	line	15
	
l899:	
	line	12
	
l3136:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l3132
u2750:
	goto	l3138
	
l901:	
	goto	l3138
	line	16
	
l902:	
	line	17
	
l3138:	
	movlw	01h
	
u2765:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2765
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2775
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2775:
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l3144
u2770:
	line	19
	
l3140:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3142:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l3144
	line	21
	
l903:	
	line	22
	
l3144:	
	movlw	01h
	
u2785:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2785
	line	23
	
l3146:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l3138
u2790:
	goto	l3148
	
l904:	
	goto	l3148
	line	24
	
l898:	
	line	25
	
l3148:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l905
	
l3150:	
	line	26
	
l905:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text474,local,class=CODE,delta=2
global __ptext474
__ptext474:

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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text474
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l3114:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l3116
	line	6
	
l892:	
	line	7
	
l3116:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l893
u2690:
	line	8
	
l3118:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l893:	
	line	9
	movlw	01h
	
u2705:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2705
	line	10
	
l3120:	
	movlw	01h
	
u2715:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2715
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l3116
u2720:
	goto	l3122
	
l894:	
	line	12
	
l3122:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l895
	
l3124:	
	line	13
	
l895:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text475,local,class=CODE,delta=2
global __ptext475
__ptext475:

;; *************** function _isdigit *****************
;; Defined at:
;;		line 13 in file "../../common/isdigit.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text475
	file	"C:\Program Files\HI-TECH Software\PICC\9.81\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 6
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	movwf	(isdigit@c)
	line	14
	
l3102:	
	clrf	(_isdigit$1367)
	
l3104:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u2671
	goto	u2670
u2671:
	goto	l3110
u2670:
	
l3106:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l3110
u2680:
	
l3108:	
	clrf	(_isdigit$1367)
	bsf	status,0
	rlf	(_isdigit$1367),f
	goto	l3110
	
l882:	
	
l3110:	
	rrf	(_isdigit$1367),w
	
	goto	l883
	
l3112:	
	line	15
	
l883:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_delay
psect	text476,local,class=CODE,delta=2
global __ptext476
__ptext476:

;; *************** function _delay *****************
;; Defined at:
;;		line 467 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text476
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	467
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+status,0]
	line	469
	
l3062:	
;MPLAB3.c: 469: for(;i>0;i--);
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l3066
u2600:
	goto	l800
	
l3064:	
	goto	l800
	
l798:	
	
l3066:	
	movlw	low(01h)
	subwf	(delay@i),f
	movlw	high(01h)
	skipc
	decf	(delay@i+1),f
	subwf	(delay@i+1),f
	
l3068:	
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2611
	goto	u2610
u2611:
	goto	l3066
u2610:
	goto	l800
	
l799:	
	line	471
	
l800:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_temp
psect	text477,local,class=CODE,delta=2
global __ptext477
__ptext477:

;; *************** function _read_temp *****************
;; Defined at:
;;		line 455 in file "C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
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
psect	text477
	file	"C:\Users\Navid\Desktop\FYP\7- UART VISUAL BASIC\MPLAB3.c"
	line	455
	global	__size_of_read_temp
	__size_of_read_temp	equ	__end_of_read_temp-_read_temp
	
_read_temp:	
	opt	stack 7
; Regs used in _read_temp: [wreg+status,2+status,0]
	line	458
	
l3058:	
;MPLAB3.c: 457: unsigned short temp;
;MPLAB3.c: 458: temp=result;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result+1),w
	clrf	(read_temp@temp+1)
	addwf	(read_temp@temp+1)
	movf	(_result),w
	clrf	(read_temp@temp)
	addwf	(read_temp@temp)

	line	459
;MPLAB3.c: 459: return temp;
	movf	(read_temp@temp+1),w
	clrf	(?_read_temp+1)
	addwf	(?_read_temp+1)
	movf	(read_temp@temp),w
	clrf	(?_read_temp)
	addwf	(?_read_temp)

	goto	l795
	
l3060:	
	line	461
	
l795:	
	return
	opt stack 0
GLOBAL	__end_of_read_temp
	__end_of_read_temp:
;; =============== function _read_temp ends ============

	signat	_read_temp,90
psect	text478,local,class=CODE,delta=2
global __ptext478
__ptext478:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
