	.file	"3.11.1.c"
	.text
	.globl	float_mov
	.type	float_mov, @function
float_mov:
.LFB0:
	.cfi_startproc
	movss	(%rdi), %xmm1
	movss	%xmm0, (%rsi)
	movaps	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	float_mov, .-float_mov
	.globl	fcvt
	.type	fcvt, @function
fcvt:
.LFB1:
	.cfi_startproc
	movss	(%rsi), %xmm0
	pxor	%xmm1, %xmm1
	cvtsd2ss	(%rdx), %xmm1
	movss	%xmm1, (%rsi)
	cvtss2sd	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE1:
	.size	fcvt, .-fcvt
	.globl	fcvt2
	.type	fcvt2, @function
fcvt2:
.LFB2:
	.cfi_startproc
	movq	(%rdi), %rax
	movss	(%rsi), %xmm0
	cvttsd2siq	(%rdx), %r8
	movq	%r8, (%rdi)
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm1
	movss	%xmm1, (%rsi)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	movsd	%xmm1, (%rdx)
	cvtss2sd	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE2:
	.size	fcvt2, .-fcvt2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
