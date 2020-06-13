	.file	"3.37.c"
	.text
	.globl	fix_prod_ele
	.type	fix_prod_ele, @function
fix_prod_ele:
; di: A, 
; si； B,
; dx: i, 
; cx: k
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	movl	$0, %r8d ; r8 = j
	jmp	.L2
.L3:
	movq	%rdx, %r10 ; r10=i
	salq	$6, %r10 ; r10 = i *64
	addq	%rdi, %r10 ; r10 = i*64+A
	movq	%r8, %r9 ; r9 = j
	salq	$6, %r9 ; r9 = j * 64
	addq	%rsi, %r9 ; r9 = j*64+B
	movl	(%r9,%rcx,4), %r9d ; r9 = *(j*64+B+4*k)
	imull	(%r10,%r8,4), %r9d ; r9 = *(j*64+B+4*k) * *(i*64+A+4*j)
	addl	%r9d, %eax ; ax = ax+r9
	addq	$1, %r8 ; j=j+1
.L2:
	cmpq	$15, %r8
	jle	.L3
	rep ret
	.cfi_endproc
.LFE0:
	.size	fix_prod_ele, .-fix_prod_ele
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
