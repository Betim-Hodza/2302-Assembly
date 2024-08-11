/*
	Betim Hodza 

	This program is pretty straightforward just writing more functions
	first one is just counting the number of occurances of the character
	that has been inputed here

	second one is converting our sumDigits function and port it over
	here
*/	
	.global countChar
/*int32_t countChar(char* s, char c)
	In:
	R0 = char* s (our array)
	R1 = char c 

	out:
	R0 = sum (r3 in our case)
*/
countChar:
	mov r3, #0 @initializes our counter 
	bal bottom1
loop1:
	ldrb r4, [r0], #1 @loads our array in
	cmp r4, r1 @ if r4 == r1 or if char in array == char passed in
	beq counter

	@ if it doesnt equal go back to condition
	bal bottom1
counter:
	add r3, r3, #1 @ counter ++

bottom1:
	cmp r3, #0 @sets our null loop again
	bne loop1
	
	bx lr


	.global sumDigits
/*
	int32+t sumDigits(char* s);
	
	sums the digits chars in a string
	returns 32 bit signed int that is the sum
	inital
	R0 = char s[]
	finish
	R0 = sum
*/
sumDigits:
	mov r2, #0 @sets sum to 0
	ldrb r3, [r0] @grabs array
	bal bottom2
loop2:
	ldrb r3, [r0], #1 @grabs array val and moves ptr by 1
	cmp r3, #48 @r3 >= '0'?
	ble bottom2
check1:
	cmp r3, #58 @r3 <= '9'?
	bge bottom2 
check2:
	sub r3, r3, #48 @subtract the ascii val by '0' to get an numerical value
	add r2, r4 @ adds our new number
bottom2:
	cmp r3, #0 @breaks if we hit null
	bne loop2

	mov r0, r2
	bx lr
