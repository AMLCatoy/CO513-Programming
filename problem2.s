.global _start
_start:
		mov r0, #120
		mov r1, #66
		
		mov r5, r0
		mov r6, r1 //backup of b
		
		cmp r1, #0
		beq end
		
		cmp r0, r1
		ble end
		
loop:
	//udiv
	ADD r2, #1 //counter or quotient
	MUL r3, r1, r2 //product of b and counter
	
	SUB r4, r0, r3
	cmp r1, r4 //compare b and current remainder
	beq final //finalize result
	bgt euclidean //move 1 step backward then euclidean algo
	
	cmp r3, r0
	beq next //case of 0 remainder
	blt loop
	bgt sub_counter	//optional	
	

final:
	mov r0, r4
	b end

next:
	SUB r4, r0, r3
	mov r0, r4
	b end
	
sub_counter:
	SUB r2, #1
	MUL r3, r2, r1
	SUB r4, r0, r3
	mov r0, r4
	b end
	
	
euclidean:
	mov r0, r6 //replace a with b
	mov r1, r4
	mov r2, #0 //resets the counter
	mov r5, r0 //updated a
	mov r6, r1 //updated b
	b loop
	
end:
	