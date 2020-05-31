	.globl	vecinos
	.set	nomips16
	.set	nomicromips
	.ent	vecinos
	.type	vecinos, @function
vecinos:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lw	$10,16($sp)
	addiu	$5,$5,-1
	li	$11,-1			# 0xffffffffffffffff
	move	$2,$0
	addiu	$15,$7,-1
	addiu	$14,$10,-1
	b	$L30
	li	$13,2			# 0x2

$L42:
	move	$12,$14
$L34:
	mul	$24,$3,$10
	beq	$11,$0,$L39
	addu	$3,$24,$12

	addu	$3,$4,$3
$L44:
	lbu	$3,0($3)
	sltu	$3,$0,$3
	addu	$2,$2,$3
	slt	$3,$9,2
	beq	$3,$0,$L40
	addiu	$9,$9,1

$L43:
	addiu	$8,$8,1
$L38:
	bltz	$5,$L32
	move	$3,$15

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$3
$L32:
	bltz	$8,$L42
	nop

	teq	$10,$0,7
	divu	$0,$8,$10
	b	$L34
	mfhi	$12

$L39:
	addiu	$12,$9,-1
	bne	$12,$0,$L44
	addu	$3,$4,$3

	b	$L43
	addiu	$9,$9,1

$L40:
	addiu	$11,$11,1
	beq	$11,$13,$L45
	addiu	$5,$5,1

$L30:
	addiu	$8,$6,-1
	b	$L38
	move	$9,$0

$L45:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vecinos