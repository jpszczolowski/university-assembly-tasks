	.global approx_sqrt
	.type approx_sqrt, @function
	.section .text
approx_sqrt:
	#xmm0 - a
	#xmm1 - x_n
	#xmm2 - x_n+1
	#xmm3 - x_n+1 - x_n
	#xmm4 - 0
	#xmm5 - eps
	ptest %xmm0, %xmm0 	
	je xmm0_is_zero
	movsd %xmm1, %xmm5
	andnps %xmm1, %xmm1
	andnps %xmm2, %xmm2
	andnps %xmm3, %xmm3
	andnps %xmm4, %xmm4
	
	movsd %xmm0, %xmm1
loop:	
	movsd %xmm0, %xmm2
	divsd %xmm1, %xmm2
	addsd %xmm1, %xmm2
	mulsd half, %xmm2
	
	movsd %xmm2, %xmm3
	subsd %xmm1, %xmm3
	movsd %xmm2, %xmm1
	
	ucomisd %xmm4, %xmm3
	ja greater_equal_zero
	mulsd minus, %xmm3
greater_equal_zero:
	ucomisd %xmm5, %xmm3
	jb halt
	jmp loop 

halt:
	movsd %xmm1, %xmm0
xmm0_is_zero:
	ret
	
	.size approx_sqrt, .-approx_sqrt
	.section .rodata

	.local half
	.type half, @object
half:
	.double 0.5
	.size half, 8
	
	.local minus
	.type minus, @object
minus:
	.double -1.0
	.size minus, 8
