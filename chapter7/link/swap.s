	.file	"swap.c"
# GNU C11 (Ubuntu 7.4.0-1ubuntu1~18.04.1) version 7.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.4.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu swap.c -mtune=generic
# -march=x86-64 -fverbose-asm -fstack-protector-strong -Wformat
# -Wformat-security
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcommon -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm -fgnu-runtime
# -fgnu-unique -fident -finline-atomics -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
# -fplt -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstack-protector-strong
# -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	bufp0
	.section	.data.rel,"aw",@progbits
	.align 8
	.type	bufp0, @object
	.size	bufp0, 8
bufp0:
	.quad	buf
	.comm	bufp1,8,8
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# swap.c:10:     bufp1 = &buf[1];
	leaq	4+buf(%rip), %rax	#, tmp92
	movq	%rax, bufp1(%rip)	# tmp92, bufp1
# swap.c:11:     temp = *bufp0;
	movq	bufp0(%rip), %rax	# bufp0, bufp0.0_1
	movl	(%rax), %eax	# *bufp0.0_1, tmp93
	movl	%eax, -4(%rbp)	# tmp93, temp
# swap.c:12:     *bufp0 = *bufp1;
	movq	bufp1(%rip), %rdx	# bufp1, bufp1.1_2
	movq	bufp0(%rip), %rax	# bufp0, bufp0.2_3
	movl	(%rdx), %edx	# *bufp1.1_2, _4
	movl	%edx, (%rax)	# _4, *bufp0.2_3
# swap.c:13:     *bufp1 = temp;
	movq	bufp1(%rip), %rax	# bufp1, bufp1.3_5
	movl	-4(%rbp), %edx	# temp, tmp94
	movl	%edx, (%rax)	# tmp94, *bufp1.3_5
# swap.c:14: }
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	swap, .-swap
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
