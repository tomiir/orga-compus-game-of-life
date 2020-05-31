	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.globl	MAPA
	.rdata
	.align	2
	.type	MAPA, @object
	.size	MAPA, 4
MAPA:
	.space	4
	.globl	ITER
	.align	2
	.type	ITER, @object
	.size	ITER, 4
ITER:
	.word	1
	.globl	FILS
	.align	2
	.type	FILS, @object
	.size	FILS, 4
FILS:
	.word	2
	.globl	COLS
	.align	2
	.type	COLS, @object
	.size	COLS, 4
COLS:
	.word	3
	.globl	INPUT_FILE
	.align	2
	.type	INPUT_FILE, @object
	.size	INPUT_FILE, 4
INPUT_FILE:
	.word	4
	.globl	OPTION
	.align	2
	.type	OPTION, @object
	.size	OPTION, 4
OPTION:
	.word	5
	.globl	OUT_FILE
	.align	2
	.type	OUT_FILE, @object
	.size	OUT_FILE, 4
OUT_FILE:
	.word	6
	.text
	.align	2
	.globl	crear_mapa
	.set	nomips16
	.set	nomicromips
	.ent	crear_mapa
	.type	crear_mapa, @function
crear_mapa:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$2,40($fp)
	lw	$3,44($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%call16(calloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
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
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$4,40($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	sw	$0,24($fp)
	b	$L4
	nop

$L7:
	lw	$2,%call16(__ctype_b_loc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$3,0($2)
	lw	$2,24($fp)
	lw	$4,40($fp)
	addu	$2,$4,$2
	lb	$2,0($2)
	sll	$2,$2,1
	addu	$2,$3,$2
	lhu	$2,0($2)
	andi	$2,$2,0x8
	bne	$2,$0,$L5
	nop

	li	$2,-1			# 0xffffffffffffffff
	b	$L6
	nop

$L5:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L4:
	lw	$3,24($fp)
	lw	$2,28($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L7
	nop

	move	$2,$0
$L6:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	es_numerico
	.size	es_numerico, .-es_numerico
	.rdata
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
	.frame	$fp,312,$31		# vars= 280, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-312
	sw	$31,308($sp)
	sw	$fp,304($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,312($fp)
	sw	$5,316($fp)
	sw	$6,320($fp)
	sw	$7,324($fp)
	lw	$2,%got($LC0)($28)
	addiu	$5,$2,%lo($LC0)
	lw	$4,324($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	beq	$2,$0,$L9
	nop

	b	$L10
	nop

$L16:
	addiu	$3,$fp,48
	lw	$2,%got($LC1)($28)
	addiu	$5,$2,%lo($LC1)
	move	$4,$3
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,%got($LC2)($28)
	addiu	$5,$2,%lo($LC2)
	move	$4,$0
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,28($fp)
	lw	$2,%got(es_numerico)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L11
	nop

	lw	$4,32($fp)
	lw	$2,%got(es_numerico)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L12
	nop

$L11:
	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$7,32($fp)
	lw	$6,28($fp)
	lw	$2,%got($LC3)($28)
	addiu	$5,$2,%lo($LC3)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L18
	nop

$L12:
	lw	$4,28($fp)
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$4,32($fp)
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,40($fp)
	lw	$2,36($fp)
	bltz	$2,$L14
	nop

	lw	$2,40($fp)
	bltz	$2,$L14
	nop

	lw	$3,36($fp)
	lw	$2,316($fp)
	sltu	$2,$3,$2
	beq	$2,$0,$L14
	nop

	lw	$3,40($fp)
	lw	$2,320($fp)
	sltu	$2,$2,$3
	beq	$2,$0,$L15
	nop

$L14:
	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$7,40($fp)
	lw	$6,36($fp)
	lw	$2,%got($LC4)($28)
	addiu	$5,$2,%lo($LC4)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L18
	nop

$L15:
	lw	$3,36($fp)
	lw	$2,320($fp)
	mul	$3,$3,$2
	lw	$2,40($fp)
	addu	$2,$3,$2
	sw	$2,44($fp)
	lw	$3,312($fp)
	lw	$2,44($fp)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sb	$3,0($2)
$L10:
	addiu	$2,$fp,48
	lw	$6,24($fp)
	li	$5,256			# 0x100
	move	$4,$2
	lw	$2,%call16(fgets)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L16
	nop

	b	$L19
	nop

$L9:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,36			# 0x24
	li	$5,1			# 0x1
	lw	$2,%got($LC5)($28)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L18
	nop

$L19:
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L18:
	move	$sp,$fp
	lw	$31,308($sp)
	lw	$fp,304($sp)
	addiu	$sp,$sp,312
	jr	$31
	nop

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
	addu	$2,$3,$2
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
	.size	vecinos, .-vecinos
	.align	2
	.globl	avanzar
	.set	nomips16
	.set	nomicromips
	.ent	avanzar
	.type	avanzar, @function
avanzar:
	.frame	$fp,72,$31		# vars= 32, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$4,72($fp)
	sw	$5,76($fp)
	sw	$6,80($fp)
	lw	$2,76($fp)
	lw	$3,80($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(crear_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,crear_mapa
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,44($fp)
	sw	$0,32($fp)
	b	$L35
	nop

$L43:
	sw	$0,36($fp)
	b	$L36
	nop

$L42:
	lw	$3,32($fp)
	lw	$2,80($fp)
	mul	$3,$3,$2
	lw	$2,36($fp)
	addu	$2,$3,$2
	sw	$2,48($fp)
	lw	$2,80($fp)
	sw	$2,16($sp)
	lw	$7,76($fp)
	lw	$6,36($fp)
	lw	$5,32($fp)
	lw	$4,72($fp)
	lw	$2,%got(vecinos)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vecinos
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,52($fp)
	lw	$3,72($fp)
	lw	$2,48($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	beq	$2,$0,$L37
	nop

	lw	$3,52($fp)
	li	$2,3			# 0x3
	beq	$3,$2,$L38
	nop

	lw	$3,52($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L39
	nop

$L38:
	li	$2,1			# 0x1
	b	$L41
	nop

$L39:
	move	$2,$0
	b	$L41
	nop

$L37:
	lw	$2,52($fp)
	xori	$2,$2,0x3
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
$L41:
	sw	$2,56($fp)
	lw	$3,44($fp)
	lw	$2,48($fp)
	addu	$2,$3,$2
	lw	$3,56($fp)
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L36:
	lw	$3,36($fp)
	lw	$2,80($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L42
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L35:
	lw	$3,32($fp)
	lw	$2,76($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L43
	nop

	sw	$0,40($fp)
	b	$L44
	nop

$L45:
	lw	$2,40($fp)
	lw	$3,72($fp)
	addu	$2,$3,$2
	lw	$3,40($fp)
	lw	$4,44($fp)
	addu	$3,$4,$3
	lbu	$3,0($3)
	sb	$3,0($2)
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L44:
	lw	$3,80($fp)
	lw	$2,76($fp)
	mul	$3,$3,$2
	lw	$2,40($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L45
	nop

	lw	$4,44($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,24($fp)
	nop
	move	$sp,$fp
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addiu	$sp,$sp,72
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	avanzar
	.size	avanzar, .-avanzar
	.rdata
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
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$6,56($fp)
	sw	$7,60($fp)
	sw	$0,24($fp)
	b	$L47
	nop

$L51:
	sw	$0,28($fp)
	b	$L48
	nop

$L50:
	lw	$3,24($fp)
	lw	$2,56($fp)
	mul	$3,$3,$2
	lw	$2,28($fp)
	addu	$2,$3,$2
	sw	$2,32($fp)
	lw	$2,32($fp)
	lw	$3,48($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	move	$5,$2
	lw	$2,%got($LC6)($28)
	addiu	$4,$2,%lo($LC6)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	lw	$3,48($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	move	$6,$2
	lw	$2,%got($LC6)($28)
	addiu	$5,$2,%lo($LC6)
	lw	$4,60($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,56($fp)
	addiu	$3,$2,-1
	lw	$2,28($fp)
	bne	$3,$2,$L49
	nop

	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$5,60($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(fputc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L49:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L48:
	lw	$3,28($fp)
	lw	$2,56($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L50
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L47:
	lw	$3,24($fp)
	lw	$2,52($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L51
	nop

	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	dump
	.size	dump, .-dump
	.rdata
	.align	2
$LC7:
	.ascii	"hv\000"
	.align	2
$LC8:
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
$LC9:
	.ascii	"Version 1.0.0\000"
	.align	2
$LC10:
	.ascii	"Parametros incorrectos, use -h o -v si usa un solo argum"
	.ascii	"ento.\012\000"
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
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$3,40($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L53
	nop

	lw	$2,%got($LC7)($28)
	addiu	$6,$2,%lo($LC7)
	lw	$5,44($fp)
	lw	$4,40($fp)
	lw	$2,%call16(getopt)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,getopt
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$3,28($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L53
	nop

	lw	$2,28($fp)
	li	$3,104			# 0x68
	beq	$2,$3,$L55
	nop

	li	$3,118			# 0x76
	beq	$2,$3,$L56
	nop

	b	$L63
	nop

$L55:
	lw	$2,%got($LC8)($28)
	addiu	$4,$2,%lo($LC8)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L57
	nop

$L56:
	lw	$2,%got($LC9)($28)
	addiu	$4,$2,%lo($LC9)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L57
	nop

$L63:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,62			# 0x3e
	li	$5,1			# 0x1
	lw	$2,%got($LC10)($28)
	addiu	$4,$2,%lo($LC10)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L57
	nop

$L53:
	lw	$2,40($fp)
	slt	$2,$2,4
	beq	$2,$0,$L58
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,73			# 0x49
	li	$5,1			# 0x1
	lw	$2,%got($LC11)($28)
	addiu	$4,$2,%lo($LC11)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L57
	nop

$L58:
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L59
	nop

$L62:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%got(es_numerico)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L60
	nop

	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bgtz	$2,$L61
	nop

$L60:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,95			# 0x5f
	li	$5,1			# 0x1
	lw	$2,%got($LC12)($28)
	addiu	$4,$2,%lo($LC12)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L57
	nop

$L61:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L59:
	lw	$2,24($fp)
	slt	$2,$2,4
	bne	$2,$0,$L62
	nop

	move	$2,$0
$L57:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	validar_datos
	.size	validar_datos, .-validar_datos
	.rdata
	.align	2
$LC13:
	.ascii	"-o\000"
	.align	2
$LC14:
	.ascii	"_%d\000"
	.align	2
$LC15:
	.ascii	".pbm\000"
	.text
	.align	2
	.globl	set_filename
	.set	nomips16
	.set	nomicromips
	.ent	set_filename
	.type	set_filename, @function
set_filename:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$6,56($fp)
	sw	$7,60($fp)
	lw	$2,56($fp)
	slt	$2,$2,7
	bne	$2,$0,$L65
	nop

	li	$2,5			# 0x5
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$5,$2
	lw	$2,%got($LC13)($28)
	addiu	$4,$2,%lo($LC13)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L67
	nop

	li	$2,6			# 0x6
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%call16(strcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L67
	nop

$L65:
	li	$2,4			# 0x4
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%call16(strcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L67:
	lw	$6,60($fp)
	lw	$2,%got($LC14)($28)
	addiu	$5,$2,%lo($LC14)
	addiu	$2,$fp,24
	move	$4,$2
	lw	$2,%call16(sprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,sprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,24
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%call16(strcat)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcat
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,48($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,48($fp)
	addu	$2,$2,$3
	lw	$3,%got($LC15)($28)
	lw	$4,%lo($LC15)($3)
	swl	$4,0($2)
	swr	$4,3($2)
	addiu	$3,$3,%lo($LC15)
	lbu	$3,4($3)
	sb	$3,4($2)
	nop
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	set_filename
	.size	set_filename, .-set_filename
	.rdata
	.align	2
$LC16:
	.ascii	"Error cargando mapa. Cerrando programa...\012\000"
	.align	2
$LC17:
	.ascii	"-p\000"
	.align	2
$LC18:
	.ascii	"wb\000"
	.align	2
$LC19:
	.ascii	"P1\012\000"
	.align	2
$LC20:
	.ascii	"%d %d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,568,$31		# vars= 536, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-568
	sw	$31,564($sp)
	sw	$fp,560($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,568($fp)
	sw	$5,572($fp)
	lw	$5,572($fp)
	lw	$4,568($fp)
	lw	$2,%got(validar_datos)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,validar_datos
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bgez	$2,$L69
	nop

	li	$2,-1			# 0xffffffffffffffff
	b	$L76
	nop

$L69:
	li	$2,1			# 0x1
	sll	$2,$2,2
	lw	$3,572($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	li	$2,2			# 0x2
	sll	$2,$2,2
	lw	$3,572($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	li	$2,3			# 0x3
	sll	$2,$2,2
	lw	$3,572($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,40($fp)
	lw	$2,36($fp)
	lw	$3,40($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(crear_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,crear_mapa
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,44($fp)
	li	$2,4			# 0x4
	sll	$2,$2,2
	lw	$3,572($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,48($fp)
	lw	$7,48($fp)
	lw	$6,40($fp)
	lw	$5,36($fp)
	lw	$4,44($fp)
	lw	$2,%got(cargar_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,cargar_mapa
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bgez	$2,$L71
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,42			# 0x2a
	li	$5,1			# 0x1
	lw	$2,%got($LC16)($28)
	addiu	$4,$2,%lo($LC16)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,44($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L76
	nop

$L71:
	sw	$0,24($fp)
	b	$L72
	nop

$L75:
	li	$2,1			# 0x1
	sw	$2,28($fp)
	lw	$3,568($fp)
	li	$2,6			# 0x6
	bne	$3,$2,$L73
	nop

	li	$2,5			# 0x5
	sll	$2,$2,2
	lw	$3,572($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC17)($28)
	addiu	$5,$2,%lo($LC17)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
$L73:
	lw	$2,28($fp)
	beq	$2,$0,$L74
	nop

	lw	$2,24($fp)
	addiu	$3,$2,1
	addiu	$2,$fp,56
	move	$7,$3
	lw	$6,568($fp)
	lw	$5,572($fp)
	move	$4,$2
	lw	$2,%got(set_filename)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,set_filename
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$3,$fp,56
	lw	$2,%got($LC18)($28)
	addiu	$5,$2,%lo($LC18)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,52($fp)
	lw	$7,52($fp)
	li	$6,3			# 0x3
	li	$5,1			# 0x1
	lw	$2,%got($LC19)($28)
	addiu	$4,$2,%lo($LC19)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$7,36($fp)
	lw	$6,40($fp)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	lw	$4,52($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$5,52($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(fputc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$7,52($fp)
	lw	$6,40($fp)
	lw	$5,36($fp)
	lw	$4,44($fp)
	lw	$2,%got(dump)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,dump
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,52($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L74:
	lw	$6,40($fp)
	lw	$5,36($fp)
	lw	$4,44($fp)
	lw	$2,%got(avanzar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,avanzar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L72:
	lw	$3,24($fp)
	lw	$2,32($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L75
	nop

	lw	$4,44($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L76:
	move	$sp,$fp
	lw	$31,564($sp)
	lw	$fp,560($sp)
	addiu	$sp,$sp,568
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
