.global _start
.equ PUSH_BASE, 0xFF200050
.equ SW_BASE, 0xFF200040
.equ SEG_BASE, 0xFF200020

_start:

	LDR r4, =PUSH_BASE 	//push button base address 
	LDR r5, =SW_BASE		//switch base address
	LDR r6, =SEG_BASE		//7-seg display base address (HEX3-HEX0)
	LDR r7, =SEG_PATTERNS	//7-seg display pattern address (0-9)
	

	LDR r0, [r4]	//read push button
	BL debouncing
	MOV r1, r0
	
	MOV r12, #0
	LDR r9, [r7]
	LDR r10, [r7]
	LSL r10, r10, #8
	ORR r11, r10, r9
	STR r11, [r6]
	BL one_second
	
	LDR r2, [r5]	//read sw0
	CMP r2, #0
	BNE count_down
	BEQ count_up


MAIN_LOOP:
	//run or pause?
	LDR r0, [r4]	//read push button
	BL debouncing
	
	//pause
	CMP r0, #1
	BEQ pause
	CMP r0, #3
	BEQ pause
	
	//reset
	CMP r0, #1
	BGT reset
	
	//timer
	BL one_second
	
	//run
	//sw0_updown
	LDR r2, [r5]	//read sw0
	CMP r2, #0
	BNE count_down
	BEQ count_up
	
	
count_up: 
	CMP r9, #0x6F
	BEQ gt_9
	ADD r12, #1
	LDR r8, [r7, r12, LSL #2]	//load 7-seg pattern for HEX0
	MOV r9, r8
	ORR r11, r10, r9
	STR r11, [r6]
	B MAIN_LOOP

gt_9:
	LDR r9, [r7] //HEX0=0
	LSR r10, r10, #8
	SUB r12, #10 
	ADD r12, #1
	CMP r10, #0x3F
	BEQ HEX1_1
	CMP r10, #0x06
	BEQ HEX1_2
	CMP r10, #0x5B
	BEQ HEX1_3
	CMP r10, #0x4F
	BEQ HEX1_4
	CMP r10, #0x66
	BEQ HEX1_5
	CMP r10, #0x6D
	BEQ HEX1_0
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP


count_down:
	CMP r9, #0x3F
	BEQ HEX0_lt_0
	LSR r10, r10, #8
	MOV r12, #0
	CMP r9, #0x3F
	BEQ HEX0_9
	CMP r9, #0x06
	BEQ HEX0_0
	CMP r9, #0x5B
	BEQ HEX0_1
	CMP r9, #0x4F
	BEQ HEX0_2
	CMP r9, #0x66
	BEQ HEX0_3
	CMP r9, #0x6D
	BEQ HEX0_4
	CMP r9, #0x7D
	BEQ HEX0_5
	CMP r9, #0x07
	BEQ HEX0_6
	CMP r9, #0x7F
	BEQ HEX0_7
	CMP r9, #0x6F
	BEQ HEX0_8

	MOV r9, r8
	ORR r11, r10, r9
	STR r11, [r6]
	B MAIN_LOOP

HEX0_lt_0:
	LDR r8, [r7,#36]
	MOV r9, r8
	LSR r10, r10, #8
	CMP r10, #0x3F
	BEQ HEX1_59
	MOV r12, #0
	CMP r10, #0x3F
	BEQ HEX1_5
	CMP r10, #0x06
	BEQ HEX1_0
	CMP r10, #0x5B
	BEQ HEX1_1
	CMP r10, #0x4F
	BEQ HEX1_2
	CMP r10, #0x66
	BEQ HEX1_3
	CMP r10, #0x6D
	BEQ HEX1_4
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9
	STR r11, [r6]
	B MAIN_LOOP


HEX1_59:
	LDR r9, [r7, #36] //HEX0=9
	LDR r10, [r7, #20] //HEX1=5
	LSL r10, r10, #8
	ORR r11, r10, r9
	STR r11, [r6]
	MOV r12, #0
	B MAIN_LOOP


reset:
	LDR r9, [r7] //HEX0=0
	LDR r10, [r7] //HEX1=0
	LSL r10, r10, #8
	ORR r11, r10, r9
	STR r11, [r6]
	MOV r12, #0
	B MAIN_LOOP

debouncing:
        LDR     r3, =50000              
1:      SUBS    r3, r3, #1
        BNE     1b
        BX      lr

one_second:
        LDR     r3, =10000000              
1:      SUBS    r3, r3, #1
        BNE     1b
        BX      lr

pause:
		LDR r3, =3
2:      SUBS r3, r3, #1
        BNE  2b
		LDR r0, [r4]	//read push button
		BL 	debouncing
		CMP r1, r0
		BNE pause
		MOV r1, r0
        B MAIN_LOOP
		
HEX1_1:
	LDR r8, [r7,#4]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX1_2:
	LDR r8, [r7,#8]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX1_3:
	LDR r8, [r7,#12]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX1_4:
	LDR r8, [r7,#16]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX1_5:
	LDR r8, [r7,#20]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX1_0:
	LDR r8, [r7]
	MOV r10, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_0:
	LDR r8, [r7]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_1:
	LDR r8, [r7,#4]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_2:
	LDR r8, [r7,#8]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_3:
	LDR r8, [r7,#12]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_4:
	LDR r8, [r7,#16]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_5:
	LDR r8, [r7,#20]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_6:
	LDR r8, [r7,#24]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_7:
	LDR r8, [r7,#28]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_8:
	LDR r8, [r7,#32]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP

HEX0_9:
	LDR r8, [r7,#36]
	MOV r9, r8
	LSL r10, r10, #8
	ORR r11, r10, r9 
	STR r11, [r6]
	B MAIN_LOOP
		
.align 2
SEG_PATTERNS:
    .word 0x3F  // 0: abcdef
    .word 0x06  // 1: bc
    .word 0x5B  // 2: abdeg
    .word 0x4F  // 3: abcdg
    .word 0x66  // 4: bcfg
    .word 0x6D  // 5: acdfg
    .word 0x7D  // 6: acdefg
    .word 0x07  // 7: abc
    .word 0x7F  // 8: abcdefg
    .word 0x6F  // 9: abcdfg	
