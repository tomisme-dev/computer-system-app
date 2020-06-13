.section .data
 string:
 .ascii "hello, world\n"
 string_end:
 .equ len, string_end - string
 .section .text
 .globl main
 main:

 movl $4, %eax
 movl $1, %ebx
 movl $string, %ecx
 movl $len, %edx
 int $0x80

 movl $1, %eax
 movl $0, %ebx
 int $0x80