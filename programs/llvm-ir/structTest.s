	.text
	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"structTest.ll"
	.text
	.globl	main
	.align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,24,$ra
	.mask 	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:                                 # %entry
	addiu	$sp, $sp, -24
$tmp0:
	.cfi_def_cfa_offset 24
	sw	$fp, 20($sp)            # 4-byte Folded Spill
$tmp1:
	.cfi_offset 30, -4
	move	 $fp, $sp
$tmp2:
	.cfi_def_cfa_register 30
	sw	$zero, 16($fp)
	addiu	$1, $zero, 1
	sw	$1, 0($fp)
	addiu	$1, $zero, 97
	sb	$1, 4($fp)
	lui	$1, 47185
	ori	$1, $1, 60293
	sw	$1, 12($fp)
	lui	$1, 16373
	ori	$1, $1, 34078
	sw	$1, 8($fp)
	addiu	$2, $zero, 0
	move	 $sp, $fp
	lw	$fp, 20($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	main
$tmp3:
	.size	main, ($tmp3)-main
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
	.text
