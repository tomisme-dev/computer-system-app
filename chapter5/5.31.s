	.file	"5.31.c"
	.text
	.globl	list_len
	.type	list_len, @function
list_len:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	jmp	.L2
.L3:
	addl	$1, %eax
	movq	(%rdi), %rdi
.L2:
	testq	%rdi, %rdi
	jne	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	list_len, .-list_len
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
