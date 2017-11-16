	.text
	.def	 target;
	.scl	2;
	.type	32;
	.endef
	.globl	target
	.align	16, 0x90
target:                                 # @target
.Ltmp0:
.seh_proc target
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
	movl	$5000, -4(%rbp)         # imm = 0x1388
	movl	$2000, -8(%rbp)         # imm = 0x7D0
	movl	$3000, -12(%rbp)        # imm = 0xBB8
	movl	$4000, -16(%rbp)        # imm = 0xFA0
	movl	$500, -20(%rbp)         # imm = 0x1F4
	movl	$800, -24(%rbp)         # imm = 0x320
	movl	-12(%rbp), %eax
	movl	-16(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -8(%rbp)
	movl	-20(%rbp), %eax
	movl	-24(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	movl	-8(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -28(%rbp)
	movl	-20(%rbp), %eax
	movl	-4(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	movl	-24(%rbp), %ecx
	addl	%ecx, %eax
	movl	-8(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -16(%rbp)
	movl	-28(%rbp), %eax
	movl	-12(%rbp), %ecx
	addl	%ecx, %eax
	movl	%eax, -4(%rbp)
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
	movl	$0, -8(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$2, -8(%rbp)
	jge	.LBB1_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	target
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Leh_func_end1:
.Ltmp9:
	.seh_endproc


