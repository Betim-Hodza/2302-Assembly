/*
	float floatAvg(float *hw, int n)
	Given: array of floats and length of the array
	initial: r0 =arrayOfFloats, r1 = length 
	final: s0 = average (arithmetic mean of the elements)

	r0 and r1 are used

	C - psuedo
	for(int i = 0; i < n; i++)
	{
		sum = sum + fArry[i];
	}
	avg = sum / n;

	return avg;
*/

	.global floatAvg
floatAvg:
	mov r2, #0 @ i = 0
	push {r4} 
	ldr r4, =zero
	vldr s0, [r4] @ s0 = 0

@ since we know that this array will always have at least 1 num pased in fall through
loop1:
	vldr s1, [r0] @ s1 = whatever value in r0
	vadd.f32 s0, s0, s1 @ sum = sum + farray[i]
	add r2, r2, #1
@endloop1
	cmp r2, r1 @ if r2 != r1 loop / i != n
	add r0, r0, #4 @move float array ptr by 1 int/wrd
	bne loop1
@calculate avg
	@ now we got the sum, we divide it by length and return it
	vmov s2, r1 @ mov int length to fp register
	vcvt.f32.s32 s3, s2 @ convert from signed int to 32-bit fp
	vdiv.f32 s0, s0, s3 @ sum / length = avg

	pop {r4}
	bx lr

/*
	given hwAvg, ex1, ex2 return grade needed on final to
	recieve an overall course grade of 90 (could exceed 100)
	
	float exam3Agrade(float hw, int32_t exam1, int32_t exam2);

	Overall = 25%(hwAvg) + 25%(e1) + 30%(e2) + 20%(final)
	(final) = 90 - (25%(hwAvg)) - (25%(e1)) -(30%(e2)) / 20%

	initial: s0 = hwAvg, r0 = ex1, r1 = ex2
	final: s0 = final exam grade needed to make an A on the course

	s0, r0, r1 are in use
*/

	.global exam3Agrade
exam3Agrade:
	push {r4} @ bc r4 was used

	@s1 and s2 will act as both sides of the fraction
	@(25% * hwAvg)

	ldr r3, =TwentyFiveP @ load in address of float
	vldr.f32 s3, [r3] @ (25%) load floating point const (will use later too)
	vmul.f32 s1, s3, s0 @ s1 = .25 * hwAvg

	@ 90 - (25%(hwAvg)
	ldr r4, =ninety @ load in address of float
	vldr.f32 s4, [r4] @ load in 90 
	vsub.f32 s1, s4, s1 @ s1 = 90 - s1

	@ 25%(ex1) (convert ex1 to float then mul)
	vmov s4, r0 @ mov ex1 into s4
	vcvt.f32.s32 s4, s4 @ convert from signed --> fp
	vmul.f32 s2, s3, s4 @ s2 = .25 * ex1 temp using s2 to do a sub later

	@ (90 - (25%(hwAvg))) - 25%(ex1) || s1 - s2
	vsub.f32 s1, s1, s2

	@ 30%(ex2)
	ldr r4, =ThirtyP @load in address of float
	vldr.f32 s3, [r4] @ 30%
	vmov s4, r1 @ mov ex2 into s4
	vcvt.f32.s32 s4, s4 @ convert it
	vmul.f32 s2, s3, s4 @ s2 = .3 * ex2 temp using s2

	@ (90 - (25%(hwAvg)) - (25%(e1))) -(30%(e2))  || s1 - s2 
	vsub.f32 s1, s1, s2

	@ divide s1 by 20%
	ldr r4, =TwentyP @ address of float
	vldr.f32 s2, [r4] @ 20% stored in s2
	vdiv.f32 s0, s1, s2 @ s0 = s1/s2

	pop {r4}

	bx lr

	.data
zero: .float 0 
TwentyP: .float .20
TwentyFiveP: .float .25
ThirtyP: .float .3
ninety: .float 90

