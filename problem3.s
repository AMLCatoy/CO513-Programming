.global _start
_start:
	mov r0, #33 //32-bit input integer
	mov r2, #0 //resets the result
	AND r2, r0, #1 //stores the results
	
	cmp r2, #1 //checks if the output of AND is 1
	beq count_up //if AND output is 1, count up
	
	cmp r0, #0 //checks if the shifting value reaches 0
	b loop
	beq end	// ends the program if the input reaches 0
	
loop:	
	LSR r0, #1 //shifts the input to the right
	mov r2, #0 //resets the result
	AND r2, r0, #1 //stores the results
	cmp r2, #1 //checks if the output of AND is 1
	beq count_up //if AND output is 1, count up
	
	cmp r0, #0 //checks if the shifting value reaches 0
	bne loop //help
	beq odd_even	// ends the program if the input reaches 0
	
	
count_up:
	ADD r3, #1 //counter
	b loop //branches to loop
	
odd_even:
	AND r4, r3, #1 //AND output is 1 when ODD
	cmp r4, #1
	beq cond1 //condition for ODD
	b cond2 //condition for EVEN
	
cond1:
	mov r1, #0 //r1=0 when ODD as per the ass. instructions
	b end
	
cond2:
	mov r1, #1 //r1=1 when EVEN as per the ass. instructions
	b end 
	
end:
	
	