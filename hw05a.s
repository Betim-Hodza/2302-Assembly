/*
	Betim Hodza hw05a.s

	Finding the maximum element sum wen adding two different array elments
	with the same length

	allowed to hardcode:
		labels of the array
		label of the len
		the data types of the arrays
		one is byte and one is halfword

	R0 should contain sum of largest combination of element

	C code
	char byte[5] = {#####}
	short hwrd[5] = {#####}
	int sum = 0; 
	int tempSum = 0;
	int i = 0
	
	for ( i = 0; i<5< i++)
	{
		temp sum = byte[i] + hword[i]
		if(tempSum > sum)
			sum = tempsum;
	}

*/

    .global _start

_start:
	mov r0, #0 @starts sum at 0
    	ldr r1, len @ grabs the len of arrays
	ldr r2, =small @ 1st array load
	ldr r3, =half @2nd array
	bal bottom

loop:
	ldrsb r5, [r2], #1 @loads in values from each array 
	ldrsh r6, [r3], #2 @also put sign extension in for correct 2's comp
	sub r1, #1 @ i --
	add r7, r6, r5 @stores a temp value within r7

	cmp r0, #0 @ checks if r0's value is 0
	beq sum @ want to always set the first sum to the first addition

	cmp r0, r7
	bge bottom @ goes to the bottom of loop if r0 > r7 

sum:
	mov r0, r7 @ 
	

bottom:
	cmp r1, #0 @ if i > 0 go into loop
	bgt loop

end:
    mov r7, #1
    swi 0

len:             @ literal, not a variable
    .word 5      @ use with something like
                 @   ldr r1, len

    .data

small:
    .byte  -3, 18,  5, -21, -7
half:
    .hword -9, -6, 14,  33, 30
