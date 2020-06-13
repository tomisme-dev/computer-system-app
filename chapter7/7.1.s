	.file	"7.1.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"a=%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	a(%rip), %eax
	leal	10(%rax), %edx
	movl	%edx, a(%rip)
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	a
	.data
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	65535
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
