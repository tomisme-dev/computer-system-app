	.file	"cmpandset.c"
	.text
	.globl	xchange
	.type	xchange, @function
xchange:
.LFB0:
	.cfi_startproc
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	mov %esi, %eax
	lock cmpxchgl %edx, (%rdi)
	sete %al
	movzbl %al, %eax
.L3:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	xchange, .-xchange
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
