	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	crear_mapa
	.set	nomips16
	.set	nomicromips
	.ent	crear_mapa
	.type	crear_mapa, @function
crear_mapa:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jr	$25
	nop

	.set	macro
	.set	reorder
	.end	crear_mapa
	.size	crear_mapa, .-crear_mapa
	.align	2
	.globl	es_numerico
	.set	nomips16
	.set	nomicromips
	.ent	es_numerico
	.type	es_numerico, @function
es_numerico:
	.frame	$sp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	lw	$25,%call16(strlen)($28)
	.cprestore	16
	sw	$16,28($sp)
	move	$16,$4
	sw	$31,36($sp)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	sw	$17,32($sp)

	beq	$2,$0,$L5
	lw	$28,16($sp)

	lw	$25,%call16(__ctype_b_loc)($28)
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	move	$17,$2

	move	$4,$16
	lw	$5,0($2)
	b	$L4
	addu	$2,$16,$17

$L10:
	beq	$2,$4,$L11
	lw	$31,36($sp)

$L4:
	lb	$3,0($4)
	sll	$3,$3,1
	addu	$3,$5,$3
	lhu	$3,0($3)
	andi	$3,$3,0x8
	bne	$3,$0,$L10
	addiu	$4,$4,1

	lw	$31,36($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,40

$L5:
	lw	$31,36($sp)
$L11:
	move	$2,$0
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	es_numerico
	.size	es_numerico, .-es_numerico
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"r\000"
	.align	2
$LC1:
	.ascii	" \000"
	.align	2
$LC2:
	.ascii	"\012\000"
	.align	2
$LC3:
	.ascii	"Error en el archivo de entrada. La celda [%s, %s] contie"
	.ascii	"ne caracteres no num\303\251ricos.\012\000"
	.align	2
$LC4:
	.ascii	"Error en el archivo de entrada. Celda [%d, %d] fuera del"
	.ascii	" mapa\012\000"
	.align	2
$LC5:
	.ascii	"Error abriendo el archivo de entrada\000"
	.text
	.align	2
	.globl	cargar_mapa
	.set	nomips16
	.set	nomicromips
	.ent	cargar_mapa
	.type	cargar_mapa, @function
cargar_mapa:
	.frame	$sp,320,$31		# vars= 256, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-320
	lw	$25,%call16(fopen)($28)
	sw	$22,304($sp)
	move	$22,$5
	.cprestore	16
	sw	$18,288($sp)
	move	$18,$6
	sw	$4,320($sp)
	move	$4,$7
	sw	$31,316($sp)
	sw	$fp,312($sp)
	sw	$23,308($sp)
	sw	$21,300($sp)
	sw	$20,296($sp)
	sw	$19,292($sp)
	sw	$17,284($sp)
	sw	$16,280($sp)
	lw	$5,%got($LC0)($28)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	addiu	$5,$5,%lo($LC0)

	beq	$2,$0,$L47
	lw	$28,16($sp)

	lw	$25,%call16(fgets)($28)
	addiu	$23,$sp,24
	lw	$20,%got($LC1)($28)
	move	$21,$2
	lw	$19,%got($LC2)($28)
	li	$5,256			# 0x100
	move	$6,$21
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	move	$4,$23

	addiu	$20,$20,%lo($LC1)
	addiu	$19,$19,%lo($LC2)
	beq	$2,$0,$L48
	lw	$28,16($sp)

$L23:
	lw	$25,%call16(strtok)($28)
	move	$5,$20
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	move	$4,$23

	move	$4,$0
	lw	$28,16($sp)
	move	$5,$19
	lw	$25,%call16(strtok)($28)
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	move	$16,$2

	move	$4,$16
	lw	$28,16($sp)
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	move	$17,$2

	lw	$28,16($sp)
	beq	$2,$0,$L15
	move	$fp,$2

	lw	$25,%call16(__ctype_b_loc)($28)
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	nop

	addu	$5,$16,$fp
	lw	$28,16($sp)
	move	$4,$16
	b	$L17
	lw	$2,0($2)

$L49:
	beq	$5,$4,$L53
	lw	$25,%call16(strlen)($28)

$L17:
	lb	$3,0($4)
	sll	$3,$3,1
	addu	$3,$2,$3
	lhu	$3,0($3)
	andi	$3,$3,0x8
	bne	$3,$0,$L49
	addiu	$4,$4,1

	lw	$2,%got(stderr)($28)
$L51:
	move	$7,$17
	lw	$5,%got($LC3)($28)
	move	$6,$16
	lw	$25,%call16(fprintf)($28)
	lw	$4,0($2)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$5,$5,%lo($LC3)

	lw	$31,316($sp)
$L52:
	li	$2,-1			# 0xffffffffffffffff
	lw	$fp,312($sp)
	lw	$23,308($sp)
	lw	$22,304($sp)
	lw	$21,300($sp)
	lw	$20,296($sp)
	lw	$19,292($sp)
	lw	$18,288($sp)
	lw	$17,284($sp)
	lw	$16,280($sp)
	jr	$31
	addiu	$sp,$sp,320

$L15:
	lw	$25,%call16(strlen)($28)
$L53:
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	move	$4,$17

	lw	$28,16($sp)
	beq	$2,$0,$L19
	move	$fp,$2

	lw	$25,%call16(__ctype_b_loc)($28)
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	nop

	move	$4,$17
	lw	$5,0($2)
	addu	$2,$17,$fp
	b	$L18
	lw	$28,16($sp)

$L50:
	beq	$2,$4,$L54
	lw	$25,%call16(strtol)($28)

$L18:
	lb	$3,0($4)
	sll	$3,$3,1
	addu	$3,$5,$3
	lhu	$3,0($3)
	andi	$3,$3,0x8
	bne	$3,$0,$L50
	addiu	$4,$4,1

	b	$L51
	lw	$2,%got(stderr)($28)

$L19:
	lw	$25,%call16(strtol)($28)
$L54:
	li	$6,10			# 0xa
	move	$5,$0
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$4,$16

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	move	$4,$17
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$16,$2

	bltz	$16,$L21
	lw	$28,16($sp)

	bltz	$2,$L21
	sltu	$3,$16,$22

	beq	$3,$0,$L21
	sltu	$3,$18,$2

	bne	$3,$0,$L21
	lw	$3,320($sp)

	li	$5,256			# 0x100
	lw	$25,%call16(fgets)($28)
	move	$6,$21
	move	$4,$23
	addu	$2,$3,$2
	mul	$3,$16,$18
	addu	$16,$3,$2
	li	$2,1			# 0x1
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	sb	$2,0($16)

	bne	$2,$0,$L23
	lw	$28,16($sp)

$L48:
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$21

	move	$2,$0
	lw	$31,316($sp)
	lw	$fp,312($sp)
	lw	$23,308($sp)
	lw	$22,304($sp)
	lw	$21,300($sp)
	lw	$20,296($sp)
	lw	$19,292($sp)
	lw	$18,288($sp)
	lw	$17,284($sp)
	lw	$16,280($sp)
	jr	$31
	addiu	$sp,$sp,320

$L21:
	move	$7,$2
	lw	$2,%got(stderr)($28)
	lw	$5,%got($LC4)($28)
	move	$6,$16
	lw	$25,%call16(fprintf)($28)
	lw	$4,0($2)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$5,$5,%lo($LC4)

	lw	$28,16($sp)
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$21

	b	$L52
	lw	$31,316($sp)

$L47:
	lw	$2,%got(stderr)($28)
	li	$6,36			# 0x24
	lw	$4,%got($LC5)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC5)

	b	$L52
	lw	$31,316($sp)

	.set	macro
	.set	reorder
	.end	cargar_mapa
	.size	cargar_mapa, .-cargar_mapa
	.align	2
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
	.size	vecinos, .-vecinos
	.align	2
	.globl	avanzar
	.set	nomips16
	.set	nomicromips
	.ent	avanzar
	.type	avanzar, @function
