	.file	"3.10.1.c"
	.text
	.globl	f
	.type	f, @function
f:
.LFB23:
	.cfi_startproc
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE23:
	.size	f, .-f
	.globl	fun_call
	.type	fun_call, @function
fun_call:
.LFB24:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movl	%esi, %edi
	movl	%edx, %esi
	call	*%rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	fun_call, .-fun_call
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$10, %esi
	movl	$9, %edi
	call	f
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
