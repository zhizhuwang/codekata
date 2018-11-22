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
	leaq	l_switch.table(%rip), %rcx
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
	xorl	%r15d, %r15d
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	xorl	%ebx, %ebx
	.align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %r14d
	movslq	%ebx, %rbx
	imulq	$780903145, %rbx, %rax  ## imm = 0x2E8BA2E9
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$33, %rax
	addl	%ecx, %eax
	imull	$11, %eax, %eax
	movl	%ebx, %edi
	subl	%eax, %edi
	callq	_test_if_else
	movl	%eax, %r15d
	addl	%r14d, %r15d
	incl	%ebx
	cmpl	$100000000, %ebx        ## imm = 0x5F5E100
	jne	LBB2_1
## BB#2:
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
	movl	%r15d, %esi
	callq	_printf
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	xorl	%ebx, %ebx
	.align	4, 0x90
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r14d, %r15d
	movslq	%ebx, %rbx
	imulq	$780903145, %rbx, %rax  ## imm = 0x2E8BA2E9
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$33, %rax
	addl	%ecx, %eax
	imull	$11, %eax, %eax
	movl	%ebx, %edi
	subl	%eax, %edi
	callq	_test_switch_case
	movl	%eax, %r14d
	addl	%r15d, %r14d
	incl	%ebx
	cmpl	$100000000, %ebx        ## imm = 0x5F5E100
	jne	LBB2_3
## BB#4:
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
	.align	4                       ## @switch.table
l_switch.table:
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
