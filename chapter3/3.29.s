	.file	"3.29.c"
	.text
	.globl	f1
	.type	f1, @function
f1:
.LFB0:
	.cfi_startproc
	addl	%esi, %edi
	addl	%edi, %edx
	addl	%edx, %ecx
	addl	%r8d, %ecx
	addl	%r9d, %ecx
	movl	%ecx, %eax
	addl	8(%rsp), %eax
	addl	16(%rsp), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	f1, .-f1
	.globl	f2
	.type	f2, @function
f2:
.LFB1:
	.cfi_startproc
	pushq	$800
	.cfi_def_cfa_offset 16
	pushq	$700
	.cfi_def_cfa_offset 24
	movl	$600, %r9d
	movl	$500, %r8d
	movl	$400, %ecx
	movl	$300, %edx
	movl	$200, %esi
	movl	$100, %edi
	call	f1
	addq	$16, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	f2, .-f2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
