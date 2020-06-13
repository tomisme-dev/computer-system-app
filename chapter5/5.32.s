	.file	"5.32.c"
	.text
	.p2align 4,,15
	.globl	clear_array
	.type	clear_array, @function
clear_array:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L1
	leal	-1(%rsi), %eax
	leaq	4(%rdi,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$0, (%rdi)
	addq	$4, %rdi
	cmpq	%rax, %rdi
	jne	.L3
.L1:
	rep ret
	.cfi_endproc
.LFE0:
	.size	clear_array, .-clear_array
	.p2align 4,,15
	.globl	clear_array_4
	.type	clear_array_4, @function
clear_array_4:
.LFB1:
	.cfi_startproc
	cmpl	$3, %esi
	jle	.L6
	subl	$4, %esi
	shrl	$2, %esi
	salq	$4, %rsi
	leaq	16(%rdi,%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L8:
	movl	$0, (%rdi)
	movl	$0, 4(%rdi)
	addq	$16, %rdi
	movl	$0, -8(%rdi)
	movl	$0, -4(%rdi)
	cmpq	%rax, %rdi
	jne	.L8
.L6:
	rep ret
	.cfi_endproc
.LFE1:
	.size	clear_array_4, .-clear_array_4
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
