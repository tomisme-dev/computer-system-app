	.file	"sharing.c"
	.text
	.comm	ptr,8,8
	.comm	mutex,32,32
	.section	.rodata
.LC0:
	.string	"Hello from foo"
.LC1:
	.string	"Hello from bar"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	$1, %edx
	movl	$0, %esi
	leaq	mutex(%rip), %rdi
	call	sem_init@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, ptr(%rip)
	movl	$0, -52(%rbp)
	jmp	.L2
.L3:
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, (%rax)
	movq	-40(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	leaq	thread(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	addl	$1, -52(%rbp)
.L2:
	cmpl	$1, -52(%rbp)
	jle	.L3
.L4:
	jmp	.L4
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
.LC2:
	.string	"abc"
.LC3:
	.string	"msg: %d\n"
	.text
	.globl	f1
	.type	f1, @function
f1:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC2(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	f1, .-f1
	.section	.rodata
.LC4:
	.string	"thread...cnt=%d\n"
	.text
	.globl	thread
	.type	thread, @function
thread:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	leaq	mutex(%rip), %rdi
	call	sem_wait@PLT
	movl	cnt.3316(%rip), %eax
	addl	$1, %eax
	movl	%eax, cnt.3316(%rip)
	leaq	mutex(%rip), %rdi
	call	sem_post@PLT
	addl	$1, -4(%rbp)
.L8:
	cmpl	$999999, -4(%rbp)
	jle	.L9
	movl	cnt.3316(%rip), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	thread, .-thread
	.local	cnt.3316
	.comm	cnt.3316,4,4
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
