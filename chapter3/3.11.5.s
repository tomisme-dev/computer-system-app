	.file	"3.11.5.c"
	.text
	.globl	simplefun
	.type	simplefun, @function
simplefun:
.LFB0:
	.cfi_startproc
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdi, %xmm1
	ucomisd	%xmm1, %xmm0
	ja	.L7
	pxor	%xmm0, %xmm0
	ret
.L7:
	movsd	.LC0(%rip), %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	simplefun, .-simplefun
	.globl	find_range
	.type	find_range, @function
find_range:
.LFB1:
	.cfi_startproc
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	ja	.L12
	ucomiss	%xmm1, %xmm0
	jp	.L15
	je	.L13
.L15:
	ucomiss	.LC2(%rip), %xmm0
	jbe	.L17
	movl	$2, %eax
	ret
.L12:
	movl	$0, %eax
	ret
.L13:
	movl	$1, %eax
	ret
.L17:
	movl	$3, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	find_range, .-find_range
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	0
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
