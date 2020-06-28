
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
	addiu	$3,$6,1
	lw	$2,16($sp)
	bltz	$3,$L56
	addiu	$8,$6,-1

	bltz	$6,$L57
	nop

	bltz	$8,$L58
	addiu	$9,$5,-1

	bltz	$9,$L59
	nop

	teq	$7,$0,7
	divu	$0,$9,$7
	mfhi	$9
$L60:
	teq	$2,$0,7
	divu	$0,$6,$2
	mfhi	$11
	teq	$2,$0,7
	divu	$0,$8,$2
	addu	$10,$4,$11
	mfhi	$8
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$13
	mul	$9,$9,$2
	addu	$6,$4,$13
	addu	$12,$4,$9
	addu	$10,$10,$9
	addu	$12,$12,$8
	addu	$9,$6,$9
	lbu	$10,0($10)
	lbu	$12,0($12)
	lbu	$3,0($9)
	sltu	$10,$0,$10
	sltu	$12,$0,$12
	addu	$10,$10,$12
	sltu	$3,$0,$3
	bltz	$5,$L61
	addu	$10,$3,$10

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$9
$L62:
	mul	$3,$9,$2
	addiu	$5,$5,1
	addu	$9,$3,$4
	addu	$3,$9,$8
	addu	$9,$9,$13
	lbu	$3,0($3)
	lbu	$9,0($9)
	sltu	$3,$0,$3
	addu	$3,$3,$10
	sltu	$9,$0,$9
	bltz	$5,$L113
	addu	$9,$9,$3

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
	mul	$2,$7,$2
	addu	$4,$4,$2
	addu	$2,$6,$2
	addu	$8,$4,$8
	addu	$6,$4,$11
	lbu	$2,0($2)
	lbu	$4,0($8)
	lbu	$3,0($6)
	sltu	$2,$0,$2
	sltu	$4,$0,$4
	addu	$4,$4,$9
	sltu	$3,$0,$3
	addu	$3,$3,$4
	jr	$31
	addu	$2,$2,$3

$L56:
	bltz	$6,$L85
	addiu	$3,$5,-1

	bltz	$8,$L86
	nop

	bltz	$3,$L114
	nop

	teq	$7,$0,7
	divu	$0,$3,$7
	mfhi	$3
$L88:
	teq	$2,$0,7
	divu	$0,$8,$2
	addiu	$9,$2,-1
	mfhi	$10
	teq	$2,$0,7
	divu	$0,$6,$2
	addu	$13,$4,$10
	mfhi	$11
	mul	$3,$3,$2
	addu	$6,$4,$3
	addu	$3,$13,$3
	addu	$12,$6,$11
	addu	$6,$6,$9
	lbu	$8,0($3)
	lbu	$12,0($12)
	lbu	$3,0($6)
	sltu	$8,$0,$8
	sltu	$6,$0,$12
	addu	$8,$8,$6
	sltu	$3,$0,$3
	bltz	$5,$L115
	addu	$8,$3,$8

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$6
$L90:
	mul	$6,$6,$2
	addu	$12,$4,$9
	addiu	$5,$5,1
	addu	$3,$13,$6
	addu	$6,$12,$6
	lbu	$3,0($3)
	lbu	$6,0($6)
	sltu	$3,$0,$3
	addu	$3,$3,$8
	sltu	$6,$0,$6
	bltz	$5,$L91
	addu	$6,$6,$3

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L92:
	mul	$3,$7,$2
	addu	$2,$3,$4
	addu	$8,$2,$10
	addu	$11,$2,$11
	addu	$2,$2,$9
	lbu	$4,0($8)
	lbu	$3,0($11)
	lbu	$2,0($2)
	sltu	$4,$0,$4
	addu	$4,$4,$6
	sltu	$3,$0,$3
	addu	$3,$3,$4
	sltu	$2,$0,$2
	jr	$31
	addu	$2,$2,$3

$L58:
	addiu	$8,$5,-1
	bltz	$8,$L116
	nop

	teq	$7,$0,7
	divu	$0,$8,$7
	mfhi	$8
$L67:
	teq	$2,$0,7
	divu	$0,$6,$2
	addiu	$10,$2,-1
	addu	$12,$4,$10
	mfhi	$9
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$11
	mul	$3,$8,$2
	addu	$6,$4,$3
	addu	$3,$12,$3
	addu	$13,$6,$9
	addu	$6,$6,$11
	lbu	$8,0($3)
	lbu	$13,0($13)
	lbu	$3,0($6)
	sltu	$8,$0,$8
	sltu	$6,$0,$13
	addu	$8,$8,$6
	sltu	$3,$0,$3
	bltz	$5,$L117
	addu	$8,$3,$8

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$3
$L69:
	mul	$3,$3,$2
	addu	$6,$4,$11
	addiu	$5,$5,1
	addu	$12,$12,$3
	addu	$6,$6,$3
	lbu	$3,0($12)
	lbu	$6,0($6)
	sltu	$3,$0,$3
	addu	$3,$3,$8
	sltu	$6,$0,$6
	bltz	$5,$L70
	addu	$6,$6,$3

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L71:
	mul	$3,$7,$2
	addu	$2,$3,$4
	addu	$10,$2,$10
	addu	$9,$2,$9
	addu	$2,$2,$11
	lbu	$4,0($10)
	lbu	$3,0($9)
	lbu	$2,0($2)
	sltu	$4,$0,$4
	addu	$4,$4,$6
	sltu	$3,$0,$3
	addu	$3,$3,$4
	sltu	$2,$0,$2
	jr	$31
	addu	$2,$2,$3

