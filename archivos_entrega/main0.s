	.globl	vecinos
	.set	nomips16
	.set	nomicromips
	.ent	vecinos
	.type	vecinos, @function
vecinos:
	.frame	$fp,40,$31		# vars= 24, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	sw	$7,52($fp)
	sw	$0,8($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,12($fp)
	b	$L21
	nop

$L32:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,16($fp)
	b	$L22
	nop

$L31:
	lw	$3,44($fp)
	lw	$2,12($fp)
	addu	$2,$3,$2 #_x x + i
	sw	$2,20($fp)
	lw	$2,20($fp)
	bgez	$2,$L23
	nop

	lw	$2,52($fp)
	addiu	$2,$2,-1
	b	$L24
	nop

$L23:
	lw	$3,20($fp)
	lw	$2,52($fp)
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$2
$L24:
	sw	$2,20($fp)
	lw	$3,48($fp)
	lw	$2,16($fp)
	addu	$2,$3,$2
	sw	$2,24($fp)
	lw	$2,24($fp)
	bgez	$2,$L25
	nop

	lw	$2,56($fp)
	addiu	$2,$2,-1
	b	$L26
	nop

$L25:
	lw	$3,24($fp)
	lw	$2,56($fp)
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$2
$L26:
	sw	$2,24($fp)
	lw	$3,20($fp)
	lw	$2,56($fp)
	mul	$3,$3,$2
	lw	$2,24($fp)
	addu	$2,$3,$2
	sw	$2,28($fp)
	lw	$2,12($fp)
	bne	$2,$0,$L27
	nop

	lw	$2,16($fp)
	beq	$2,$0,$L28
	nop

$L27:
	lw	$3,40($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	beq	$2,$0,$L29
	nop

	li	$2,1			# 0x1
	b	$L30
	nop

$L29:
	move	$2,$0
$L30:
	lw	$3,8($fp)
	addu	$2,$3,$2
	sw	$2,8($fp)
$L28:
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
$L22:
	lw	$2,16($fp)
	slt	$2,$2,2
	bne	$2,$0,$L31
	nop

	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L21:
	lw	$2,12($fp)
	slt	$2,$2,2
	bne	$2,$0,$L32
	nop

	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vecinos