	.file	"hello.c"
	.text
	.section	.rodata
.LC0:
	.string	"hello, world\n"
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

	movq $4, %rax
	movq $1, %rbx
	leaq .LC0(%rip), %rcx
	movq $4, %rdx
	int $0x80

	movq $1, %rax
	movq $0, %rbx
	int $0x80
	

	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
