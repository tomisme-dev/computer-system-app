	.file	"3.42.c"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	movl	$1, %eax
	jmp	.L2
.L3:
	imulw	(%rdi), %ax
	movq	8(%rdi), %rdi
.L2:
	testq	%rdi, %rdi
	jne	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
