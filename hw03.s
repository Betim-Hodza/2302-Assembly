	.global _start
_start:
	mov r0, #0 @ sum = 0
	mov r1, #1 @ i = 1
	b bottom

Loop:
	tst r1, #1 @ tests the LSB aka odd number
	beq increment @ goes to increment i or r1

	add r0, r0, r1 @ sum = sum + 
increment:
	add r1, #1 @ i++
bottom:
	cmp r1, #10
	blt Loop


_end:
	mov r7, #1
	swi 0
