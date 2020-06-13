	.file	"3.27.c"
	.text
	.globl	show_fibo
	.type	show_fibo, @function
show_fibo:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	jmp	.L2
.L3:
	subl	$1, %edi
.L2:
	cmpl	$2, %edi
	jg	.L3
	movl	$10, %edi
	call	putchar@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	show_fibo, .-show_fibo
	.globl	sum
	.type	sum, @function
sum:
.LFB24:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
	jmp	.L6
.L7:
	addq	$1, %rdx
.L6:
	cmpq	$9, %rdx
	jg	.L9
	testb	$1, %dl
	jne	.L7
	addq	%rdx, %rax
	jmp	.L7
.L9:
	rep ret
	.cfi_endproc
.LFE24:
	.size	sum, .-sum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sum=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	call	sum
	movl	%eax, %edx
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
