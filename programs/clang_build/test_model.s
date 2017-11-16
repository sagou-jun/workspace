	.text
	.def	 rt_OneStep;
	.scl	2;
	.type	32;
	.endef
	.globl	rt_OneStep
	.align	16, 0x90
rt_OneStep:                             # @rt_OneStep
.Ltmp0:
.seh_proc rt_OneStep
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp1:
	.seh_pushreg 5
	movq	%rsp, %rbp
	subq	$32, %rsp
.Ltmp2:
	.seh_setframe 5, 0
.Ltmp3:
	.seh_endprologue
	cmpb	$0, rt_OneStep.OverrunFlag(%rip)
	je	.LBB0_2
# BB#1:                                 # %if.then
	movq	test_model_M(%rip), %rax
	leaq	.L.str(%rip), %rcx
	movq	%rcx, (%rax)
	jmp	.LBB0_3
.LBB0_2:                                # %if.end
	movb	$1, rt_OneStep.OverrunFlag(%rip)
	callq	test_model_step
	movb	$0, rt_OneStep.OverrunFlag(%rip)
.LBB0_3:                                # %return
	addq	$32, %rsp
	popq	%rbp
	retq
.Leh_func_end0:
.Ltmp4:
	.seh_endproc

	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	main
	.align	16, 0x90
main:                                   # @main
.Ltmp5:
.seh_proc main
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp6:
	.seh_pushreg 5
	movq	%rsp, %rbp
	subq	$48, %rsp
.Ltmp7:
	.seh_setframe 5, 0
.Ltmp8:
	.seh_endprologue
	callq	__main
	movl	$0, -4(%rbp)
	movl	%ecx, -8(%rbp)
	movq	%rdx, -16(%rbp)
	callq	test_model_initialize
	leaq	.L.str1(%rip), %rcx
	callq	printf
	xorl	%ecx, %ecx
	callq	fflush
	movq	test_model_M(%rip), %rax
	.align	16, 0x90
.LBB1_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, (%rax)
	je	.LBB1_1
# BB#2:                                 # %while.end
	callq	test_model_terminate
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Leh_func_end1:
.Ltmp9:
	.seh_endproc

	.def	 test_model_step;
	.scl	2;
	.type	32;
	.endef
	.globl	test_model_step
	.align	16, 0x90
test_model_step:                        # @test_model_step
.Ltmp10:
.seh_proc test_model_step
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp11:
	.seh_pushreg 5
	movq	%rsp, %rbp
.Ltmp12:
	.seh_setframe 5, 0
.Ltmp13:
	.seh_endprologue
	movsd	test_model_P(%rip), %xmm0
	addsd	test_model_P+8(%rip), %xmm0
	movsd	%xmm0, test_model_Y(%rip)
	popq	%rbp
	retq
.Leh_func_end2:
.Ltmp14:
	.seh_endproc

	.def	 test_model_initialize;
	.scl	2;
	.type	32;
	.endef
	.globl	test_model_initialize
	.align	16, 0x90
test_model_initialize:                  # @test_model_initialize
.Ltmp15:
.seh_proc test_model_initialize
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp16:
	.seh_pushreg 5
	movq	%rsp, %rbp
.Ltmp17:
	.seh_setframe 5, 0
.Ltmp18:
	.seh_endprologue
	movq	test_model_M(%rip), %rax
	movq	$0, (%rax)
	movq	$0, test_model_Y(%rip)
	popq	%rbp
	retq
.Leh_func_end3:
.Ltmp19:
	.seh_endproc

	.def	 test_model_terminate;
	.scl	2;
	.type	32;
	.endef
	.globl	test_model_terminate
	.align	16, 0x90
test_model_terminate:                   # @test_model_terminate
.Ltmp20:
.seh_proc test_model_terminate
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp21:
	.seh_pushreg 5
	movq	%rsp, %rbp
.Ltmp22:
	.seh_setframe 5, 0
.Ltmp23:
	.seh_endprologue
	popq	%rbp
	retq
.Leh_func_end4:
.Ltmp24:
	.seh_endproc

	.lcomm	rt_OneStep.OverrunFlag,1 # @rt_OneStep.OverrunFlag
	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	"Overrun"

.L.str1:                                # @.str1
	.asciz	"Warning: The simulation will run forever. Generated ERT main won't simulate model step behavior. To change this behavior select the 'MAT-file logging' option.\n"

	.comm	test_model_M_,8,3       # @test_model_M_
	.globl	test_model_M            # @test_model_M
	.align	8
test_model_M:
	.quad	test_model_M_

	.comm	test_model_Y,8,3        # @test_model_Y

