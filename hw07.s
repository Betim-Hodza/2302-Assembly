/* Betim Hodza 

counts num of X chars in last streak, and will assume that the string will end in 1 or more x chars
returns 32-bit signed int representing count

initial: 
	R0, =string
final:
	R0, count 
*/
	 .global countLastStreak
countLastStreak:
	mov r2, #0 @ count
	ldrsb r1, [r0] @ ptr to string
	b bottom1
loop1:
	cmp r1, #'X' @if r1 = Char X
	ldrsb r1, [r0], #1 @ moves ptr after compare
	bne restCount

XStreak:
	add r2, r2, #1
	b bottom1
restCount:
	mov r2, #0

bottom1:
	cmp r1, #0
	bne loop1

	mov r0, r2 @ r0 = sum
	bx lr @ go back

/*
initial:
	R0 = char[] input
	R1 = char[] output
final:
	dont return anything just copy r0 to r1 and add 5 spaces initially
*/
	.global shiftRightBy5
shiftRightBy5:
	ldrb r2, [r0] @ input ptr
	ldrb r3, [r1] @ output ptr

	/*initialize 5 spaces in output*/
	mov r3, #32
	strb r3, [r1]!  @stores space into r1 and posts increment later
	strb r3, [r1, #1]!
	strb r3, [r1, #1]!
	strb r3, [r1, #1]!
	strb r3, [r1, #1]!
	/*end of initialization*/

loop2:
	ldrb r2, [r0], #1
	strb r2, [r1], #1

bottom2:
	cmp r2, #0 @ checks for null
	bne loop2

	bx lr
