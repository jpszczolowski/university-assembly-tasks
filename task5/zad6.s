	.global main
	.type main, @function
	.section .text
main:
	push %rbx
	push %r12
	push %r13
	push %r14
	#r12 - argc
	#r13 - argv
	#r14 - i
	#r15 - min
	#rbx - max
	mov %rdi, %r12
	mov %rsi, %r13

	cmp $1, %r12
	je end
	
	mov $1, %r14
loop1:
	mov (%r13, %r14, 8), %rdi
	
	mov $15, %rax
	test %rsp, %rax
	jz good_alignment
	sub $8, %rsp
	call atol
	add $8, %rsp
	jmp after_call
good_alignment:
	call atol
after_call:
	push %rax
	
	inc %r14
	cmp %r14, %r12
	jne loop1

	mov $0x7FFFFFFFFFFFFFFF, %r15
	mov $0x8000000000000000, %rbx
	mov $1, %r14
loop2:
	mov -8(%rsp, %r14, 8), %rax
	
	cmp %r15, %rax
	jge not_less_than_min
	mov %rax, %r15
not_less_than_min:
	cmp %rbx, %rax
	jle not_greater_than_max
	mov %rax, %rbx
not_greater_than_max:

	inc %r14
	cmp %r14, %r12
	jne loop2
		
	lea -8(, %r12, 8), %rax
	add %rax, %rsp
	
	mov $0, %rax
	mov $format, %rdi
	mov %r15, %rsi
	mov %rbx, %rdx
	sub $8, %rsp
	call printf
	add $8, %rsp
	
end:
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	ret
	
	.size main, .-main
	
	.section .rodata
	
	.local format
	.type format, @object
	.size format, 9
format:
	.asciz "%ld %ld\n"
