/*
	Betim Hodza hw05b.s

	purpose writing subroutines / functions

	sub1: Take sum of numbes in a string
	sub2: take that int sum and conver each number into a string
		i.e. 14 = "14\n" (add the newline too)
	sub3: then print that ouput and tack on the newline from the out data label

	Things we know / is hard coded
		the strings which are null terminated 0
		each num is nonneg int represented '0' - '9'
		we can hardcode ascii value of digits in fact we should
		we should expect the largest sum to be 2 digits long
		if a sum is < 10 then tack on a 0 infront of the digit i.e. 06
		
	to convert sum to string we use repeated subtraction or (basically division)

	use BL (to branch to func) and BX(to go back)

	c code

	s1
	s2
	s3


	sub1(char s[])
	sum = 0
	int i = 0
		while(s[i] != 0)
			if ('0' <= s[i])
				if (s[i] <= 9)
					sum += char*
					
		i++
	return sum


	sub2(int sum, char out[])
		int iterations

		if(sum < 0)
			out[0] = (char)iterations
			out[1] = (char)sum
			return out
		while(sum > 0)
			sum -= 10
			iterations++
		
		out[0] = (char)iterations
		out[1] = (char)sum
	return out
	
	sub3(out[])
	
	printf("%s", out)
	
	
		
		



*/

    .global _start

_start:
	ldr r1, =s1 @gets out array s1

	bl sub1 
	bl sub2
	bl sub3

	ldr r1, =s2
	mov r0, #0
	mov r5, #0

	bl sub1 
	bl sub2
	bl sub3
	
	ldr r1, =s3
	mov r0, #0
	mov r5, #0

	bl sub1 
	bl sub2
	bl sub3

end:
    mov r7, #1
    swi 0


sub1: @ conv string into individual #'s and then add its sum
	mov r2, #0 @sets the sum to 0
	ldrb r4, [r1]  @grabs array 
	bal bottom1
loop1:
	ldrb r4, [r1], #1 @grabs aray val and move by 1
	cmp r4, #48 @r4 >= '0'?
	ble bottom1
check1:
	cmp r4, #58 @r4 <= '9'?
	bge bottom1
check2:
	sub r4, r4, #48 @subtract the ascii val by '0' to get our true .word 0
	add r2, r4 @adds our new number


bottom1:
	cmp r4, #0 @break into loop if array val is != to 0 or null
	bne loop1

	bx lr @ go back
@sub1 func works


sub2:@ conv the sum into a string total "14"
	mov r3, #0 @num of iterations
	ldr r5, =out @loads in the out string
	cmp r2, #10
	blt sumlt10
	bgt bottom2
sumlt10:
	@adds ascii values to print
	add r3, r3, #48
	add r2, r2, #48

	@stores them
	strb r3, [r5], #1  @store the value of r3 into r5's string and move by 1	
	strb r2, [r5] @ stores r2 into r5's string
	bx lr
loop2:
	subs r2, r2, #10 @ sum -= 10
	add r3, r3, #1 @ iterations++

bottom2:
	cmp r2, #9 @enter loop if > 9
	bgt loop2

	@ turn values back into ascii
	add r3, r3, #48 @adds ascii 0
	add r2, r2, #48

	@stores the values into the out string
	strb r3, [r5], #1
	strb r2, [r5]

	bx lr

@sub2 func works
sub3: @ print the output string 
	
	ldr r1, =out
	mov r7, #4 @write
	mov r0, #1 @stdout
	mov r2, #3 @3 bytes long
	swi 0

	bx lr

    .data
s1:
    .asciz "1, 2, 3, 4, 5"

s2:
    .asciz "9, 0, 0,  6,0, 8,  7"

s3:
    .asciz "2, 4"


out:     @ should replace A and Z with digits to print
    .asciz "AZ\n"

