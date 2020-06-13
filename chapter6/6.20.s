	.file	"6.20.c"
	.text
	.globl	sumarrayrows
	.type	sumarrayrows, @function
sumarrayrows:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	movl	$0, %r8d
	jmp	.L2
.L3:
	movslq	%r8d, %rdx ; dx = i
	leaq	(%rdx,%rdx,8), %rsi ; si = i + 8 * i = 9i;
	leaq	0(,%rsi,8), %rdx ; dx = 8*9i;=72i;
	addq	%rdi, %rdx ; dx = 72i + a;
	movslq	%ecx, %rsi ; si = j
	addl	(%rdx,%rsi,4), %eax ; ax = ax + *(a + 72i + 4 * j)
	addl	$1, %ecx
.L4:
	cmpl	$17, %ecx ; cx = j
	jle	.L3
	addl	$1, %r8d
.L2:
	cmpl	$15, %r8d ; r8 = i
	jg	.L6
	movl	$0, %ecx
	jmp	.L4
.L6:
	rep ret
	.cfi_endproc
.LFE0:
	.size	sumarrayrows, .-sumarrayrows
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
