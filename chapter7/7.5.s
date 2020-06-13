	.file	"7.5.c"
	.text
	.globl	f
	.type	f, @function
f:
.LFB23:
	.cfi_startproc
	movl	x.2446(%rip), %eax
	addl	$1, %eax
	movl	%eax, x.2446(%rip)
	ret
	.cfi_endproc
.LFE23:
	.size	f, .-f
	.globl	g
	.type	g, @function
g:
.LFB24:
	.cfi_startproc
	movl	x.2449(%rip), %eax
	addl	$1, %eax
	movl	%eax, x.2449(%rip)
	ret
	.cfi_endproc
.LFE24:
	.size	g, .-g
	.globl	test
	.type	test, @function
test:
.LFB25:
	.cfi_startproc
	cmpl	$4, %edi
	sete	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	test, .-test
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	movl	$0, %eax
	call	f
	movl	$0, %eax
	call	f
	movl	$0, %eax
	call	f
	movl	$0, %eax
	call	g
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.data
	.align 4
	.type	x.2449, @object
	.size	x.2449, 4
x.2449:
	.long	12
	.align 4
	.type	x.2446, @object
	.size	x.2446, 4
x.2446:
	.long	10
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
