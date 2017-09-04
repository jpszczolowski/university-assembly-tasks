	.global lcm_gcd
	.type lcm_gcd, @function
	.section .text
lcm_gcd:
	mov %rdi, %r8
	mov %rsi, %r9
while:	
	test %rsi, %rsi
	je after_while
	xor %rdx, %rdx
	mov %rdi, %rax
	div %rsi
	mov %rsi, %rdi
	mov %rdx, %rsi
	jmp while
after_while:
	xor %rdx, %rdx
	mov %r8, %rax
	div %rdi
	imul %r9, %rax
	mov %rdi, %rdx
	ret
	.size lcm_gcd, .-lcm_gcd
