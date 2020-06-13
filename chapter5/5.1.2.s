	.file	"5.1.2.c"
	.text
	.p2align 4,,15
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	movl	count(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, count(%rip)
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.p2align 4,,15
	.globl	func1
	.type	func1, @function
func1:
.LFB1:
	.cfi_startproc
	movl	count(%rip), %eax
	leal	4(%rax), %edx
	leal	6(,%rax,4), %eax
	movl	%edx, count(%rip)
	ret
	.cfi_endproc
.LFE1:
	.size	func1, .-func1
	.p2align 4,,15
	.globl	func2
	.type	func2, @function
func2:
.LFB2:
	.cfi_startproc
	movl	count(%rip), %eax
	leal	1(%rax), %edx
	sall	$2, %eax
	movl	%edx, count(%rip)
	ret
	.cfi_endproc
.LFE2:
	.size	func2, .-func2
	.globl	count
	.bss
	.align 4
	.type	count, @object
	.size	count, 4
count:
	.zero	4
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
