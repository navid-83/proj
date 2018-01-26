// vim: sw=8 ts=8 si et: 
/****************************************************************************
* Title   :   compatibility module for forward compatibility with
              newer ARV C compiler which does not have older
              macros
* Authors:    Guido Socher
* Copyright: GPL
*
*        
*****************************************************************************/
#ifndef AVR_COMPAT_H
#define AVR_COMPAT_H

#define SETBIT(ADDRESS,BIT) (ADDRESS |= (1<<BIT)) 
#define CLEARBIT(ADDRESS,BIT) (ADDRESS &= ~(1<<BIT)) 
#define CHECKBIT(ADDRESS,BIT) (ADDRESS & (1<<BIT)) 

//-----------------------------------SPI-----------------------------------//
#define ENC28J60_CONTROL_PORT   PORTB
#define ENC28J60_CONTROL_DDR    DDRB
#define ENC28J60_CONTROL_CS     PB4
#define ENC28J60_CONTROL_SO		PB6
#define ENC28J60_CONTROL_SI		PB5
#define ENC28J60_CONTROL_SCK	PB7

//use following macros if SS (PB4) pin is used for Chip Select of ENC
#define ENC_CS_ACTIVE		CLEARBIT(ENC28J60_CONTROL_PORT,ENC28J60_CONTROL_CS) // set CS to 0 = active
#define ENC_CS_PASSIVE		SETBIT(ENC28J60_CONTROL_PORT,ENC28J60_CONTROL_CS)   // set CS to 1 = passive

#define waitspi() while(!(SPSR&(1<<SPIF)))
//-----------------------------------SPI-----------------------------------//

// uncomment the following line if you have avr-1.2.x or less:
//#define ALIBC_OLD 1

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif

#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

#ifndef inb
#define inb(sfr) _SFR_BYTE(sfr) 
#endif

#ifndef outb
#define outb(sfr, val) (_SFR_BYTE(sfr) = (val))
#endif

#ifndef inw
#define inw(sfr) _SFR_WORD(sfr)
#endif

#ifndef outw
#define outw(sfr, val) ( _SFR_WORD(sfr) = (val)) 
#endif

#ifndef outp
#define outp(val, sfr) outb(sfr, val) 
#endif

#ifndef inp
#define inp(sfr) inb(sfr) 
#endif

#ifndef BV
#define BV(bit) _BV(bit)
#endif

/* compatibility macro for libc 1.0 to 1.2 */
#ifndef PRG_RDB
#define PRG_RDB(addr)       pgm_read_byte(addr)
#endif

#endif //AVR_COMPAT_H

