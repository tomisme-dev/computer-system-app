	.file	"5.9.c"
	.text
	.globl	merge
	.type	merge, @function
merge:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	movl	$0, %r8d
	movl	$0, %r9d
	jmp	.L2
.L3:
	addl	$1, %r8d
	movslq	%eax, %r11
	movl	%r10d, (%rdx,%r11,4)
	leal	1(%rax), %eax
.L2:
	cmpl	%r8d, %r9d
	movl	%r8d, %r10d
	cmovge	%r9d, %r10d
	cmpl	%ecx, %r10d
	jge	.L6
	movslq	%r9d, %r10
	movl	(%rdi,%r10,4), %r11d
	movslq	%r8d, %r10
	movl	(%rsi,%r10,4), %r10d
	cmpl	%r10d, %r11d
	jge	.L3
	addl	$1, %r9d
	movslq	%eax, %r10
	movl	%r11d, (%rdx,%r10,4)
	leal	1(%rax), %eax
	jmp	.L2
.L7:
	movslq	%r9d, %r11
	movslq	%eax, %r10
	movl	(%rdi,%r11,4), %r11d
	movl	%r11d, (%rdx,%r10,4)
	leal	1(%rax), %eax
	leal	1(%r9), %r9d
.L6:
	cmpl	%ecx, %r9d
	jl	.L7
	jmp	.L8
.L9:
	movslq	%r8d, %r9
	movslq	%eax, %rdi
	movl	(%rsi,%r9,4), %r9d
	movl	%r9d, (%rdx,%rdi,4)
	leal	1(%rax), %eax
	leal	1(%r8), %r8d
.L8:
	cmpl	%ecx, %r8d
	jl	.L9
	rep ret
	.cfi_endproc
.LFE0:
	.size	merge, .-merge
	.globl	merge2
	.type	merge2, @function
merge2:
.LFB1:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$0, %r9d
	movl	$0, %eax
	movl	$0, %r8d
	jmp	.L11
.L12:
	movslq	%eax, %r10
	movl	(%rsi,%r10,4), %r11d
	movslq	%r8d, %r10
	movl	(%rdi,%r10,4), %r10d
	cmpl	%r10d, %r11d
	movl	%r10d, %ebx
	cmovle	%r11d, %ebx
	setg	%r11b
	movzbl	%r11b, %r11d
	addl	%r11d, %r8d
	movl	$1, %r10d
	subl	%r11d, %r10d
	addl	%r10d, %eax
	movslq	%r9d, %r10
	movl	%ebx, (%rdx,%r10,4)
	leal	1(%r9), %r9d
.L11:
	cmpl	%eax, %r8d
	movl	%eax, %r10d
	cmovge	%r8d, %r10d
	cmpl	%ecx, %r10d
	jl	.L12
	jmp	.L13
.L14:
	movslq	%r8d, %r11
	movslq	%r9d, %r10
	movl	(%rdi,%r11,4), %r11d
	movl	%r11d, (%rdx,%r10,4)
	leal	1(%r9), %r9d
	leal	1(%r8), %r8d
.L13:
	cmpl	%ecx, %r8d
	jl	.L14
	jmp	.L15
.L16:
	movslq	%eax, %r8
	movslq	%r9d, %rdi
	movl	(%rsi,%r8,4), %r8d
	movl	%r8d, (%rdx,%rdi,4)
	leal	1(%r9), %r9d
	leal	1(%rax), %eax
.L15:
	cmpl	%ecx, %eax
	jl	.L16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	merge2, .-merge2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
