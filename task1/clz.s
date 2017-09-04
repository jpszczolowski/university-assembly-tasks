	.global clz
	.type clz, @function
	
	.section .text
clz:
	test %rdi, %rdi
	jz zero
	xor %eax, %eax
	mov $0xFFFFFFFF00000000, %r8 
	test %rdi, %r8
	jnz L1
	add $32, %eax
	sal $32, %rdi
L1:
	mov $0xFFFF000000000000, %r8 
	test %rdi, %r8
	jnz L2
	add $16, %eax
	sal $16, %rdi
L2:
	mov $0xFF00000000000000, %r8 
	test %rdi, %r8
	jnz L3
	add $8, %eax
	sal $8, %rdi
L3:
	mov $0xF000000000000000, %r8 
	test %rdi, %r8
	jnz L4
	add $4, %eax
	sal $4, %rdi
L4:
	mov $0xC000000000000000, %r8 
	test %rdi, %r8
	jnz L5
	add $2, %eax
	sal $2, %rdi
L5:
	mov $0x8000000000000000, %r8 
	test %rdi, %r8
	jnz L6
	add $1, %eax
	sal $1, %rdi
L6:
	ret	
zero:
	mov $64, %eax
	ret
	.size clz, .-clz
