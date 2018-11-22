	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_test_if_else
	.align	4, 0x90
_test_if_else:                          ## @test_if_else
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jne	LBB0_2
## BB#1:
	imull	$13, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_2:
	cmpl	$2, -8(%rbp)
	jne	LBB0_4
## BB#3:
	imull	$23, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_4:
	cmpl	$3, -8(%rbp)
	jne	LBB0_6
## BB#5:
	imull	$33, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_6:
	cmpl	$4, -8(%rbp)
	jne	LBB0_8
## BB#7:
	imull	$43, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_8:
	cmpl	$5, -8(%rbp)
	jne	LBB0_10
## BB#9:
	imull	$53, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_10:
	cmpl	$6, -8(%rbp)
	jne	LBB0_12
## BB#11:
	imull	$63, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_12:
	cmpl	$7, -8(%rbp)
	jne	LBB0_14
## BB#13:
	imull	$73, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_14:
	cmpl	$8, -8(%rbp)
	jne	LBB0_16
## BB#15:
	imull	$83, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_16:
	cmpl	$9, -8(%rbp)
	jne	LBB0_18
## BB#17:
	imull	$93, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_18:
	cmpl	$10, -8(%rbp)
	jne	LBB0_20
## BB#19:
	imull	$103, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_21
LBB0_20:
	movl	$0, -4(%rbp)
LBB0_21:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_switch_case
	.align	4, 0x90
_test_switch_case:                      ## @test_switch_case
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	decl	%edi
	movl	%edi, %eax
	subl	$9, %edi
	movq	%rax, -16(%rbp)         ## 8-byte Spill
	movl	%edi, -20(%rbp)         ## 4-byte Spill
	ja	LBB1_11
## BB#13:
	leaq	LJTI1_0(%rip), %rax
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB1_1:
	imull	$13, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_2:
	imull	$23, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_3:
	imull	$33, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_4:
	imull	$43, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_5:
	imull	$53, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_6:
	imull	$63, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_7:
	imull	$73, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_8:
	imull	$83, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_9:
	imull	$93, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_10:
	imull	$103, -8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB1_12
LBB1_11:
	movl	$0, -4(%rbp)
LBB1_12:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
	.align	2, 0x90
L1_0_set_1 = LBB1_1-LJTI1_0
L1_0_set_2 = LBB1_2-LJTI1_0
L1_0_set_3 = LBB1_3-LJTI1_0
L1_0_set_4 = LBB1_4-LJTI1_0
L1_0_set_5 = LBB1_5-LJTI1_0
L1_0_set_6 = LBB1_6-LJTI1_0
L1_0_set_7 = LBB1_7-LJTI1_0
L1_0_set_8 = LBB1_8-LJTI1_0
L1_0_set_9 = LBB1_9-LJTI1_0
L1_0_set_10 = LBB1_10-LJTI1_0
LJTI1_0:
	.long	L1_0_set_1
	.long	L1_0_set_2
	.long	L1_0_set_3
	.long	L1_0_set_4
	.long	L1_0_set_5
	.long	L1_0_set_6
	.long	L1_0_set_7
	.long	L1_0_set_8
	.long	L1_0_set_9
	.long	L1_0_set_10

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	leaq	-24(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	xorps	%xmm0, %xmm0
	movl	$0, -4(%rbp)
	movsd	%xmm0, -48(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	callq	_gettimeofday
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	movl	%eax, -60(%rbp)         ## 4-byte Spill
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100000000, -52(%rbp)   ## imm = 0x5F5E100
	jge	LBB2_4
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	$11, %eax
	movl	-52(%rbp), %ecx
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-64(%rbp), %ecx         ## 4-byte Reload
	idivl	%ecx
	movl	%edx, %edi
	callq	_test_if_else
	addl	-56(%rbp), %eax
	movl	%eax, -56(%rbp)
## BB#3:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB2_1
LBB2_4:
	leaq	-40(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	_gettimeofday
	leaq	L_.str(%rip), %rdi
	movq	-40(%rbp), %rsi
	subq	-24(%rbp), %rsi
	imulq	$1000000, %rsi, %rsi    ## imm = 0xF4240
	movl	-32(%rbp), %ecx
	subl	-16(%rbp), %ecx
	movslq	%ecx, %rdx
	addq	%rdx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movl	-56(%rbp), %esi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	-24(%rbp), %rdi
	xorl	%ecx, %ecx
	movl	%ecx, %esi
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	callq	_gettimeofday
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	movl	%eax, -76(%rbp)         ## 4-byte Spill
LBB2_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100000000, -52(%rbp)   ## imm = 0x5F5E100
	jge	LBB2_8
## BB#6:                                ##   in Loop: Header=BB2_5 Depth=1
	movl	$11, %eax
	movl	-52(%rbp), %ecx
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-80(%rbp), %ecx         ## 4-byte Reload
	idivl	%ecx
	movl	%edx, %edi
	callq	_test_switch_case
	addl	-56(%rbp), %eax
	movl	%eax, -56(%rbp)
## BB#7:                                ##   in Loop: Header=BB2_5 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB2_5
LBB2_8:
	leaq	-40(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	_gettimeofday
	leaq	L_.str1(%rip), %rdi
	movq	-40(%rbp), %rsi
	subq	-24(%rbp), %rsi
	imulq	$1000000, %rsi, %rsi    ## imm = 0xF4240
	movl	-32(%rbp), %ecx
	subl	-16(%rbp), %ecx
	movslq	%ecx, %rdx
	addq	%rdx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movl	-56(%rbp), %esi
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"test_if_else ran %f usec, result = %u\n"

L_.str1:                                ## @.str1
	.asciz	"test_switch_case run %f usec, result = %u\n"


.subsections_via_symbols
