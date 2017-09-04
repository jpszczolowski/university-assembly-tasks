	.global fibonacci
	.type fibonacci, @function
	.section .text
fibonacci:
	push %rbp
	mov %rsp, %rbp
	cmp $1, %rdi
	jbe rec_base
	push %rdi
	sub $1, %rdi
	
	sub $8, %rsp
	call fibonacci
	add $8, %rsp
	
	mov (%rsp), %rdi
	lea -2(%rdi), %rdi
	mov %rax, (%rsp)
	
	sub $8, %rsp
	call fibonacci
	add $8, %rsp

	add (%rsp), %rax
	lea 8(%rsp), %rsp
	pop %rbp
	ret
rec_base:
	mov %rdi, %rax
	pop %rbp
	ret
	.size fibonacci, .-fibonacci
