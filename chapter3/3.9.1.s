	.file	"3.9.1.c"
	.text
	.globl	f
	.type	f, @function
f:
.LFB23:
	.cfi_startproc
	movq	8(%rsp), %rax
	ret
	.cfi_endproc
.LFE23:
	.size	f, .-f
	.globl	f_pointer
	.type	f_pointer, @function
f_pointer:
.LFB24:
	.cfi_startproc
	movq	24(%rdi), %rax
	addq	$88, %rax
	movq	%rax, 24(%rdi)
	movq	(%rdi), %rax
	ret
	.cfi_endproc
.LFE24:
	.size	f_pointer, .-f_pointer
	.globl	st_init
	.type	st_init, @function
st_init:
.LFB25:
	.cfi_startproc
	movzwl	8(%rdi), %eax
	movw	%ax, 10(%rdi)
	leaq	10(%rdi), %rax
	movq	%rax, (%rdi)
	movq	%rdi, 16(%rdi)
	ret
	.cfi_endproc
.LFE25:
	.size	st_init, .-st_init
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"after: %ld, %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	$400, 24(%rsp)
	movq	$300, 16(%rsp)
	movq	$100, (%rsp)
	movl	$500, 32(%rsp)
	movq	%rsp, %rdi
	call	f_pointer
	movq	%rax, %rcx
	movq	24(%rsp), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	40(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L7
	movl	$0, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
