	.file	"test1.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	swi
	.type	swi, @function
swi:
.LFB1:
	.cfi_startproc
	cmpl	$101, %edi
	je	.L4
	cmpl	$101, %edi
	jle	.L10
	cmpl	$102, %edi
	je	.L7
	cmpl	$103, %edi
	jne	.L3
	leal	0(,%rdi,8), %eax
	subl	%edi, %eax
	ret
.L10:
	cmpl	$100, %edi
	jne	.L3
	movl	%edi, %eax
	ret
.L4:
	leal	(%rdi,%rdi), %eax
	ret
.L7:
	leal	7(%rdi), %eax
	ret
.L3:
	leal	-9(%rdi), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	swi, .-swi
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
