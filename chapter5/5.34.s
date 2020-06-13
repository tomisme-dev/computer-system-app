	.file	"5.34.c"
	.text
	.globl	psum1
	.type	psum1, @function
psum1:
.LFB41:
	.cfi_startproc
	movss	(%rdi), %xmm0
	movss	%xmm0, (%rsi)
	movl	$1, %eax
	jmp	.L2
.L3:
	leaq	0(,%rax,4), %rcx
	movss	(%rdi,%rax,4), %xmm0
	addss	-4(%rsi,%rcx), %xmm0
	movss	%xmm0, (%rsi,%rcx)
	addq	$1, %rax
.L2:
	cmpq	%rdx, %rax
	jl	.L3
	rep ret
	.cfi_endproc
.LFE41:
	.size	psum1, .-psum1
	.globl	psum2
	.type	psum2, @function
psum2:
.LFB42:
	.cfi_startproc
	movss	(%rdi), %xmm0
	movss	%xmm0, (%rsi)
	movss	(%rdi), %xmm0
	movl	$1, %eax
	jmp	.L5
.L6:
	addss	(%rdi,%rax,4), %xmm0
	movss	%xmm0, (%rsi,%rax,4)
	addq	$1, %rax
.L5:
	cmpq	%rdx, %rax
	jl	.L6
	rep ret
	.cfi_endproc
.LFE42:
	.size	psum2, .-psum2
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$416, %eax
	subq	%rax, %rsp
	movq	%rsp, %r14
	movq	%r14, %r13
	subq	%rax, %rsp
	movq	%rsp, %r15
	movq	%r15, %r12
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, %ebx
	jmp	.L8
.L9:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movapd	%xmm0, %xmm1
	mulsd	.LC0(%rip), %xmm1
	movslq	%ebx, %rax
	pxor	%xmm2, %xmm2
	cvtsd2ss	%xmm1, %xmm2
	movss	%xmm2, 0(%r13,%rax,4)
	mulsd	.LC1(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, (%r12,%rax,4)
	addl	$1, %ebx
.L8:
	cmpl	$99, %ebx
	jle	.L9
	movl	$100, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	psum1
	movl	$0, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L12
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1202590843
	.long	1065646817
	.align 8
.LC1:
	.long	34359738
	.long	1065781035
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