$L85:
	bltz	$8,$L99
	nop

	bltz	$3,$L100
	nop

	teq	$7,$0,7
	divu	$0,$3,$7
	mfhi	$3
$L101:
	teq	$2,$0,7
	divu	$0,$8,$2
	addiu	$10,$2,-1
	mfhi	$9
	mul	$3,$3,$2
	addu	$8,$4,$9
	addu	$11,$3,$10
	addu	$3,$8,$3
	addu	$11,$4,$11
	lbu	$6,0($3)
	lbu	$3,0($11)
	sltu	$6,$0,$6
	sltu	$3,$0,$3
	addu	$6,$6,$3
	bltz	$5,$L102
	addu	$3,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$6
$L103:
	mul	$6,$6,$2
	addu	$11,$4,$10
	addiu	$5,$5,1
	addu	$8,$8,$6
	addu	$6,$11,$6
	lbu	$8,0($8)
	lbu	$6,0($6)
	sltu	$8,$0,$8
	addu	$8,$8,$3
	sltu	$3,$0,$6
	bltz	$5,$L118
	addu	$6,$3,$8

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L105:
	mul	$2,$7,$2
	addu	$8,$4,$2
	addu	$2,$2,$10
	addu	$8,$8,$9
	addu	$4,$4,$2
	lbu	$3,0($8)
	lbu	$2,0($4)
	sltu	$3,$0,$3
	addu	$3,$3,$6
	sltu	$2,$0,$2
	addu	$3,$2,$3
	jr	$31
	addu	$2,$2,$3

$L57:
	bltz	$8,$L72
	addiu	$6,$5,-1

	bltz	$6,$L119
	nop

	teq	$7,$0,7
	divu	$0,$6,$7
	mfhi	$6
$L74:
	teq	$2,$0,7
	divu	$0,$8,$2
	addiu	$9,$2,-1
	mfhi	$10
	teq	$2,$0,7
	divu	$0,$3,$2
	addu	$13,$4,$10
	mfhi	$11
	mul	$3,$6,$2
	addu	$6,$4,$3
	addu	$3,$13,$3
	addu	$12,$6,$9
	addu	$6,$6,$11
	lbu	$8,0($3)
	lbu	$12,0($12)
	lbu	$3,0($6)
	sltu	$8,$0,$8
	sltu	$6,$0,$12
	addu	$8,$8,$6
	sltu	$3,$0,$3
	bltz	$5,$L120
	addu	$8,$3,$8

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$6
$L76:
	mul	$6,$6,$2
	addu	$12,$4,$11
	addiu	$5,$5,1
	addu	$3,$13,$6
	addu	$6,$12,$6
	lbu	$3,0($3)
	lbu	$6,0($6)
	sltu	$3,$0,$3
	addu	$3,$3,$8
	sltu	$6,$0,$6
	bltz	$5,$L77
	addu	$6,$6,$3

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L78:
	mul	$3,$7,$2
	addu	$2,$3,$4
	addu	$8,$2,$10
	addu	$9,$2,$9
	addu	$2,$2,$11
	lbu	$4,0($8)
	lbu	$3,0($9)
	lbu	$2,0($2)
	sltu	$4,$0,$4
	addu	$4,$4,$6
	sltu	$3,$0,$3
	addu	$3,$3,$4
	sltu	$2,$0,$2
	jr	$31
	addu	$2,$2,$3

$L113:
	addiu	$7,$7,-1
	mul	$2,$7,$2
	addu	$4,$4,$2
	addu	$2,$6,$2
	addu	$8,$4,$8
	addu	$6,$4,$11
	lbu	$2,0($2)
	lbu	$4,0($8)
	lbu	$3,0($6)
	sltu	$2,$0,$2
	sltu	$4,$0,$4
	addu	$4,$4,$9
	sltu	$3,$0,$3
	addu	$3,$3,$4
	jr	$31
	addu	$2,$2,$3

$L61:
	b	$L62
	addiu	$9,$7,-1

$L59:
	b	$L60
	addiu	$9,$7,-1

$L86:
	bltz	$3,$L93
	nop

	teq	$7,$0,7
	divu	$0,$3,$7
	mfhi	$3
