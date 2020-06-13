	.file	"5.32.c"
	.text
	.globl	clear_array
	.type	clear_array, @function
; di=dest, si=n
clear_array:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L1
	movq	%rdi, %rax ; ax = dest
	leal	-1(%rsi), %edx ; dx = n - 1
	leaq	4(%rdi,%rdx,4), %rdx ; dx = 4 + dest + 4 * (n-1) = dest + 4*n
.L3:
	movl	$0, (%rax) ; dext[i] = 0
	addq	$4, %rax ; ax = dest + 4;
	cmpq	%rdx, %rax ; 
	jne	.L3
.L1:
	rep ret
	.cfi_endproc
.LFE0:
	.size	clear_array, .-clear_array
	.globl	clear_array_4
	.type	clear_array_4, @function
clear_array_4:
.LFB1:
	.cfi_startproc
	subl	$3, %esi
	testl	%esi, %esi
	jle	.L5
	movl	$0, %eax
.L7:
	movslq	%eax, %rcx
	leaq	0(,%rcx,4), %rdx
	movl	$0, (%rdi,%rcx,4)
	movl	$0, 4(%rdi,%rdx)
	movl	$0, 8(%rdi,%rdx)
	movl	$0, 12(%rdi,%rdx)
	addl	$4, %eax
	cmpl	%eax, %esi
	jg	.L7
.L5:
	rep ret
	.cfi_endproc
.LFE1:
	.size	clear_array_4, .-clear_array_4
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
