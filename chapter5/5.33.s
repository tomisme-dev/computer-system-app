	.file	"5.33.c"
	.text
	.globl	write_read
	.type	write_read, @function
write_read:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	jmp	.L2
.L3:
	movl	%eax, (%rsi)
	movl	(%rdi), %eax
	addl	$1, %eax
	movl	%ecx, %edx
.L2:
	leal	-1(%rdx), %ecx
	testl	%edx, %edx
	jne	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	write_read, .-write_read
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
