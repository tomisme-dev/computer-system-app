	.file	"5.1.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
	.p2align 4,,15
	.globl	twiddle1
	.type	twiddle1, @function
twiddle1:
.LFB1:
	.cfi_startproc
	movl	(%rsi), %eax
	addl	(%rdi), %eax
	movl	%eax, (%rdi)
	addl	(%rsi), %eax
	movl	%eax, (%rdi)
	ret
	.cfi_endproc
.LFE1:
	.size	twiddle1, .-twiddle1
	.p2align 4,,15
	.globl	twiddle2
	.type	twiddle2, @function
twiddle2:
.LFB2:
	.cfi_startproc
	movl	(%rsi), %eax
	addl	%eax, %eax
	addl	%eax, (%rdi)
	ret
	.cfi_endproc
.LFE2:
	.size	twiddle2, .-twiddle2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
