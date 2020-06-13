	.file	"5.11.c"
	.text
	.globl	minmax2
	.type	minmax2, @function
minmax2:
.LFB0:
	.cfi_startproc
	movl	$0, %r9d ; i
	jmp	.L2
.L3:
	movslq	%r9d, %rax ; ax = i
	salq	$2, %rax ; ax = 4 * i
	leaq	(%rsi,%rax), %r10 ; r10 = b + 4 * i
	movl	(%r10), %ecx ; cx = b[i]
	addq	%rdi, %rax ; ax = a + 4 * i
	movl	(%rax), %r8d ; r8 = a[i]
	cmpl	%r8d, %ecx ; b[i] - a[i]
	movl	%r8d, %r11d ; r11 = a[i]
	cmovle	%ecx, %r11d ;  r11 = a[i] >= b[i] ? b[i]: a[i] ; r11 = min
	cmovl	%r8d, %ecx ; cx = a[i] > b[i] ? a[i] : b[i] ; cx = max
	movl	%r11d, (%rax) ; a[i] = min
	movl	%ecx, (%r10); b[i] = max
	addl	$1, %r9d
.L2:
	cmpl	%edx, %r9d ; i < n
	jl	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	minmax2, .-minmax2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
