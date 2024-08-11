	.global _start
_start:
	mov r1, #13
	mov r2, #0b110

	sub r3, r2, r1 //value for r3 = 4294967289 base 10 or 0xFFFFFFF9
	mov r4, #0x14 
	mul r5, r3, r4 //r5 = 4294967156 base 10 or 0xFFFFFF74   
	lsr r0, r5, #2 // r0 = 1073741789 base 10 or 0x3FFFFFDD


_end:
	mov r7, #1
	swi 0
