# less2asm
This script converting `.lss` output file from `avr-objdump` to `.asm`  
You can get `.lss` file by executing `avr-objdump firmware.elf -S > firmware.lss` or in settings `Project > Properties... > AVR/GNU Common > Output Files > .lss (Generate lss file)`  
  
> [!CAUTION]
> only `.html` script supported

## Example
```
lab_1.elf:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         000000da  00000000  00000000  00000054  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00800060  00800060  0000012e  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .comment      00000030  00000000  00000000  0000012e  2**0
                  CONTENTS, READONLY
  3 .note.gnu.avr.deviceinfo 0000003c  00000000  00000000  00000160  2**2
                  CONTENTS, READONLY
  4 .debug_aranges 00000020  00000000  00000000  0000019c  2**0
                  CONTENTS, READONLY, DEBUGGING
  5 .debug_info   000006ab  00000000  00000000  000001bc  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_abbrev 000005cf  00000000  00000000  00000867  2**0
                  CONTENTS, READONLY, DEBUGGING
  7 .debug_line   0000027f  00000000  00000000  00000e36  2**0
                  CONTENTS, READONLY, DEBUGGING
  8 .debug_frame  00000024  00000000  00000000  000010b8  2**2
                  CONTENTS, READONLY, DEBUGGING
  9 .debug_str    0000030a  00000000  00000000  000010dc  2**0
                  CONTENTS, READONLY, DEBUGGING
 10 .debug_loc    00000090  00000000  00000000  000013e6  2**0
                  CONTENTS, READONLY, DEBUGGING
 11 .debug_ranges 00000010  00000000  00000000  00001476  2**0
                  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 2a 00 	jmp	0x54	; 0x54 <__ctors_end>
   4:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
   8:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
   c:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  10:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  14:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  18:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  1c:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  20:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  24:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  28:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  2c:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  30:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  34:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  38:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  3c:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  40:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  44:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  48:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  4c:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>
  50:	0c 94 34 00 	jmp	0x68	; 0x68 <__bad_interrupt>

00000054 <__ctors_end>:
  54:	11 24       	eor	r1, r1
  56:	1f be       	out	0x3f, r1	; 63
  58:	cf e5       	ldi	r28, 0x5F	; 95
  5a:	d4 e0       	ldi	r29, 0x04	; 4
  5c:	de bf       	out	0x3e, r29	; 62
  5e:	cd bf       	out	0x3d, r28	; 61
  60:	0e 94 36 00 	call	0x6c	; 0x6c <main>
  64:	0c 94 6b 00 	jmp	0xd6	; 0xd6 <_exit>

00000068 <__bad_interrupt>:
  68:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

0000006c <main>:
#include <avr/io.h>
#include <util/delay.h>


int main(void){
	DDRD = 0xFF;		// все пины на вывод
  6c:	8f ef       	ldi	r24, 0xFF	; 255
  6e:	81 bb       	out	0x11, r24	; 17
	PORTD = 0x01;		// зажигаем последний светодиод
  70:	91 e0       	ldi	r25, 0x01	; 1
  72:	92 bb       	out	0x12, r25	; 18
	DDRB = 0x00;		// все пины на ввод
  74:	17 ba       	out	0x17, r1	; 23
	PORTB = 0xFF;		// подтягивающие резисторы
  76:	88 bb       	out	0x18, r24	; 24
	
    while(1){
		
		// первая кнопка сдвиг влево
		// производим инвертацию регистра т.к. по умолчанию кнопка подтянута к + (что дает 1 на пине), нажатая кнопка дает 0
		if(~PINB & 0x01){
  78:	b0 99       	sbic	0x16, 0	; 22
  7a:	0f c0       	rjmp	.+30     	; 0x9a <main+0x2e>
			if(PORTD != 0x01){
  7c:	82 b3       	in	r24, 0x12	; 18
  7e:	81 30       	cpi	r24, 0x01	; 1
  80:	19 f0       	breq	.+6      	; 0x88 <main+0x1c>
				PORTD >>= 1;
  82:	82 b3       	in	r24, 0x12	; 18
  84:	86 95       	lsr	r24
  86:	82 bb       	out	0x12, r24	; 18
	#else
		//round up by default
		__ticks_dc = (uint32_t)(ceil(fabs(__tmp)));
	#endif

	__builtin_avr_delay_cycles(__ticks_dc);
  88:	2f e9       	ldi	r18, 0x9F	; 159
  8a:	36 e8       	ldi	r19, 0x86	; 134
  8c:	81 e0       	ldi	r24, 0x01	; 1
  8e:	21 50       	subi	r18, 0x01	; 1
  90:	30 40       	sbci	r19, 0x00	; 0
  92:	80 40       	sbci	r24, 0x00	; 0
  94:	e1 f7       	brne	.-8      	; 0x8e <main+0x22>
  96:	00 c0       	rjmp	.+0      	; 0x98 <main+0x2c>
  98:	00 00       	nop
			
			_delay_ms(500);
		}
		
		// вторая кнопка сдвиг вправо
		if(~PINB & 0x02){
  9a:	b1 99       	sbic	0x16, 1	; 22
  9c:	0f c0       	rjmp	.+30     	; 0xbc <main+0x50>
			if(PORTD != 0x80){
  9e:	82 b3       	in	r24, 0x12	; 18
  a0:	80 38       	cpi	r24, 0x80	; 128
  a2:	19 f0       	breq	.+6      	; 0xaa <main+0x3e>
				PORTD <<= 1;
  a4:	82 b3       	in	r24, 0x12	; 18
  a6:	88 0f       	add	r24, r24
  a8:	82 bb       	out	0x12, r24	; 18
  aa:	2f e9       	ldi	r18, 0x9F	; 159
  ac:	36 e8       	ldi	r19, 0x86	; 134
  ae:	81 e0       	ldi	r24, 0x01	; 1
  b0:	21 50       	subi	r18, 0x01	; 1
  b2:	30 40       	sbci	r19, 0x00	; 0
  b4:	80 40       	sbci	r24, 0x00	; 0
  b6:	e1 f7       	brne	.-8      	; 0xb0 <main+0x44>
  b8:	00 c0       	rjmp	.+0      	; 0xba <main+0x4e>
  ba:	00 00       	nop
			
			_delay_ms(500);
		}
		
		// третья кнопка сброс
		if(~PINB & 0x04){
  bc:	b2 99       	sbic	0x16, 2	; 22
  be:	dc cf       	rjmp	.-72     	; 0x78 <main+0xc>
			PORTD = 0x01;		// зажигаем последний светодиод
  c0:	92 bb       	out	0x12, r25	; 18
  c2:	2f e9       	ldi	r18, 0x9F	; 159
  c4:	36 e8       	ldi	r19, 0x86	; 134
  c6:	81 e0       	ldi	r24, 0x01	; 1
  c8:	21 50       	subi	r18, 0x01	; 1
  ca:	30 40       	sbci	r19, 0x00	; 0
  cc:	80 40       	sbci	r24, 0x00	; 0
  ce:	e1 f7       	brne	.-8      	; 0xc8 <main+0x5c>
  d0:	00 c0       	rjmp	.+0      	; 0xd2 <main+0x66>
  d2:	00 00       	nop
  d4:	d1 cf       	rjmp	.-94     	; 0x78 <main+0xc>

000000d6 <_exit>:
  d6:	f8 94       	cli

000000d8 <__stop_program>:
  d8:	ff cf       	rjmp	.-2      	; 0xd8 <__stop_program>
```
  
  
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  
  
  
```
	jmp	0x54	; 0x54 <__ctors_end>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	jmp	0x68	; 0x68 <__bad_interrupt>
	eor	r1, r1
	out	0x3f, r1	; 63
	ldi	r28, 0x5F	; 95
	ldi	r29, 0x04	; 4
	out	0x3e, r29	; 62
	out	0x3d, r28	; 61
	call	0x6c	; 0x6c <main>
	jmp	0xd6	; 0xd6 <_exit>
	jmp	0	; 0x0 <__vectors>
	ldi	r24, 0xFF	; 255
	out	0x11, r24	; 17
	ldi	r25, 0x01	; 1
	out	0x12, r25	; 18
	out	0x17, r1	; 23
	out	0x18, r24	; 24
	sbic	0x16, 0	; 22

LABEL_37:
	rjmp	LABEL_37     	; 0x9a <main+0x2e>
	in	r24, 0x12	; 18
	cpi	r24, 0x01	; 1
	breq	LABEL_46      	; 0x88 <main+0x1c>
	in	r24, 0x12	; 18

LABEL_42:
	lsr	r24
	out	0x12, r24	; 18
	ldi	r18, 0x9F	; 159
	ldi	r19, 0x86	; 134

LABEL_46:
	ldi	r24, 0x01	; 1
	subi	r18, 0x01	; 1
	sbci	r19, 0x00	; 0
	sbci	r24, 0x00	; 0
	brne	LABEL_42      	; 0x8e <main+0x22>

LABEL_51:
	rjmp	LABEL_51      	; 0x98 <main+0x2c>
	nop	
	sbic	0x16, 1	; 22

LABEL_54:
	rjmp	LABEL_54     	; 0xbc <main+0x50>
	in	r24, 0x12	; 18
	cpi	r24, 0x80	; 128
	breq	LABEL_63      	; 0xaa <main+0x3e>
	in	r24, 0x12	; 18

LABEL_59:
	add	r24, r24
	out	0x12, r24	; 18
	ldi	r18, 0x9F	; 159
	ldi	r19, 0x86	; 134

LABEL_63:
	ldi	r24, 0x01	; 1
	subi	r18, 0x01	; 1
	sbci	r19, 0x00	; 0
	sbci	r24, 0x00	; 0
	brne	LABEL_59      	; 0xb0 <main+0x44>

LABEL_68:
	rjmp	LABEL_68      	; 0xba <main+0x4e>

LABEL_69:
	nop	
	sbic	0x16, 2	; 22

LABEL_71:
	rjmp	LABEL_69     	; 0x78 <main+0xc>
	out	0x12, r25	; 18
	ldi	r18, 0x9F	; 159
	ldi	r19, 0x86	; 134
	ldi	r24, 0x01	; 1
	subi	r18, 0x01	; 1
	sbci	r19, 0x00	; 0

LABEL_78:
	sbci	r24, 0x00	; 0
	brne	LABEL_71      	; 0xc8 <main+0x5c>

LABEL_80:
	rjmp	LABEL_80      	; 0xd2 <main+0x66>
	nop	

LABEL_82:
	rjmp	LABEL_78     	; 0x78 <main+0xc>
	cli	
	rjmp	LABEL_82      	; 0xd8 <__stop_program>
```
