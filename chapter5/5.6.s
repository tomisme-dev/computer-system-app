	.file	"5.6.c"
	.text
	.globl	polyh
	.type	polyh, @function
polyh:
.LFB0:
	.cfi_startproc
	movslq	%esi, %rax
	movsd	(%rdi,%rax,8), %xmm1
	subl	$1, %esi
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	js	.L1
.L3:
	mulsd	%xmm0, %xmm1
	addsd	(%rdi,%rsi,8), %xmm1
	subq	$1, %rsi
	cmpq	$-1, %rsi
	jne	.L3
.L1:
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	polyh, .-polyh
	.globl	poly
	.type	poly, @function
poly:
.LFB1:
	.cfi_startproc
	movsd	(%rdi), %xmm2
	testl	%esi, %esi
	jle	.L5
	leaq	8(%rdi), %rax
	movslq	%esi, %rsi
	leaq	8(%rdi,%rsi,8), %rdx
	movapd	%xmm0, %xmm1
.L7:
	movapd	%xmm1, %xmm3
	mulsd	(%rax), %xmm3
	addsd	%xmm3, %xmm2
	mulsd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L7
.L5:
	movapd	%xmm2, %xmm0
	ret
	.cfi_endproc
.LFE1:
	.size	poly, .-poly
	.globl	sum
	.type	sum, @function
sum:
.LFB2:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L12
	movq	%rdi, %rdx ; dx = arr
	leal	-1(%rsi), %eax ; ax = len - 1;
	leaq	4(%rdi,%rax,4), %rcx ; cx = 4 + arr + 4 * (len-1)
	movl	$0, %eax
.L11:
	addl	(%rdx), %eax
	addq	$4, %rdx
	cmpq	%rcx, %rdx
	jne	.L11
	rep ret
.L12:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE2:
	.size	sum, .-sum
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
