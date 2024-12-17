	.arch armv8.2-a+crypto+crc
	.file	"t0sh.c"
	.text
	.align	2
	.global	perm
	.type	perm, %function
perm:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 16]
	cmp	x1, x0
	bge	.L2
	mov	x0, 0
	b	.L3
.L2:
	ldr	x0, [sp, 16]
	cmp	x0, 0
	bne	.L4
	mov	x0, 1
	b	.L3
.L4:
	ldr	x0, [sp, 24]
	sub	x2, x0, #1
	ldr	x0, [sp, 16]
	sub	x0, x0, #1
	mov	x1, x0
	mov	x0, x2
	bl	perm
	str	x0, [sp, 40]
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 40]
	mul	x0, x1, x0
.L3:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	perm, .-perm
	.ident	"GCC: (GNU) 11.4.1 20230605 (Red Hat 11.4.1-2)"
	.section	.note.GNU-stack,"",@progbits
