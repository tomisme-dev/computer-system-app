	.file	"3.11.3.c"
	.text
	.globl	funct
	.type	funct, @function
funct:
.LFB0:
	.cfi_startproc
	cvtss2sd	%xmm1, %xmm1
	mulsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	%edi, %xmm1
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	funct, .-funct
	.globl	funct2
	.type	funct2, @function
funct2:
.LFB1:
	.cfi_startproc
	pxor	%xmm0, %xmm0
	cvtsi2ss	%edi, %xmm0
	addss	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE1:
	.size	funct2, .-funct2
	.globl	cel2fahr
	.type	cel2fahr, @function
cel2fahr:
.LFB2:
	.cfi_startproc
	mulsd	.LC0(%rip), %xmm0
	addsd	.LC1(%rip), %xmm0
	ret
	.cfi_endproc
.LFE2:
	.size	cel2fahr, .-cel2fahr
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	3435973837
	.long	1073532108
	.align 8
.LC1:
	.long	0
	.long	1077936128
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