$L94:
	teq	$2,$0,7
	divu	$0,$6,$2
	addiu	$8,$2,-1
	addu	$10,$4,$8
	mfhi	$9
	mul	$3,$3,$2
	addu	$6,$4,$3
	addu	$3,$10,$3
	addu	$6,$6,$9
	lbu	$3,0($3)
	lbu	$6,0($6)
	sltu	$3,$0,$3
	sltu	$6,$0,$6
	addu	$6,$6,$3
	bltz	$5,$L95
	addu	$6,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$3
$L96:
	mul	$11,$3,$2
	addiu	$5,$5,1
	addu	$3,$11,$10
	lbu	$3,0($3)
	sltu	$3,$0,$3
	addu	$6,$6,$3
	bltz	$5,$L121
	addu	$3,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L98:
	mul	$5,$7,$2
	addu	$2,$5,$4
	addu	$8,$2,$8
	addu	$4,$2,$9
	lbu	$2,0($8)
	lbu	$4,0($4)
	sltu	$2,$0,$2
	addu	$3,$2,$3
	sltu	$4,$0,$4
	addu	$3,$4,$3
	jr	$31
	addu	$2,$2,$3

$L72:
	bltz	$6,$L79
	nop

	teq	$7,$0,7
	divu	$0,$6,$7
	mfhi	$6
$L80:
	teq	$2,$0,7
	divu	$0,$3,$2
	addiu	$9,$2,-1
	addu	$11,$4,$9
	mfhi	$10
	mul	$3,$6,$2
	addu	$6,$11,$3
	addu	$3,$4,$3
	addu	$3,$3,$10
	lbu	$8,0($6)
	lbu	$6,0($3)
	sltu	$8,$0,$8
	sll	$8,$8,1
	sltu	$6,$0,$6
	bltz	$5,$L81
	addu	$8,$6,$8

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$3
$L82:
	mul	$3,$3,$2
	addu	$6,$4,$10
	addiu	$5,$5,1
	addu	$11,$11,$3
	addu	$3,$6,$3
	lbu	$6,0($11)
	lbu	$3,0($3)
	sltu	$6,$0,$6
	addu	$6,$6,$8
	sltu	$3,$0,$3
	bltz	$5,$L122
	addu	$3,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L84:
	mul	$5,$7,$2
	addu	$2,$5,$4
	addu	$9,$2,$9
	addu	$2,$2,$10
	lbu	$4,0($9)
	lbu	$2,0($2)
	sltu	$4,$0,$4
	addu	$3,$4,$3
	sltu	$2,$0,$2
	addu	$3,$3,$4
	jr	$31
	addu	$2,$2,$3

$L79:
	b	$L80
	addiu	$6,$7,-1

$L100:
	b	$L101
	addiu	$3,$7,-1

$L93:
	b	$L94
	addiu	$3,$7,-1

$L114:
	b	$L88
	addiu	$3,$7,-1

$L77:
	b	$L78
	addiu	$7,$7,-1

$L120:
	b	$L76
	addiu	$6,$7,-1

$L119:
	b	$L74
	addiu	$6,$7,-1

$L70:
	b	$L71
	addiu	$7,$7,-1

$L117:
	b	$L69
	addiu	$3,$7,-1

$L116:
	b	$L67
	addiu	$8,$7,-1

$L91:
	b	$L92
	addiu	$7,$7,-1

$L115:
	b	$L90
	addiu	$6,$7,-1

$L99:
	bltz	$3,$L123
	nop

	teq	$7,$0,7
	divu	$0,$3,$7
	mfhi	$3
$L107:
	addiu	$6,$2,-1
	addu	$4,$4,$6
	mul	$6,$3,$2
	addu	$3,$6,$4
	lbu	$3,0($3)
	sltu	$3,$0,$3
	sll	$6,$3,1
	bltz	$5,$L124
	addu	$6,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$3
$L109:
	mul	$8,$3,$2
	addiu	$5,$5,1
	addu	$3,$8,$4
	lbu	$3,0($3)
	sltu	$3,$0,$3
	addu	$6,$6,$3
	bltz	$5,$L110
	addu	$3,$3,$6

	teq	$7,$0,7
	divu	$0,$5,$7
	mfhi	$7
$L111:
	mul	$5,$7,$2
	addu	$7,$5,$4
	lbu	$2,0($7)
	sltu	$2,$0,$2
	addu	$3,$2,$3
	addu	$3,$3,$2
	jr	$31
	addu	$2,$2,$3

$L121:
	b	$L98
	addiu	$7,$7,-1

$L95:
	b	$L96
	addiu	$3,$7,-1

$L118:
	b	$L105
	addiu	$7,$7,-1

$L102:
	b	$L103
	addiu	$6,$7,-1

$L122:
	b	$L84
	addiu	$7,$7,-1

$L81:
	b	$L82
	addiu	$3,$7,-1

$L110:
	b	$L111
	addiu	$7,$7,-1

$L124:
	b	$L109
	addiu	$3,$7,-1

$L123:
	b	$L107
	addiu	$3,$7,-1

	.set	macro
	.set	reorder
	.end	vecinos