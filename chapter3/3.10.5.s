	.file	"3.10.5.c"
	.text
	.globl	vframe
	.type	vframe, @function
vframe:
; di = n, si = idx, dx = q
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp ; rbp = rsp0
	.cfi_def_cfa_register 6
	subq	$16, %rsp ; rsp = rsp-16
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp) 
	xorl	%eax, %eax ; ax = 0
	leaq	22(,%rdi,8), %rax ; ax = 22 + n*8
	andq	$-16, %rax ; ax = (22+8n) & (-16) = C1
	subq	%rax, %rsp ; rsp = rsp0-16-C1
	leaq	7(%rsp), %rax ; ax = 7 + (rsp0-16-C1)=rsp0-9-C1
	shrq	$3, %rax ; ax = (rsp0-9-C1)/8=C2
	leaq	0(,%rax,8), %r8 ; r8=8C2
	movq	%r8, %rcx ; cx=r8=8C2
	leaq	-16(%rbp), %r9 ; r9=sp0-16
	movq	%r9, 0(,%rax,8) ; *(C2*8)=sp0-16
	movq	$1, -16(%rbp) ; *(spo-16) = 1;
	jmp	.L2
.L3:
	movq	%rdx, (%rcx,%rax,8) ; *(8*C2+8*(7+C1)) = q
	addq	$1, -16(%rbp); *(spo-16) += 1
.L2:
	movq	-16(%rbp), %rax ; ax=*(sp0-16)
	cmpq	%rax, %rdi
	jg	.L3
	movq	(%r8,%rsi,8), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	jne	.L6
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	vframe, .-vframe
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
