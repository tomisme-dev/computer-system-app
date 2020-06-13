	.file	"3.22.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"n=%d, overflow\n"
	.text
	.globl	f
	.type	f, @function
f:
.LFB23:
	.cfi_startproc
	movl	$1, %esi
.L4:
	movl	%edi, %ecx
	imull	%esi, %ecx
	movl	%ecx, %eax
	cltd
	idivl	%esi
	cmpl	%edi, %eax
	jne	.L9
	subl	$1, %edi
	movl	%ecx, %esi
	cmpl	$1, %edi
	jg	.L4
	movl	%ecx, %eax
	ret
.L9:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$-1, %ecx
	movl	%ecx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	f, .-f
	.globl	dw_loop
	.type	dw_loop, @function
dw_loop:
.LFB24:
	.cfi_startproc
	movl	%edi, %eax
	movswl	%di, %ecx
	imull	$7282, %ecx, %ecx
	shrl	$16, %ecx
	movl	%edi, %edx
	sarw	$15, %dx
	subl	%edx, %ecx
	sall	$2, %edi
.L11:
	leal	5(%rcx,%rax), %eax
	leal	-2(%rdi), %edx
	movl	%edx, %edi
	testw	%dx, %dx
	jg	.L11
	rep ret
	.cfi_endproc
.LFE24:
	.size	dw_loop, .-dw_loop
	.section	.rodata.str1.1
.LC1:
	.string	"14!=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$14, %edi
	call	f
	movl	%eax, %edx
	leaq	.LC1(%rip), %rsi
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
	.globl	fact_while
	.type	fact_while, @function
fact_while:
.LFB26:
	.cfi_startproc
	movl	$1, %eax
	jmp	.L15
.L16:
	imulq	%rdi, %rax
	subq	$1, %rdi
.L15:
	cmpq	$1, %rdi
	jg	.L16
	rep ret
	.cfi_endproc
.LFE26:
	.size	fact_while, .-fact_while
	.globl	test_one
	.type	test_one, @function
test_one:
.LFB27:
	.cfi_startproc
	jmp	.L18
.L19:
	shrw	%di
.L18:
	testw	%di, %di
	jne	.L19
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	test_one, .-test_one
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
