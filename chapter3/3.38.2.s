	.file	"3.38.c"
	.text
	.globl	sum_element
	.type	sum_element, @function
; i in %rdi, j in %rsi 
sum_element:
.LFB0:
	.cfi_startproc
	leaq	(%rdi,%rdi,4), %rdx ;dx = 5i
	addq	%rsi, %rdx ; dx = 5i+j
	leaq	(%rsi,%rsi,2), %rax ; ax = 3j
	addq	%rax, %rdi ; di = 3j+i
	leaq	Q(%rip), %rax ; ax=&Q 
	movq	(%rax,%rdi,8), %rax ;ax=*(&Q+(3j+i)*8)
	leaq	P(%rip), %rcx ;cx=&P
	addq	(%rcx,%rdx,8), %rax ;*(&Q+(3j+i)*8) + *(&P+(5i+j)*8)
	ret
	.cfi_endproc
.LFE0:
	.size	sum_element, .-sum_element
	.comm	Q,120,32
	.comm	P,120,32
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits



;long sum_element(long i, long j)
; i in %rdi, j in %rsi
sum_element:
	leaq 0(,%rdi,8), %rdx ;dx = i * 8
	subq %rdi, %rdx ;dx = i*8-i=7i
	addq %rsi, %rdx ;dx = 7i+j
	leaq (%rsi,%rsi,4), %rax ;ax=5j
	addq %rax, %rdi ;di=5j+i
	movq Q(,%rdi,8), %rax ;
	addq P(,%rdx,8), %rax
	ret