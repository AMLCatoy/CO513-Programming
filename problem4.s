.global _start
_start:
	mov r0, #0xA5  //take a byte input (1010 0101)
	AND r2, r0, #0xF0 //AND the input with 1111 0000
	LSR r3, r2, #4  //1 step shift right the result 
	
	AND r2, r0, #0x0F //AND the input with 0000 1111 
	LSL r4, r2, #4 //1 step left right the result
	
	ORR r1, r3, r4 //OR both the shifted results
	
end:

	