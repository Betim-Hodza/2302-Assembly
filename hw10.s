/*
	float calcClassAvg(struct scores [], int32_t n);
	// given an array of structures and the length of the array
	// returns the class average

	intial: r0 = structArray r1 = length of StructArray
	
	final: s0 = classAverage

	c code
	int i = 0, j=0;
	float grade = 0;

	while(j < n) @while j < length of struct
	{
		@grab every element
		@(in assembly, we can go 16 bytes ahead and not store the name)
		char name [15] = scores[i];
		i++;
		float hwAvg = scores[i];
		i++;
		int exam1 = scores[i];
		i++;
		int exam2 = scores[i];
		i++;
		int final = scores[i];
		
		@ calculate the grade in parts using mul add assembly func 
		grade += .25 * hwAvg;
		grade += .25 * exam1;
		grade += .30 * exam2;
		grade += .20 * final;

		i=0; @ reset the i counter ( in Assembly move pointer back x amt
		of bytes (aka know how its padded))

		j++; @ increment j to reach
	}
	@calculate the total average 
	grade /= n;

	return grade;

*/
	.global calcClassAvg
	
calcClassAvg:
	ldr r3, =zero
	vldr s0, [r3] @ grade sum
	
	vmov s1, r1 @ mov length val into s1
	vcvt.f32.s32 s1, s1 @make it a float signed

	mov r2, #0 @ i

	@s1 = n, s0 = sum, r2 = i

	@ fall through to calculate grade
grabValues:
	cmp r2, r1 @ if r2 >= r1 go to end
	bge avgClass
	@hwAvg (mv past 15 bytes over name)
	vldr s2, [r0, #16] @grabs HwAvg float
	ldr r3, [r0], #20 @movs 4 bytes over to get test1
	
	@s2 = hwAvg

	@test1 
	ldr r3, [r0], #4
	vmov s3, r3 
	vcvt.f32.s32 s3, s3 @int to float for calc

	@s3 = test1

	@test2
	ldr r3, [r0], #4
	vmov s4, r3
	vcvt.f32.s32 s4, s4 

	@s4 = test2

	@final
	ldr r3, [r0], #4
	vmov s5, r3
	vcvt.f32.s32 s5, s5

	@s5 = final

calcToSum:
	ldr r3, =twentyFiveP
	vldr s6, [r3] @ point to .25 and use it to calculate
	@going to use multiply add fmla
	
	@ grade += 25% * hwAvg + 25% * test1
	vmla.f32 s0, s2, s6 @ s0 += hwAvg * .25
	vmla.f32 s0, s3, s6 @ s0 += test1 * .25

	ldr r3, =thirtyP
	vldr s6, [r3] @ point to .30

	@ grade += 30% * test2
	vmla.f32 s0, s4, s6 @ s0 += test2 * .30

	ldr r3, =twentyP
	vldr s6, [r3] @ point to .20
	
	@ grade += 20% * final
	vmla.f32 s0, s5, s6 @ s0 += final * .20

	add r2, r2, #1 @ j++
	b grabValues

avgClass:
@ caluclate total sum, then do average here on s0  s0 += grade1 ... s0 += graden / n

	vdiv.f32 s0, s0, s1 @ gradeTotal/n(length of struct array) 
end:
	
	@ return s0 with class avg

	bx lr


	.data
zero: .float 0
twentyFiveP: .float .25
thirtyP: .float .30
twentyP: .float .20
