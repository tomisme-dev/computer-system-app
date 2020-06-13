	.file	"4..4.c"
	.text
	.globl	rproduct
	.type	rproduct, @function
rproduct:
.LFB23:
	.cfi_startproc
	cmpq	$1, %rsi
	jg	.L8
	movl	$1, %eax
	ret
.L8:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	(%rdi), %rbx
	subq	$1, %rsi
	addq	$8, %rdi
	call	rproduct
	imulq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	rproduct, .-rproduct
	.globl	push_test
	.type	push_test, @function
push_test:
.LFB24:
	.cfi_startproc
	movq %rsp, %rbx
	pushq %rsp
	popq %rax
	subq %rbx, %rax
	ret
	.cfi_endproc
.LFE24:
	.size	push_test, .-push_test
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hello world, valu=%ld"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$18, %edi
	call	push_test
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
