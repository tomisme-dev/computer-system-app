	.file	"3.6.c"
	.text
	.p2align 4,,15
	.globl	comp
	.type	comp, @function
comp:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setg	%al
	ret
	.cfi_endproc
.LFE0:
	.size	comp, .-comp
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB1:
	.cfi_startproc
	xorl	%eax, %eax
	testq	%rdi, %rdi
	setne	%al
	ret
	.cfi_endproc
.LFE1:
	.size	test, .-test
	.p2align 4,,15
	.globl	absdiff_se
	.type	absdiff_se, @function
absdiff_se:
.LFB2:
	.cfi_startproc
	cmpq	%rsi, %rdi
	jl	.L7
	movq	%rdi, %rax
	addq	$1, ge_cnt(%rip)
	subq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rsi, %rax
	addq	$1, lt_cnt(%rip)
	subq	%rdi, %rax
	ret
	.cfi_endproc
.LFE2:
	.size	absdiff_se, .-absdiff_se
	.p2align 4,,15
	.globl	cond
	.type	cond, @function
cond:
.LFB3:
	.cfi_startproc
	testw	%di, %di
	je	.L8
	cmpw	%di, (%rsi)
	jge	.L8
	movw	%di, (%rsi)
.L8:
	rep ret
	.cfi_endproc
.LFE3:
	.size	cond, .-cond
	.p2align 4,,15
	.globl	f2
	.type	f2, @function
f2:
.LFB4:
	.cfi_startproc
	cmpw	$5, %dx
	jle	.L11
	cmpw	$2, %si
	movswl	%di, %eax
	jle	.L15
	movswl	%dx, %ecx
	cltd
	idivl	%ecx
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	cmpw	$2, %dx
	movswl	%dx, %eax
	jg	.L16
.L15:
	movswl	%si, %esi
	cltd
	idivl	%esi
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	subl	%edx, %esi
	leal	(%rsi,%rdi), %eax
	ret
	.cfi_endproc
.LFE4:
	.size	f2, .-f2
	.p2align 4,,15
	.globl	absdiff
	.type	absdiff, @function
absdiff:
.LFB5:
	.cfi_startproc
	movq	%rsi, %rdx
	movq	%rdi, %rax
	subq	%rdi, %rdx
	subq	%rsi, %rax
	cmpq	%rsi, %rdi
	cmovl	%rdx, %rax
	ret
	.cfi_endproc
.LFE5:
	.size	absdiff, .-absdiff
	.p2align 4,,15
	.globl	cread
	.type	cread, @function
cread:
.LFB6:
	.cfi_startproc
	movq	(%rdi), %rdx
	movq	(%rsi), %rax
	cmpq	%rax, %rdx
	jg	.L23
	leaq	1(%rax), %rdx
	movq	%rdx, (%rsi)
	subq	(%rdi), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	leaq	1(%rdx), %rax
	movq	%rax, (%rdi)
	movq	%rdx, %rax
	subq	(%rsi), %rax
	ret
	.cfi_endproc
.LFE6:
	.size	cread, .-cread
	.p2align 4,,15
	.globl	cread2
	.type	cread2, @function
cread2:
.LFB7:
	.cfi_startproc
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L24
	movq	(%rdi), %rax
.L24:
	rep ret
	.cfi_endproc
.LFE7:
	.size	cread2, .-cread2
	.globl	ge_cnt
	.bss
	.align 8
	.type	ge_cnt, @object
	.size	ge_cnt, 8
ge_cnt:
	.zero	8
	.globl	lt_cnt
	.align 8
	.type	lt_cnt, @object
	.size	lt_cnt, 8
lt_cnt:
	.zero	8
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