avanzar:
	.frame	$sp,72,$31		# vars= 8, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-72
	lw	$25,%call16(calloc)($28)
	sw	$19,44($sp)
	move	$19,$5
	.cprestore	16
	move	$5,$6
	sw	$16,32($sp)
	move	$16,$4
	sw	$6,24($sp)
	move	$4,$19
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$18,40($sp)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	sw	$17,36($sp)

	lw	$28,16($sp)
	lw	$6,24($sp)
	beq	$19,$0,$L141
	sw	$2,28($sp)

	beq	$6,$0,$L141
	move	$23,$2

	addiu	$2,$6,-1
	li	$13,-1			# 0xffffffffffffffff
	move	$21,$0
	sw	$2,24($sp)
	li	$24,-1			# 0xffffffffffffffff
	addiu	$fp,$19,-1
	move	$22,$16
$L139:
	move	$2,$21
	teq	$19,$0,7
	divu	$0,$2,$19
	addiu	$21,$21,1
	li	$7,-1			# 0xffffffffffffffff
	move	$3,$0
	move	$10,$22
	move	$11,$23
	mfhi	$2
	teq	$19,$0,7
	divu	$0,$21,$19
	mfhi	$14
	mul	$15,$2,$6
	mul	$14,$14,$6
	addu	$2,$16,$14
	lbu	$9,0($2)
