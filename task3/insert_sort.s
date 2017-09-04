	.global insert_sort
	.type insert_sort, @function
	.section .text
insert_sort:
	push %r12
	lea 8(%rdi), %r8 # r8 = ptr1
	lea 8(%rsi), %r9 # r9 = end
while1:
	cmp %r8, %r9
	jz while1end
	mov %r8, %r10 # r10 = ptr2
while2:
	cmp %rdi, %r10
	jle while2end
	mov (%r10), %r11 # r11 = *ptr2
	mov -8(%r10), %r12 # r12 = *(ptr2 - 8)
	cmp %r11, %r12
	jle while2end
	# r12 = tmp
	mov %r11, -8(%r10)
	mov %r12, (%r10)
	lea -8(%r10), %r10
	jmp while2
while2end:
	lea 8(%r8), %r8
	jmp while1
while1end:
	pop %r12
	ret
	.size insert_sort, .-insert_sort
