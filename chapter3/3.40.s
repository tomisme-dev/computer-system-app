	.file	"3.40.c"
	.text
	.globl	gets
	.type	gets, @function
gets:
.LFB23:
	.cfi_startproc
	movq	%rdi, %rax
	movb	$4, (%rdi)
	ret
	.cfi_endproc
.LFE23:
	.size	gets, .-gets
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	echo
	.type	echo, @function
echo:
.LFB24:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	gets
	movb	$10, 9(%rsp)
	movl	$10, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L5
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	echo, .-echo
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	call	echo
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
