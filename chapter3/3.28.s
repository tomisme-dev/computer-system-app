	.file	"3.28.c"
	.text
	.globl	switch_eg
	.type	switch_eg, @function
switch_eg:
.LFB0:
	.cfi_startproc
	subq	$100, %rsi
	cmpq	$6, %rsi
	ja	.L8
	leaq	.L4(%rip), %rcx
	movslq	(%rcx,%rsi,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L3-.L4
	.long	.L8-.L4
	.long	.L5-.L4
	.long	.L6-.L4
	.long	.L7-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.text
.L3:
	leaq	(%rdi,%rdi,2), %rax
	leaq	(%rdi,%rax,4), %rdi
	jmp	.L2
.L5:
	addq	$10, %rdi
.L6:
	addq	$11, %rdi
.L2:
	movq	%rdi, (%rdx)
	ret
.L7:
	imulq	%rdi, %rdi
	jmp	.L2
.L8:
	movl	$0, %edi
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	switch_eg, .-switch_eg
	.globl	switch_eg_impl
	.type	switch_eg_impl, @function
switch_eg_impl:
.LFB1:
	.cfi_startproc
	subq	$100, %rsi
	cmpq	$6, %rsi
	ja	.L10
	leaq	jt.1810(%rip), %rax
	jmp	*(%rax,%rsi,8)
.L11:
	leaq	(%rdi,%rdi,2), %rax
	leaq	(%rdi,%rax,4), %rdi
	jmp	.L12
.L13:
	addq	$10, %rdi
.L14:
	addq	$11, %rdi
	jmp	.L12
.L15:
	imulq	%rdi, %rdi
	jmp	.L12
.L10:
	movl	$0, %edi
.L12:
	movq	%rdi, (%rdx)
	ret
	.cfi_endproc
.LFE1:
	.size	switch_eg_impl, .-switch_eg_impl
	.section	.data.rel.ro.local,"aw",@progbits
	.align 32
	.type	jt.1810, @object
	.size	jt.1810, 56
jt.1810:
	.quad	.L11
	.quad	.L10
	.quad	.L13
	.quad	.L14
	.quad	.L15
	.quad	.L10
	.quad	.L15
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
