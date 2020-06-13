	.file	"dldemo.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./libvector.so"
.LC1:
	.string	"%s\n"
.LC2:
	.string	"addvec"
.LC3:
	.string	"z = [%d %d]\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	dlopen@PLT
	testq	%rax, %rax
	je	.L6
	movq	%rax, %rbx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	dlsym@PLT
	movq	%rax, %rbp
	call	dlerror@PLT
	testq	%rax, %rax
	jne	.L7
	movl	$2, %ecx
	leaq	z(%rip), %rdx
	leaq	y(%rip), %rsi
	leaq	x(%rip), %rdi
	call	*%rbp
	movl	4+z(%rip), %ecx
	movl	z(%rip), %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	dlclose@PLT
	testl	%eax, %eax
	js	.L8
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	call	dlerror@PLT
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L8:
	call	dlerror@PLT
	movq	%rax, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	z,8,8
	.globl	y
	.data
	.align 8
	.type	y, @object
	.size	y, 8
y:
	.long	3
	.long	4
	.globl	x
	.align 8
	.type	x, @object
	.size	x, 8
x:
	.long	1
	.long	2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