$L142:
	beq	$13,$24,$L127
	nop

$L163:
	teq	$19,$0,7
	divu	$0,$13,$19
	beq	$7,$24,$L162
	mfhi	$2

$L129:
	teq	$6,$0,7
	divu	$0,$7,$6
	mfhi	$5
$L130:
	teq	$6,$0,7
	divu	$0,$3,$6
	lbu	$25,0($10)
	addiu	$3,$3,1
	addu	$4,$16,$5
	addiu	$11,$11,1
	addu	$12,$4,$15
	addu	$4,$4,$14
	lbu	$18,0($12)
	lbu	$17,0($4)
	mfhi	$8
	teq	$6,$0,7
	divu	$0,$3,$6
	mfhi	$12
	mul	$4,$2,$6
	addu	$2,$4,$16
	addu	$4,$16,$12
	addu	$8,$2,$8
	addu	$5,$2,$5
	addu	$2,$2,$12
	lbu	$8,0($8)
	addu	$20,$4,$15
	lbu	$5,0($5)
	addu	$4,$4,$14
	lbu	$2,0($2)
	sltu	$8,$0,$8
	lbu	$12,0($20)
	sltu	$5,$0,$5
	addu	$5,$8,$5
	addiu	$8,$5,1
	movn	$5,$8,$2
	addiu	$2,$5,1
	movn	$5,$2,$18
	addiu	$2,$5,1
	movn	$5,$2,$12
	addiu	$2,$5,1
	movn	$5,$2,$17
	addiu	$2,$5,1
	movn	$5,$2,$9
	lbu	$9,0($4)
	sltu	$2,$0,$9
	beq	$25,$0,$L136
	addu	$5,$2,$5

	addiu	$5,$5,-2
	addiu	$10,$10,1
	sltu	$2,$5,2
	sb	$2,-1($11)
	bne	$6,$3,$L142
	addiu	$7,$7,1

$L138:
	addiu	$13,$13,1
	addu	$23,$23,$6
	bne	$21,$19,$L139
	addu	$22,$22,$6

	mul	$6,$21,$6
	beq	$6,$0,$L141
	lw	$25,%call16(memcpy)($28)

	move	$4,$16
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	lw	$5,28($sp)

	lw	$28,16($sp)
$L141:
	lw	$4,28($sp)
	lw	$31,68($sp)
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jr	$25
	addiu	$sp,$sp,72

$L136:
	xori	$5,$5,0x3
	sltu	$2,$5,1
	sb	$2,-1($11)
	addiu	$10,$10,1
	beq	$6,$3,$L138
	addiu	$7,$7,1

	bne	$13,$24,$L163
	nop

$L127:
	bne	$7,$24,$L129
	move	$2,$fp

$L162:
	b	$L130
	lw	$5,24($sp)

	.set	macro
	.set	reorder
	.end	avanzar
	.size	avanzar, .-avanzar
	.section	.rodata.str1.4
	.align	2
$LC6:
	.ascii	"%d \000"
	.text
	.align	2
	.globl	dump
	.set	nomips16
	.set	nomicromips
	.ent	dump
	.type	dump, @function
dump:
	.frame	$sp,64,$31		# vars= 0, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-64
	.cprestore	16
	sw	$31,60($sp)
	sw	$fp,56($sp)
	sw	$23,52($sp)
	sw	$22,48($sp)
	sw	$21,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	beq	$5,$0,$L166
	sw	$16,24($sp)

	beq	$6,$0,$L166
	move	$19,$6

	lw	$18,%got($LC6)($28)
	move	$23,$0
	addiu	$21,$6,-1
	move	$fp,$5
	addiu	$18,$18,%lo($LC6)
	move	$20,$7
	move	$22,$4
