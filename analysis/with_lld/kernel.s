	.text
	.file	"kernel.cpp"
	.globl	_ZN5rkern7utility6string6lengthEPKc # -- Begin function _ZN5rkern7utility6string6lengthEPKc
	.p2align	4, 0x90
	.type	_ZN5rkern7utility6string6lengthEPKc,@function
_ZN5rkern7utility6string6lengthEPKc:    # @_ZN5rkern7utility6string6lengthEPKc
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ecx
	cmpb	$0, (%eax,%ecx)
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	.LBB0_1
.LBB0_3:
	movl	-4(%ebp), %eax
	addl	$4, %esp
	popl	%ebp
	retl
.Lfunc_end0:
	.size	_ZN5rkern7utility6string6lengthEPKc, .Lfunc_end0-_ZN5rkern7utility6string6lengthEPKc
                                        # -- End function
	.globl	_ZN5rkern8TerminalC2Ev  # -- Begin function _ZN5rkern8TerminalC2Ev
	.p2align	4, 0x90
	.type	_ZN5rkern8TerminalC2Ev,@function
_ZN5rkern8TerminalC2Ev:                 # @_ZN5rkern8TerminalC2Ev
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$32, %esp
	movl	8(%ebp), %eax
	xorl	%ecx, %ecx
	movl	8(%ebp), %edx
	movl	$0, (%edx)
	movl	$0, 4(%edx)
	movl	$7, (%esp)
	movl	$0, 4(%esp)
	movl	%eax, -20(%ebp)         # 4-byte Spill
	movl	%ecx, -24(%ebp)         # 4-byte Spill
	movl	%edx, -28(%ebp)         # 4-byte Spill
	calll	_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_
	movl	-28(%ebp), %ecx         # 4-byte Reload
	movl	%eax, 8(%ecx)
	movl	$753664, %eax           # imm = 0xB8000
	movl	%eax, 12(%ecx)
	movl	$0, -8(%ebp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	cmpl	$25, -8(%ebp)
	jae	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -12(%ebp)
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$80, -12(%ebp)
	jae	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	imull	$80, -8(%ebp), %eax
	addl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-28(%ebp), %eax         # 4-byte Reload
	movl	8(%eax), %ecx
	movl	$32, (%esp)
	movl	%ecx, 4(%esp)
	calll	_ZN5rkern3vgaL5entryEhj
	movl	-28(%ebp), %ecx         # 4-byte Reload
	movl	12(%ecx), %edx
	movl	-16(%ebp), %esi
	movl	%eax, (%edx,%esi,4)
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	.LBB1_3
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.LBB1_1
.LBB1_8:
	addl	$32, %esp
	popl	%esi
	popl	%ebp
	retl
.Lfunc_end1:
	.size	_ZN5rkern8TerminalC2Ev, .Lfunc_end1-_ZN5rkern8TerminalC2Ev
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function _ZN5rkern3vgaL11entry_colorENS0_5ColorES1_
	.type	_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_,@function
_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_: # @_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	12(%ebp), %esi
	shll	$4, %esi
	orl	%esi, %edx
	movl	%eax, -8(%ebp)          # 4-byte Spill
	movl	%edx, %eax
	addl	$4, %esp
	popl	%esi
	popl	%ebp
	retl
.Lfunc_end2:
	.size	_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_, .Lfunc_end2-_ZN5rkern3vgaL11entry_colorENS0_5ColorES1_
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function _ZN5rkern3vgaL5entryEhj
	.type	_ZN5rkern3vgaL5entryEhj,@function
_ZN5rkern3vgaL5entryEhj:                # @_ZN5rkern3vgaL5entryEhj
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%eax
	movl	12(%ebp), %eax
	movb	8(%ebp), %cl
	movzbl	8(%ebp), %edx
	movl	12(%ebp), %esi
	shll	$8, %esi
	orl	%esi, %edx
	movl	%eax, -8(%ebp)          # 4-byte Spill
	movl	%edx, %eax
	addl	$4, %esp
	popl	%esi
	popl	%ebp
	retl
.Lfunc_end3:
	.size	_ZN5rkern3vgaL5entryEhj, .Lfunc_end3-_ZN5rkern3vgaL5entryEhj
                                        # -- End function
	.globl	_ZN5rkern8Terminal5writeEPKcj # -- Begin function _ZN5rkern8Terminal5writeEPKcj
	.p2align	4, 0x90
	.type	_ZN5rkern8Terminal5writeEPKcj,@function
_ZN5rkern8Terminal5writeEPKcj:          # @_ZN5rkern8Terminal5writeEPKcj
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$16, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	8(%ebp), %esi
	movl	$0, -8(%ebp)
	movl	%esi, -12(%ebp)         # 4-byte Spill
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jae	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movl	12(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	-12(%ebp), %edx         # 4-byte Reload
	movl	%edx, (%esp)
	movsbl	(%eax,%ecx), %eax
	movl	%eax, 4(%esp)
	calll	_ZN5rkern8Terminal8put_charEc
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.LBB4_1
.LBB4_4:
	addl	$16, %esp
	popl	%esi
	popl	%ebp
	retl
.Lfunc_end4:
	.size	_ZN5rkern8Terminal5writeEPKcj, .Lfunc_end4-_ZN5rkern8Terminal5writeEPKcj
                                        # -- End function
	.section	.text._ZN5rkern8Terminal8put_charEc,"axG",@progbits,_ZN5rkern8Terminal8put_charEc,comdat
	.weak	_ZN5rkern8Terminal8put_charEc # -- Begin function _ZN5rkern8Terminal8put_charEc
	.p2align	4, 0x90
	.type	_ZN5rkern8Terminal8put_charEc,@function
_ZN5rkern8Terminal8put_charEc:          # @_ZN5rkern8Terminal8put_charEc
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movb	12(%ebp), %al
	movl	8(%ebp), %ecx
	movl	8(%ebp), %edx
	movb	12(%ebp), %ah
	movl	8(%edx), %esi
	movl	4(%edx), %edi
	movl	(%edx), %ebx
	movl	%edx, (%esp)
	movl	%ecx, -16(%ebp)         # 4-byte Spill
	movsbl	%ah, %ecx
	movl	%ecx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 16(%esp)
	movb	%al, -17(%ebp)          # 1-byte Spill
	movl	%edx, -24(%ebp)         # 4-byte Spill
	calll	_ZN5rkern8Terminal12put_entry_atEcjjj
	movl	-24(%ebp), %ecx         # 4-byte Reload
	movl	4(%ecx), %edx
	addl	$1, %edx
	movl	%edx, 4(%ecx)
	cmpl	$80, %edx
	jne	.LBB5_4
# %bb.1:
	movl	-24(%ebp), %eax         # 4-byte Reload
	movl	$0, 4(%eax)
	movl	(%eax), %ecx
	addl	$1, %ecx
	movl	%ecx, (%eax)
	cmpl	$25, %ecx
	jne	.LBB5_3
# %bb.2:
	movl	-24(%ebp), %eax         # 4-byte Reload
	movl	$0, (%eax)
.LBB5_3:
	jmp	.LBB5_4
.LBB5_4:
	addl	$32, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Lfunc_end5:
	.size	_ZN5rkern8Terminal8put_charEc, .Lfunc_end5-_ZN5rkern8Terminal8put_charEc
                                        # -- End function
	.text
	.globl	kernel_main             # -- Begin function kernel_main
	.p2align	4, 0x90
	.type	kernel_main,@function
kernel_main:                            # @kernel_main
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$24, %esp
	leal	8(%esp), %eax
	movl	%eax, (%esp)
	calll	_ZN5rkern8TerminalC1Ev
	leal	8(%esp), %eax
	movl	%eax, (%esp)
	leal	.L.str, %eax
	movl	%eax, 4(%esp)
	calll	_ZN5rkern8Terminal12write_stringEPKc
	movl	%ebp, %esp
	popl	%ebp
	retl
.Lfunc_end6:
	.size	kernel_main, .Lfunc_end6-kernel_main
                                        # -- End function
	.section	.text._ZN5rkern8Terminal12write_stringEPKc,"axG",@progbits,_ZN5rkern8Terminal12write_stringEPKc,comdat
	.weak	_ZN5rkern8Terminal12write_stringEPKc # -- Begin function _ZN5rkern8Terminal12write_stringEPKc
	.p2align	4, 0x90
	.type	_ZN5rkern8Terminal12write_stringEPKc,@function
_ZN5rkern8Terminal12write_stringEPKc:   # @_ZN5rkern8Terminal12write_stringEPKc
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	12(%ebp), %esi
	movl	12(%ebp), %edi
	movl	%edi, (%esp)
	movl	%eax, -12(%ebp)         # 4-byte Spill
	movl	%ecx, -16(%ebp)         # 4-byte Spill
	movl	%edx, -20(%ebp)         # 4-byte Spill
	movl	%esi, -24(%ebp)         # 4-byte Spill
	calll	_ZN5rkern7utility6string6lengthEPKc
	movl	-20(%ebp), %ecx         # 4-byte Reload
	movl	%ecx, (%esp)
	movl	-24(%ebp), %ecx         # 4-byte Reload
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ZN5rkern8Terminal5writeEPKcj
	addl	$28, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
.Lfunc_end7:
	.size	_ZN5rkern8Terminal12write_stringEPKc, .Lfunc_end7-_ZN5rkern8Terminal12write_stringEPKc
                                        # -- End function
	.section	.text._ZN5rkern8Terminal12put_entry_atEcjjj,"axG",@progbits,_ZN5rkern8Terminal12put_entry_atEcjjj,comdat
	.weak	_ZN5rkern8Terminal12put_entry_atEcjjj # -- Begin function _ZN5rkern8Terminal12put_entry_atEcjjj
	.p2align	4, 0x90
	.type	_ZN5rkern8Terminal12put_entry_atEcjjj,@function
_ZN5rkern8Terminal12put_entry_atEcjjj:  # @_ZN5rkern8Terminal12put_entry_atEcjjj
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$40, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edx
	movb	12(%ebp), %bl
	movl	8(%ebp), %esi
	movl	8(%ebp), %edi
	movl	%eax, -20(%ebp)         # 4-byte Spill
	imull	$80, 24(%ebp), %eax
	addl	20(%ebp), %eax
	movl	%eax, -16(%ebp)
	movb	12(%ebp), %bh
	movl	16(%ebp), %eax
	movl	%eax, -24(%ebp)         # 4-byte Spill
	movzbl	%bh, %eax
	movl	%eax, (%esp)
	movl	-24(%ebp), %eax         # 4-byte Reload
	movl	%eax, 4(%esp)
	movl	%ecx, -28(%ebp)         # 4-byte Spill
	movl	%edx, -32(%ebp)         # 4-byte Spill
	movb	%bl, -33(%ebp)          # 1-byte Spill
	movl	%esi, -40(%ebp)         # 4-byte Spill
	movl	%edi, -44(%ebp)         # 4-byte Spill
	calll	_ZN5rkern3vgaL5entryEhj
	movl	-44(%ebp), %ecx         # 4-byte Reload
	movl	12(%ecx), %edx
	movl	-16(%ebp), %esi
	movl	%eax, (%edx,%esi,4)
	addl	$40, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
.Lfunc_end8:
	.size	_ZN5rkern8Terminal12put_entry_atEcjjj, .Lfunc_end8-_ZN5rkern8Terminal12put_entry_atEcjjj
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Hello, kernel World!\n"
	.size	.L.str, 22

	.globl	_ZN5rkern8TerminalC1Ev
	.type	_ZN5rkern8TerminalC1Ev,@function
.set _ZN5rkern8TerminalC1Ev, _ZN5rkern8TerminalC2Ev
	.ident	"clang version 10.0.1 (git@github.com:knejadfard/toolchain.git ab992f891ac641b046071fcb2401cd871e068494)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZN5rkern7utility6string6lengthEPKc
	.addrsig_sym _ZN5rkern3vgaL11entry_colorENS0_5ColorES1_
	.addrsig_sym _ZN5rkern3vgaL5entryEhj
	.addrsig_sym _ZN5rkern8Terminal5writeEPKcj
	.addrsig_sym _ZN5rkern8Terminal8put_charEc
	.addrsig_sym _ZN5rkern8Terminal12write_stringEPKc
	.addrsig_sym _ZN5rkern8Terminal12put_entry_atEcjjj
