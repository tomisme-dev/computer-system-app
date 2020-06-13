	.file	"3.38.c"
	.text
	.globl	sum_element
	.type	sum_element, @function
sum_element:
.LFB0:
	.cfi_startproc
	leaq	(%rdi,%rdi,4), %rdx
	addq	%rsi, %rdx
	leaq	(%rsi,%rsi,2), %rax
	addq	%rax, %rdi
	leaq	Q(%rip), %rax
	movq	(%rax,%rdi,8), %rax
	leaq	P(%rip), %rcx
	addq	(%rcx,%rdx,8), %rax
	ret
	.cfi_endproc
.LFE0:
	.size	sum_element, .-sum_element
	.comm	Q,120,32
	.comm	P,120,32
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