$L169:
	move	$16,$0
	move	$17,$22
	lw	$25,%call16(printf)($28)
$L177:
	move	$4,$18
	lbu	$5,0($17)
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	addiu	$17,$17,1

	move	$5,$18
	lw	$28,16($sp)
	move	$4,$20
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	lbu	$6,-1($17)

	beq	$16,$21,$L176
	lw	$28,16($sp)

$L167:
	addiu	$16,$16,1
	bne	$16,$19,$L177
	lw	$25,%call16(printf)($28)

	addiu	$23,$23,1
	bne	$23,$fp,$L169
	addu	$22,$22,$19

$L166:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,10			# 0xa

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$31,60($sp)
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jr	$25
	addiu	$sp,$sp,64

$L176:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,10			# 0xa

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	move	$5,$20

	b	$L167
	lw	$28,16($sp)

	.set	macro
	.set	reorder
	.end	dump
	.size	dump, .-dump
	.section	.rodata.str1.4
	.align	2
$LC7:
	.ascii	"-V Da la version del programa. -o Prefijo de los archivo"
	.ascii	"s de salida.\012 Ejemplos:\012 conway 10 20 20 glider -o"
	.ascii	" estado\012 Representa 10 iteraciones del Juego de la Vi"
	.ascii	"da en una matriz de 20x20, con un estado inicial tomado "
	.ascii	"del archivo \342\200\230\342\200\230glider\342\200\231\342"
	.ascii	"\200\231. \012 Los archivos de salida se llamaran estado"
	.ascii	"_n.pbm.\012 Si no se da un prefijo para los archivos de "
	.ascii	"salida\012 El prefijo sera el nombre del archivo de entr"
	.ascii	"ada\000"
	.align	2
$LC8:
	.ascii	"Version 1.0.0\000"
	.align	2
$LC9:
	.ascii	"Parametros incorrectos, use -h o -v si usa un solo argum"
	.ascii	"ento.\012\000"
	.align	2
$LC10:
	.ascii	"hv\000"
	.align	2
$LC11:
	.ascii	"Argumentos insuficientes, usar flag -h para ver parament"
	.ascii	"ros obligatorios\012\000"
	.align	2
$LC12:
	.ascii	"Parametros incorrectos, las iteraciones y el tama\303\261"
	.ascii	"o de la matriz deben ser enteros positivos.\012\000"
	.text
	.align	2
	.globl	validar_datos
	.set	nomips16
	.set	nomicromips
	.ent	validar_datos
	.type	validar_datos, @function
validar_datos:
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	li	$3,2			# 0x2
	.cprestore	16
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	beq	$4,$3,$L206
	sw	$16,28($sp)

	slt	$2,$4,4
	bne	$2,$0,$L186
	addiu	$16,$5,4

	addiu	$17,$5,16
$L190:
	lw	$19,0($16)
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	move	$4,$19

	lw	$28,16($sp)
	beq	$2,$0,$L187
	move	$18,$2

	lw	$25,%call16(__ctype_b_loc)($28)
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	nop

	addu	$5,$19,$18
	lw	$28,16($sp)
	move	$4,$19
	b	$L189
	lw	$2,0($2)

$L207:
	beq	$5,$4,$L209
	lw	$25,%call16(strtol)($28)

$L189:
	lb	$3,0($4)
	sll	$3,$3,1
	addu	$3,$2,$3
	lhu	$3,0($3)
	andi	$3,$3,0x8
	bne	$3,$0,$L207
	addiu	$4,$4,1

$L188:
	lw	$2,%got(stderr)($28)
	li	$6,95			# 0x5f
	lw	$4,%got($LC12)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC12)

	li	$2,-1			# 0xffffffffffffffff
$L178:
	lw	$31,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,48

$L187:
	lw	$25,%call16(strtol)($28)
$L209:
	li	$6,10			# 0xa
	move	$5,$0
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$4,$19

	blez	$2,$L188
	lw	$28,16($sp)

	addiu	$16,$16,4
	bne	$17,$16,$L190
	lw	$31,44($sp)

	move	$2,$0
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,48

