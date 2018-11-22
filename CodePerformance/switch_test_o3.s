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
	decl	%edi
	cmpl	$9, %edi
	ja	LBB0_2
## BB#1:                                ## %switch.lookup
	movslq	%edi, %rax
	leaq	l_switch.table2(%rip), %rcx
	movl	(%rcx,%rax,4), %eax
	popq	%rbp
	retq
LBB0_2:
	xorl	%eax, %eax
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
	decl	%edi
	cmpl	$9, %edi
	ja	LBB1_2
## BB#1:                                ## %switch.lookup
	movslq	%edi, %rax
	leaq	l_switch.table2(%rip), %rcx
	movl	(%rcx,%rax,4), %eax
	popq	%rbp
	retq
LBB1_2:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc

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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
Ltmp9:
	.cfi_offset %rbx, -40
Ltmp10:
	.cfi_offset %r14, -32
Ltmp11:
	.cfi_offset %r15, -24
	xorl	%ebx, %ebx
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	leaq	l_switch.table2(%rip), %r15
	xorl	%eax, %eax
	.align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	imulq	$780903145, %rcx, %rcx  ## imm = 0x2E8BA2E9
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	addl	%edx, %ecx
	imull	$11, %ecx, %ecx
	negl	%ecx
	leal	-1(%rax,%rcx), %edx
	cmpl	$9, %edx
	movl	$0, %ecx
	ja	LBB2_3
## BB#2:                                ## %switch.lookup.i
                                        ##   in Loop: Header=BB2_1 Depth=1
	movslq	%edx, %rcx
	movl	(%r15,%rcx,4), %ecx
LBB2_3:                                 ## %test_if_else.exit
                                        ##   in Loop: Header=BB2_1 Depth=1
	addl	%ebx, %ecx
	incl	%eax
	movslq	%eax, %rdx
	imulq	$780903145, %rdx, %rsi  ## imm = 0x2E8BA2E9
	movq	%rsi, %rdi
	shrq	$63, %rdi
	sarq	$33, %rsi
	addl	%edi, %esi
	imull	$11, %esi, %esi
	subl	%esi, %edx
	decl	%edx
	xorl	%ebx, %ebx
	cmpl	$10, %edx
	jae	LBB2_5
## BB#4:                                ## %switch.lookup.i.1
                                        ##   in Loop: Header=BB2_1 Depth=1
	movslq	%edx, %rdx
	movl	(%r15,%rdx,4), %ebx
LBB2_5:                                 ## %test_if_else.exit.1
                                        ##   in Loop: Header=BB2_1 Depth=1
	addl	%ecx, %ebx
	incl	%eax
	cmpl	$100000000, %eax        ## imm = 0x5F5E100
	jne	LBB2_1
## BB#6:
	xorl	%r14d, %r14d
	leaq	-56(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	movq	-56(%rbp), %rax
	subq	-40(%rbp), %rax
	imulq	$1000000, %rax, %rax    ## imm = 0xF4240
	movslq	-48(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	subq	%rdx, %rcx
	addq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm0
	leaq	L_.str(%rip), %rdi
	movb	$1, %al
	movl	%ebx, %esi
	callq	_printf
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	xorl	%eax, %eax
	.align	4, 0x90
LBB2_7:                                 ## =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	imulq	$780903145, %rcx, %rcx  ## imm = 0x2E8BA2E9
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	addl	%edx, %ecx
	imull	$11, %ecx, %ecx
	negl	%ecx
	leal	-1(%rax,%rcx), %edx
	cmpl	$9, %edx
	movl	$0, %ecx
	ja	LBB2_9
## BB#8:                                ## %switch.lookup.i4
                                        ##   in Loop: Header=BB2_7 Depth=1
	movslq	%edx, %rcx
	movl	(%r15,%rcx,4), %ecx
LBB2_9:                                 ## %test_switch_case.exit
                                        ##   in Loop: Header=BB2_7 Depth=1
	addl	%r14d, %ecx
	incl	%eax
	movslq	%eax, %rdx
	imulq	$780903145, %rdx, %rsi  ## imm = 0x2E8BA2E9
	movq	%rsi, %rdi
	shrq	$63, %rdi
	sarq	$33, %rsi
	addl	%edi, %esi
	imull	$11, %esi, %esi
	subl	%esi, %edx
	decl	%edx
	xorl	%r14d, %r14d
	cmpl	$10, %edx
	jae	LBB2_11
## BB#10:                               ## %switch.lookup.i4.1
                                        ##   in Loop: Header=BB2_7 Depth=1
	movslq	%edx, %rdx
	movl	(%r15,%rdx,4), %r14d
LBB2_11:                                ## %test_switch_case.exit.1
                                        ##   in Loop: Header=BB2_7 Depth=1
	addl	%ecx, %r14d
	incl	%eax
	cmpl	$100000000, %eax        ## imm = 0x5F5E100
	jne	LBB2_7
## BB#12:
	leaq	-56(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	movq	-56(%rbp), %rax
	subq	-40(%rbp), %rax
	imulq	$1000000, %rax, %rax    ## imm = 0xF4240
	movslq	-48(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	subq	%rdx, %rcx
	addq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm0
	leaq	L_.str1(%rip), %rdi
	movb	$1, %al
	movl	%r14d, %esi
	callq	_printf
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"test_if_else ran %f usec, result = %u\n"

L_.str1:                                ## @.str1
	.asciz	"test_switch_case run %f usec, result = %u\n"

	.section	__TEXT,__const
	.align	4                       ## @switch.table2
l_switch.table2:
	.long	13                      ## 0xd
	.long	46                      ## 0x2e
	.long	99                      ## 0x63
	.long	172                     ## 0xac
	.long	265                     ## 0x109
	.long	378                     ## 0x17a
	.long	511                     ## 0x1ff
	.long	664                     ## 0x298
	.long	837                     ## 0x345
	.long	1030                    ## 0x406


.subsections_via_symbols
