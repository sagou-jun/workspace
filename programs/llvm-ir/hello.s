	.text
	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	main
	.align	16, 0x90
main:                                   # @main
.Ltmp0:
.seh_proc main
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp1:
	.seh_pushreg 5
	movq	%rsp, %rbp
	subq	$48, %rsp
.Ltmp2:
	.seh_setframe 5, 0
.Ltmp3:
	.seh_endprologue
	callq	__main
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$100, -8(%rbp)
	jge	.LBB0_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str, %eax
	movl	%eax, %ecx
	callq	printf
	movl	%eax, -12(%rbp)         # 4-byte Spill
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:                                # %for.end
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Leh_func_end0:
.Ltmp4:
	.seh_endproc

	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	"Hello!!\n"