$L206:
	lw	$6,%got($LC10)($28)
	lw	$25,%call16(getopt)($28)
	.reloc	1f,R_MIPS_JALR,getopt
1:	jalr	$25
	addiu	$6,$6,%lo($LC10)

	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L186
	lw	$28,16($sp)

	li	$3,104			# 0x68
	beq	$2,$3,$L182
	li	$3,118			# 0x76

	bne	$2,$3,$L208
	li	$6,62			# 0x3e

	lw	$4,%got($LC8)($28)
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	addiu	$4,$4,%lo($LC8)

	b	$L178
	li	$2,-1			# 0xffffffffffffffff

$L208:
	lw	$2,%got(stderr)($28)
	lw	$4,%got($LC9)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC9)

	b	$L178
	li	$2,-1			# 0xffffffffffffffff

$L186:
	lw	$2,%got(stderr)($28)
	li	$6,73			# 0x49
	lw	$4,%got($LC11)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC11)

	b	$L178
	li	$2,-1			# 0xffffffffffffffff

$L182:
	lw	$4,%got($LC7)($28)
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	addiu	$4,$4,%lo($LC7)

	b	$L178
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	validar_datos
	.size	validar_datos, .-validar_datos
	.section	.rodata.str1.4
	.align	2
$LC13:
	.ascii	"_%d\000"
	.align	2
$LC14:
	.ascii	".pbm\000"
	.text
	.align	2
	.globl	set_filename
	.set	nomips16
	.set	nomicromips
	.ent	set_filename
	.type	set_filename, @function
set_filename:
	.frame	$sp,64,$31		# vars= 24, regs= 3/0, args= 16, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-64
	slt	$6,$6,7
	.cprestore	16
	sw	$17,56($sp)
	move	$17,$4
	sw	$31,60($sp)
	bne	$6,$0,$L211
	sw	$16,52($sp)

	lw	$2,20($5)
	li	$3,45			# 0x2d
	lbu	$6,0($2)
	bne	$6,$3,$L212
	li	$3,111			# 0x6f

	lbu	$6,1($2)
	bne	$6,$3,$L212
	nop

	lbu	$2,2($2)
	bne	$2,$0,$L212
	lw	$25,%call16(strcpy)($28)

	lw	$5,24($5)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	sw	$7,40($sp)

	lw	$28,16($sp)
	lw	$7,40($sp)
$L212:
	lw	$5,%got($LC13)($28)
	addiu	$16,$sp,24
	lw	$25,%call16(sprintf)($28)
	move	$6,$7
	move	$4,$16
	.reloc	1f,R_MIPS_JALR,sprintf
1:	jalr	$25
	addiu	$5,$5,%lo($LC13)

	lw	$28,16($sp)
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	move	$4,$17

	move	$5,$16
	lw	$28,16($sp)
	lw	$25,%call16(stpcpy)($28)
	.reloc	1f,R_MIPS_JALR,stpcpy
1:	jalr	$25
	addu	$4,$17,$2

	lw	$28,16($sp)
	lw	$3,%got($LC14)($28)
	addiu	$4,$3,%lo($LC14)
	lw	$3,%lo($LC14)($3)
	lbu	$4,4($4)
	swl	$3,0($2)
	swr	$3,3($2)
	sb	$4,4($2)
	lw	$31,60($sp)
	lw	$17,56($sp)
	lw	$16,52($sp)
	jr	$31
	addiu	$sp,$sp,64

$L211:
	lw	$25,%call16(strcpy)($28)
	lw	$5,16($5)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	sw	$7,40($sp)

	lw	$28,16($sp)
	b	$L212
	lw	$7,40($sp)

	.set	macro
	.set	reorder
	.end	set_filename
	.size	set_filename, .-set_filename
	.section	.rodata.str1.4
	.align	2
$LC15:
	.ascii	"Error cargando mapa. Cerrando programa...\012\000"
	.align	2
$LC16:
	.ascii	"wb\000"
	.align	2
$LC17:
	.ascii	"P1\012\000"
	.align	2
