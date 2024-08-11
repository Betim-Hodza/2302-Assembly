/*

	Betim Hodza 100192802

*/

/* given an array of integers and the length of the array,
// shifts the array values to the left by two and then
// adds the values extra1 and extra2 to the right end
// assume that the input array will always have at least 2 values

r0 = int array
r1 = int array length
r2 = extra int 1
r3 = extra int 2

*/
	.global shiftLeftBy2
shiftLeftBy2:
	push {r4}
	push {r6}
	push {r7}
	mov r6, #0 @i
	mov r7, r1
	sub r7, r7, #2 @ len -2
	b end1
loop1:
	add r6, r6, #1 @i++
	ldr r4, [r0, #8] @ load the pointer 2 ints ahead preincrement
	str r4, [r0]! @store that num in array 1st pos
	ldr r4, [r0], #4 @post increment by 1 int
end1:
	cmp r7, r6 @if i != len -2
	bne loop1

	str r2, [r0]! @str xtra 1
	str r3, [r0, #4]! @str xtra 2 1 int ahead

	pop {r7}
	pop {r6}
	pop {r4}

	bx lr


/*int32_t countMatch(char left[], char right[]);
// given two null-terminated strings of equal length
// returns the count of how many consecutive characters (starting
// from the left) are the same
// assume the count will fit into a 32-bit signed integer
	r0 = char array left
	r1 = char array right

*/

	.global countMatch
countMatch:
	push {r4} @push to use
	mov r2, #0 @ count=0
	
loop2:
	ldrb r3, [r0], #1 @moves over by 1
	ldrb r4, [r1], #1

	cmp r3, #0 @if null go to end
	beq end2

	cmp r3, r4 @ if r3 != r4 go to end
	bne end2

	add r2, r2, #1 @count++
	b loop2
end2:
	mov r0, r2 @ moves count back to r0
	pop {r4}
	bx lr


