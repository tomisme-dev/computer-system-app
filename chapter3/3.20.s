	.file	"3.20.c"
	.text
	.globl	arith
	.type	arith, @function
arith:
.LFB0:
	.cfi_startproc
	movl	%edi, %edx
	sall	$4, %edx
	movl	%edx, %eax
	addw	$240, %ax
	testw	%di, %di
	cmovns	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	arith, .-arith
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
