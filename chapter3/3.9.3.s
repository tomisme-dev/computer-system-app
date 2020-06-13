	.file	"3.9.3.c"
	.text
	.globl	set_s1
	.type	set_s1, @function
set_s1:
.LFB0:
	.cfi_startproc
	movb	$2, (%rdi)
	movb	$3, 16(%rdi)
	movq	$4, 8(%rdi)
	movb	$9, 2(%rdi)
	movw	$10, 4(%rdi)
	movb	$11, 6(%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	set_s1, .-set_s1
	.globl	set_s2
	.type	set_s2, @function
set_s2:
.LFB1:
	.cfi_startproc
	movl	$2, 4(%rsi)
	movl	$3, 16(%rsi)
	ret
	.cfi_endproc
.LFE1:
	.size	set_s2, .-set_s2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