$LC18:
	.ascii	"%d %d\012\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,616,$31		# vars= 552, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-616
	lw	$25,%got(validar_datos)($28)
	.cprestore	16
	sw	$31,612($sp)
	sw	$fp,608($sp)
	sw	$23,604($sp)
	sw	$22,600($sp)
	sw	$21,596($sp)
	sw	$20,592($sp)
	sw	$19,588($sp)
	sw	$18,584($sp)
	sw	$17,580($sp)
	sw	$16,576($sp)
	sw	$4,616($sp)
	.reloc	1f,R_MIPS_JALR,validar_datos
1:	jalr	$25
	sw	$5,620($sp)

	bltz	$2,$L230
	lw	$28,16($sp)

	lw	$2,620($sp)
	li	$6,10			# 0xa
	lw	$25,%call16(strtol)($28)
	move	$5,$0
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	lw	$4,4($2)

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	lw	$3,620($sp)
	move	$16,$2
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	lw	$4,8($3)

	li	$6,10			# 0xa
	lw	$3,620($sp)
	move	$5,$0
	lw	$28,16($sp)
	move	$22,$2
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	lw	$4,12($3)

	move	$4,$22
	lw	$28,16($sp)
	move	$5,$2
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	move	$17,$2

	move	$6,$17
	lw	$28,16($sp)
	move	$5,$22
	lw	$3,620($sp)
	move	$4,$2
	sw	$2,540($sp)
	lw	$25,%got(cargar_mapa)($28)
	.reloc	1f,R_MIPS_JALR,cargar_mapa
1:	jalr	$25
	lw	$7,16($3)

	bltz	$2,$L216
	lw	$28,16($sp)

	beq	$16,$0,$L229
	lw	$2,%got($LC14)($28)

	move	$3,$2
	sw	$2,556($sp)
	addiu	$2,$16,1
	lw	$16,%got($LC6)($28)
	sw	$2,544($sp)
	li	$2,1			# 0x1
	addiu	$16,$16,%lo($LC6)
	sw	$2,536($sp)
	lw	$2,%got(avanzar)($28)
	sw	$2,548($sp)
	lw	$2,%got($LC13)($28)
	sw	$2,552($sp)
	lw	$2,%got($LC16)($28)
	addiu	$2,$2,%lo($LC16)
	sw	$2,564($sp)
	lw	$2,%lo($LC14)($3)
	sw	$2,560($sp)
	lw	$2,%got($LC17)($28)
	sw	$2,568($sp)
$L228:
	lw	$3,616($sp)
	li	$2,6			# 0x6
	beq	$3,$2,$L245
	slt	$2,$3,7

	bne	$2,$0,$L221
	lw	$2,620($sp)

	li	$3,45			# 0x2d
	lw	$2,20($2)
	lbu	$4,0($2)
	bne	$4,$3,$L222
	addiu	$18,$sp,24

	lbu	$4,1($2)
	li	$3,111			# 0x6f
	bne	$4,$3,$L222
	nop

	lbu	$2,2($2)
	bne	$2,$0,$L244
	lw	$2,620($sp)

	addiu	$18,$sp,24
	lw	$25,%call16(strcpy)($28)
	move	$4,$18
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	lw	$5,24($2)

	lw	$28,16($sp)
$L222:
	lw	$2,552($sp)
	addiu	$19,$sp,524
	lw	$25,%call16(sprintf)($28)
	lw	$6,536($sp)
	move	$4,$19
	.reloc	1f,R_MIPS_JALR,sprintf
1:	jalr	$25
	addiu	$5,$2,%lo($LC13)

	lw	$28,16($sp)
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	move	$4,$18

	move	$5,$19
	lw	$28,16($sp)
	lw	$25,%call16(stpcpy)($28)
	.reloc	1f,R_MIPS_JALR,stpcpy
1:	jalr	$25
	addu	$4,$18,$2

	move	$4,$18
	lw	$3,556($sp)
	lw	$28,16($sp)
	lw	$6,560($sp)
	addiu	$3,$3,%lo($LC14)
	lw	$5,564($sp)
	lw	$25,%call16(fopen)($28)
	lbu	$3,4($3)
	swl	$6,0($2)
	swr	$6,3($2)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	sb	$3,4($2)

	li	$6,3			# 0x3
	lw	$28,16($sp)
	move	$18,$2
	lw	$2,568($sp)
	li	$5,1			# 0x1
	move	$7,$18
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$2,%lo($LC17)

	move	$4,$18
	lw	$28,16($sp)
	move	$7,$22
	move	$6,$17
	lw	$5,%got($LC18)($28)
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$5,$5,%lo($LC18)

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	move	$5,$18

	beq	$22,$0,$L224
	lw	$28,16($sp)

	beq	$17,$0,$L249
	lw	$25,%call16(putchar)($28)

	lw	$20,540($sp)
	move	$21,$0
	addiu	$19,$17,-1
