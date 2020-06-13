	.file	"3.37.c"
	.text
	.globl	fix_prod_ele
	.type	fix_prod_ele, @function
fix_prod_ele:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	movl	$0, %r8d
	jmp	.L2
.L3:
	movq	%rdx, %r10
	salq	$6, %r10
	addq	%rdi, %r10
	movq	%r8, %r9
	salq	$6, %r9
	addq	%rsi, %r9
	movl	(%r9,%rcx,4), %r9d
	imull	(%r10,%r8,4), %r9d
	addl	%r9d, %eax
	addq	$1, %r8
.L2:
	cmpq	$15, %r8
	jle	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	fix_prod_ele, .-fix_prod_ele
	.globl	var_ele
	.type	var_ele, @function
var_ele:
.LFB1:
	.cfi_startproc
	imulq	%rdi, %rdx
	leaq	(%rsi,%rdx,4), %rax
	movl	(%rax,%rcx,4), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	var_ele, .-var_ele
	.globl	var_ele2
	.type	var_ele2, @function
var_ele2:
.LFB2:
	.cfi_startproc
	movl	(%rsi,%rdx,4), %eax
	ret
	.cfi_endproc
.LFE2:
	.size	var_ele2, .-var_ele2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
