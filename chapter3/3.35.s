	.file	"3.35.c"
	.text
	.globl	rfact
	.type	rfact, @function
rfact:
.LFB0:
	.cfi_startproc
	cmpq	$1, %rdi
	jg	.L8
	movl	$1, %eax
	ret
.L8:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	leaq	-1(%rdi), %rdi
	call	rfact
	imulq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	rfact, .-rfact
	.globl	rfun
	.type	rfun, @function
rfun:
.LFB1:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L16
	movl	$0, %eax
	ret
.L16:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	shrq	$3, %rdi
	call	rfun
	addq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	rfun, .-rfun
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
