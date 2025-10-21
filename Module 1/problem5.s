.global _start
_start:
	LDR r0, =my_array //load the address of the array
	LDR r2, [r0] //load the data stored in the address in r0
	LDR r3, =array_size //load the address of the number of elements
	LDR r1, [r3] //load the data from r3, which is the number of elements
	
	mov r4, #0 //initialize counter
	LDR r3, [r0] //copy of the data in r2
	
loop:	 
	cmp r3, r2 //compare the data with the next data 
	movgt r2, r3 //store to r2 the greater value
	
	LDR r3, [r0, #4]! //load elements with post-increment

	
	ADD r4, #1 //counter
	cmp r4, r1 //compare the counter with the total number of elements
	bge end 
	b loop //branch to loop while the counter is less than the number of elements
	
	
end:	
	
	
	
.data
my_array: .word 4, 5, -9, 1, 0, -2, 3
array_size: .word 7