	.file	"5.35.c"
	.text
	.globl	lower2
	.type	lower2, @function
lower2:
.LFB34:
	.cfi_startproc
	movq	%rdi, %r8
	movq	$-1, %rcx
	movl	$0, %eax
	repnz scasb
	notq	%rcx
	leal	-1(%rcx), %edi
	movl	$0, %ecx
	jmp	.L2
.L5:
	movl	$0, %esi
.L3:
	addl	%esi, %edx
	movb	%dl, (%rax)
	addl	$1, %ecx
.L2:
	cmpl	%edi, %ecx
	jge	.L6
	movslq	%ecx, %rax
	addq	%r8, %rax
	movzbl	(%rax), %edx
	movsbl	%dl, %esi
	subl	$65, %esi
	cmpl	$25, %esi
	ja	.L5
	movl	$32, %esi
	jmp	.L3
.L6:
	rep ret
	.cfi_endproc
.LFE34:
	.size	lower2, .-lower2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"name===>%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movabsq	$6278066737626506568, %rax
	movabsq	$2851176532693615, %rdx
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	call	lower2
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L10
	movl	$0, %eax
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