$L227:
	move	$fp,$0
	move	$23,$20
	lw	$25,%call16(printf)($28)
$L250:
	move	$4,$16
	lbu	$5,0($23)
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	addiu	$23,$23,1

	move	$5,$16
	lw	$28,16($sp)
	move	$4,$18
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	lbu	$6,-1($23)

	beq	$fp,$19,$L246
	lw	$28,16($sp)

$L225:
	addiu	$fp,$fp,1
	bne	$17,$fp,$L250
	lw	$25,%call16(printf)($28)

	addiu	$21,$21,1
	bne	$22,$21,$L227
	addu	$20,$20,$17

$L224:
	lw	$25,%call16(putchar)($28)
$L249:
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,10			# 0xa

	lw	$28,16($sp)
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,10			# 0xa

	lw	$28,16($sp)
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$18

$L220:
	lw	$2,536($sp)
	move	$6,$17
	lw	$4,540($sp)
	move	$5,$22
	lw	$25,548($sp)
	addiu	$2,$2,1
	sw	$2,536($sp)
	jalr	$25
	move	$18,$2

	lw	$3,544($sp)
	bne	$3,$18,$L228
	lw	$28,16($sp)

$L229:
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	lw	$4,540($sp)

	move	$2,$0
$L214:
	lw	$31,612($sp)
	lw	$fp,608($sp)
	lw	$23,604($sp)
	lw	$22,600($sp)
	lw	$21,596($sp)
	lw	$20,592($sp)
	lw	$19,588($sp)
	lw	$18,584($sp)
	lw	$17,580($sp)
	lw	$16,576($sp)
	jr	$31
	addiu	$sp,$sp,616

$L245:
	lw	$2,620($sp)
	li	$3,45			# 0x2d
	lw	$2,20($2)
	lbu	$4,0($2)
	beq	$4,$3,$L247
	li	$3,112			# 0x70

$L221:
	lw	$2,620($sp)
	addiu	$18,$sp,24
$L251:
	lw	$25,%call16(strcpy)($28)
	move	$4,$18
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	lw	$5,16($2)

	b	$L222
	lw	$28,16($sp)

$L244:
	b	$L222
	addiu	$18,$sp,24

$L247:
	lbu	$4,1($2)
	bne	$4,$3,$L221
	nop

	lbu	$2,2($2)
	beq	$2,$0,$L220
	lw	$2,620($sp)

	b	$L251
	addiu	$18,$sp,24

$L230:
	b	$L214
	li	$2,-1			# 0xffffffffffffffff

$L246:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,10			# 0xa

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	move	$5,$18

	b	$L225
	lw	$28,16($sp)

$L216:
	lw	$2,%got(stderr)($28)
	li	$6,42			# 0x2a
	lw	$4,%got($LC15)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC15)

	lw	$28,16($sp)
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	lw	$4,540($sp)

	b	$L214
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.globl	OUT_FILE
	.rdata
	.align	2
	.type	OUT_FILE, @object
	.size	OUT_FILE, 4
OUT_FILE:
	.word	6
	.globl	OPTION
	.align	2
	.type	OPTION, @object
	.size	OPTION, 4
OPTION:
	.word	5
	.globl	INPUT_FILE
	.align	2
	.type	INPUT_FILE, @object
	.size	INPUT_FILE, 4
INPUT_FILE:
	.word	4
	.globl	COLS
	.align	2
	.type	COLS, @object
	.size	COLS, 4
COLS:
	.word	3
	.globl	FILS
	.align	2
	.type	FILS, @object
	.size	FILS, 4
FILS:
	.word	2
	.globl	ITER
	.align	2
	.type	ITER, @object
	.size	ITER, 4
ITER:
	.word	1
	.globl	MAPA
	.align	2
	.type	MAPA, @object
	.size	MAPA, 4
MAPA:
	.space	4
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
