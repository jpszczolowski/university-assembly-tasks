	.global _start
	.type _start, @function
	.section .text
_start:
	mov $0, %rax
	mov $0, %rdi
	mov $buffer, %rsi
	mov $1, %rdx
	syscall
		
	test %rax, %rax
	je end
	
	mov buffer, %al
	cmp $97, %rax
	jge ge97
	cmp $65, %rax
	jge ge65
	jmp pass
	
ge97:
	cmp $122, %rax
	jle ge97le122
	jmp pass
ge97le122:
	sub $32, %rax
	mov %rax, buffer
	jmp pass
ge65:
	cmp $90, %rax
	jle ge65le90
	jmp pass
ge65le90:
	add $32, %rax
	mov %rax, buffer
pass:	
	mov $1, %rax
	mov $1, %rdi
	mov $buffer, %rsi
	mov $1, %rdx
	syscall	
	
	jmp _start
	
end:
	mov $60, %rax
	xor %rdi, %rdi
	syscall	
	.size _start, .-_start
	
	.section .bss
	.local buffer
	.type buffer, @object
	.comm buffer, 1
	