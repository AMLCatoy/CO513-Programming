.global _start
_start:
	mov r0, #12 //n, non-negative integer; the input for factorial
	mov r2, #1 //counter; increments by 1
	mov r1, #1 //computed value of n!; the output of factorial
	
loop:
	cmp r2,r0 //compares the counter and the input
	bge end //proceed to end if the result of comparison is greater than or equal
	
	ADD r2, #1 //functions as counter
	MUL r1,r1, r2 //factorial computation
	b loop //branch to loop
	
end: 
	