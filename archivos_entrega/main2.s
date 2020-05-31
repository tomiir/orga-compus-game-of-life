
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
	addiu	$6,$6,-1
	addiu	$15,$7,-1
	addiu	$14,$10,-1
	li	$13,2			# 0x2
$L30:
	move	$8,$6
	bltz	$5,$L43
	move	$9,$0

$L31:
	teq	$7,$0,7
	divu	$0,$5,$7
	bltz	$8,$L44
	mfhi	$3

$L33:
	teq	$10,$0,7
	divu	$0,$8,$10
	mfhi	$12
$L34:
	mul	$24,$3,$10
	addiu	$8,$8,1
	beq	$11,$0,$L45
	addu	$3,$24,$12

$L35:
	addu	$3,$4,$3
	lbu	$3,0($3)
	sltu	$3,$0,$3
	beq	$9,$13,$L46
	addu	$2,$2,$3

	addiu	$9,$9,1
$L47:
	bgez	$5,$L31
	nop

$L43:
	bgez	$8,$L33
	move	$3,$15

$L44:
	b	$L34
	move	$12,$14

$L46:
	addiu	$11,$11,1
	bne	$11,$9,$L30
	addiu	$5,$5,1

	jr	$31
	nop

$L45:
	addiu	$12,$9,-1
	bne	$12,$0,$L35
	nop

	b	$L47
	addiu	$9,$9,1

	.set	macro
	.set	reorder
	.end	vecinos