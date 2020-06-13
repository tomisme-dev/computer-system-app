	.file	"usevec.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"c[1]=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	$1, (%rsp)
	movl	$2, 4(%rsp)
	movl	$10, 8(%rsp)
	movl	$11, 12(%rsp)
	movl	$0, 16(%rsp)
	movl	$0, 20(%rsp)
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rsi
	movq	%rsp, %rdi
	movl	$2, %ecx
	call	mulvec@PLT
	movl	20(%rsp), %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L4
	movl	$0, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
