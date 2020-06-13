	.file	"3_7.c"
	.text
	.globl	store_uprod
	.type	store_uprod, @function
store_uprod:
.LFB27:
	.cfi_startproc
	movq	%rsi, %rax
	mulq	%rdx
	movq	%rax, (%rdi)
	movq	%rdx, 8(%rdi)
	ret
	.cfi_endproc
.LFE27:
	.size	store_uprod, .-store_uprod
	.globl	exchange
	.type	exchange, @function
exchange:
.LFB28:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	%rsi, (%rdi)
	ret
	.cfi_endproc
.LFE28:
	.size	exchange, .-exchange
	.globl	decode1
	.type	decode1, @function
decode1:
.LFB29:
	.cfi_startproc
	movq	(%rsi), %rcx
	movq	(%rdi), %rax
	movq	%rax, (%rsi)
	movq	(%rdx), %rax
	movq	%rcx, (%rdx)
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE29:
	.size	decode1, .-decode1
	.globl	scale
	.type	scale, @function
scale:
.LFB30:
	.cfi_startproc
	leaq	(%rdi,%rsi,4), %rax
	leaq	(%rdx,%rdx,2), %rcx
	leaq	0(,%rcx,4), %rdx
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE30:
	.size	scale, .-scale
	.globl	shift_left4_rightn
	.type	shift_left4_rightn, @function
shift_left4_rightn:
.LFB31:
	.cfi_startproc
	movq	%rdi, %rax
	salq	$4, %rax
	movl	%esi, %ecx
	sarq	%cl, %rax
	ret
	.cfi_endproc
.LFE31:
	.size	shift_left4_rightn, .-shift_left4_rightn
	.globl	arith
	.type	arith, @function
arith:
.LFB32:
	.cfi_startproc
	movabsq	$5270498306774157605, %rdx
	movq	%rdi, %rax
	imulq	%rdx
	sarq	$2, %rdx
	sarq	$63, %rdi
	movq	%rdx, %rax
	subq	%rdi, %rax
	ret
	.cfi_endproc
.LFE32:
	.size	arith, .-arith
	.globl	my_div
	.type	my_div, @function
my_div:
.LFB33:
	.cfi_startproc
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE33:
	.size	my_div, .-my_div
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"result=%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movabsq	$1099511627775, %rdi
	call	arith
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
.LFE34:
	.size	main, .-main
	.globl	remdiv
	.type	remdiv, @function
remdiv:
.LFB35:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rdx, %rdi
	movl	$0, %edx
	divq	%rsi
	movq	%rax, (%rdi)
	movq	%rdx, (%rcx)
	ret
	.cfi_endproc
.LFE35:
	.size	remdiv, .-remdiv
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
