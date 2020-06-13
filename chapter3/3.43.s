	.file	"3.43.c"
	.text
	.globl	get
	.type	get, @function
get:
.LFB0:
	.cfi_startproc
	movswq	8(%rdi), %rax
	addq	(%rdi), %rax
	movsbq	10(%rdi), %rdx
	subq	%rdx, %rax
	movslq	4(%rdi), %rdx
	addq	%rdx, %rax
	movq	%rax, (%rsi)
	ret
	.cfi_endproc
.LFE0:
	.size	get, .-get
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
