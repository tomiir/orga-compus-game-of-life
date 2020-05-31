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
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	.cprestore	16
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	nop

	lw	$28,16($sp)
	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

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
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	move	$16,$4
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($sp)
	beq	$2,$0,$L6
	move	$17,$2

	lw	$25,%call16(__ctype_b_loc)($28)
	.reloc	1f,R_MIPS_JALR,__ctype_b_loc
1:	jalr	$25
	nop

	lw	$28,16($sp)
	lw	$4,0($2)
	move	$5,$16
	addu	$2,$16,$17
$L5:
	lb	$3,0($5)
	sll	$3,$3,1
	addu	$3,$4,$3
	lhu	$3,0($3)
	andi	$3,$3,0x8
	beq	$3,$0,$L7
	addiu	$5,$5,1

	bne	$5,$2,$L5
	nop

	b	$L3
	move	$2,$0

$L6:
	b	$L3
	move	$2,$0

$L7:
	li	$2,-1			# 0xffffffffffffffff
$L3:
	lw	$31,36($sp)
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
	sw	$31,316($sp)
	sw	$fp,312($sp)
	sw	$23,308($sp)
	sw	$22,304($sp)
	sw	$21,300($sp)
	sw	$20,296($sp)
	sw	$19,292($sp)
	sw	$18,288($sp)
	sw	$17,284($sp)
	sw	$16,280($sp)
	.cprestore	16
	move	$22,$4
	move	$21,$5
	move	$17,$6
	lw	$5,%got($LC0)($28)
	addiu	$5,$5,%lo($LC0)
	move	$4,$7
	lw	$25,%call16(fopen)($28)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($sp)
	beq	$2,$0,$L23
	move	$20,$2

	addiu	$16,$sp,24
	lw	$19,%got($LC1)($28)
	addiu	$19,$19,%lo($LC1)
	lw	$18,%got($LC2)($28)
	addiu	$18,$18,%lo($LC2)
$L21:
	move	$6,$20
	li	$5,256			# 0x100
	move	$4,$16
	lw	$25,%call16(fgets)($28)
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	nop

	lw	$28,16($sp)
	beq	$2,$0,$L24
	move	$5,$19

	move	$4,$16
	lw	$25,%call16(strtok)($28)
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$23,$2
	move	$5,$18
	move	$4,$0
	lw	$25,%call16(strtok)($28)
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$fp,$2
	move	$4,$23
	lw	$25,%got(es_numerico)($28)
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bne	$2,$0,$L13
	move	$4,$fp

	lw	$25,%got(es_numerico)($28)
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bne	$2,$0,$L13
	li	$6,10			# 0xa

	move	$5,$0
	move	$4,$23
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$23,$2
	li	$6,10			# 0xa
	move	$5,$0
	move	$4,$fp
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bltz	$23,$L26
	move	$7,$2

	bltz	$2,$L26
	sltu	$3,$23,$21

	beq	$3,$0,$L27
	sltu	$3,$17,$2

	bne	$3,$0,$L28
	mul	$3,$23,$17

	addu	$2,$22,$2
	addu	$2,$3,$2
	li	$3,1			# 0x1
	b	$L21
	sb	$3,0($2)

$L13:
	move	$7,$fp
	move	$6,$23
	lw	$5,%got($LC3)($28)
	addiu	$5,$5,%lo($LC3)
	lw	$2,%got(stderr)($28)
	lw	$4,0($2)
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L25
	li	$2,-1			# 0xffffffffffffffff

$L26:
$L27:
$L28:
	move	$6,$23
	lw	$5,%got($LC4)($28)
	addiu	$5,$5,%lo($LC4)
	lw	$2,%got(stderr)($28)
	lw	$4,0($2)
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$4,$20
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($sp)
	li	$2,-1			# 0xffffffffffffffff
$L10:
$L25:
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

$L24:
	move	$4,$20
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L10
	move	$2,$0

$L23:
	lw	$2,%got(stderr)($28)
	lw	$7,0($2)
	li	$6,36			# 0x24
	li	$5,1			# 0x1
	lw	$4,%got($LC5)($28)
	addiu	$4,$4,%lo($LC5)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L10
	li	$2,-1			# 0xffffffffffffffff

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
	.size	vecinos, .-vecinos
	.align	2
	.globl	avanzar
	.set	nomips16
	.set	nomicromips
	.ent	avanzar
	.type	avanzar, @function
avanzar:
	.frame	$sp,88,$31		# vars= 16, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	sw	$23,76($sp)
	sw	$22,72($sp)
	sw	$21,68($sp)
	sw	$20,64($sp)
	sw	$19,60($sp)
	sw	$18,56($sp)
	sw	$17,52($sp)
	sw	$16,48($sp)
	.cprestore	24
	sw	$4,88($sp)
	sw	$5,92($sp)
	move	$fp,$6
	move	$5,$6
	lw	$4,92($sp)
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	nop

	lw	$28,24($sp)
	sw	$2,44($sp)
	lw	$3,92($sp)
	beq	$3,$0,$L47
	lw	$21,88($sp)

	move	$23,$2
	sw	$3,40($sp)
	sw	$2,36($sp)
	sw	$21,32($sp)
	move	$20,$0
	move	$19,$fp
	b	$L48
	lw	$22,%got(vecinos)($28)

$L49:
	xori	$2,$2,0x3
	sltu	$2,$2,1
$L50:
	sb	$2,0($18)
	addiu	$16,$16,1
	addiu	$17,$17,1
	beq	$19,$16,$L53
	addiu	$18,$18,1

$L51:
	sw	$19,16($sp)
	lw	$7,92($sp)
	move	$6,$16
	move	$5,$20
	lw	$4,88($sp)
	move	$25,$22
	.reloc	1f,R_MIPS_JALR,vecinos
1:	jalr	$25
	nop

	lw	$28,24($sp)
	lbu	$3,0($17)
	beq	$3,$0,$L49
	nop

	addiu	$2,$2,-2
	b	$L50
	sltu	$2,$2,2

$L53:
	addiu	$20,$20,1
	lw	$2,32($sp)
	addu	$2,$2,$fp
	sw	$2,32($sp)
	lw	$2,36($sp)
	addu	$2,$2,$fp
	sw	$2,36($sp)
	lw	$2,40($sp)
	beq	$20,$2,$L52
	lw	$2,92($sp)

$L48:
	beq	$fp,$0,$L53
	lw	$18,36($sp)

	lw	$17,32($sp)
	b	$L51
	move	$16,$0

$L52:
	mul	$2,$2,$fp
	beq	$2,$0,$L47
	lw	$3,44($sp)

	addu	$2,$3,$2
$L54:
	lbu	$3,0($23)
	sb	$3,0($21)
	addiu	$23,$23,1
	bne	$2,$23,$L54
	addiu	$21,$21,1

$L47:
	lw	$4,44($sp)
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,24($sp)
	lw	$31,84($sp)
	lw	$fp,80($sp)
	lw	$23,76($sp)
	lw	$22,72($sp)
	lw	$21,68($sp)
	lw	$20,64($sp)
	lw	$19,60($sp)
	lw	$18,56($sp)
	lw	$17,52($sp)
	lw	$16,48($sp)
	jr	$31
	addiu	$sp,$sp,88

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
	.frame	$sp,72,$31		# vars= 8, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	.cprestore	16
	beq	$5,$0,$L59
	move	$fp,$6

	move	$19,$7
	move	$22,$4
	sw	$5,24($sp)
	move	$23,$0
	move	$21,$6
	lw	$18,%got($LC6)($28)
	addiu	$18,$18,%lo($LC6)
	b	$L60
	addiu	$20,$6,-1

$L62:
	lbu	$5,0($17)
	move	$4,$18
	lw	$25,%call16(printf)($28)
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	lbu	$6,0($17)
	move	$5,$18
	move	$4,$19
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	beq	$20,$16,$L66
	li	$4,10			# 0xa

	addiu	$16,$16,1
$L67:
	bne	$16,$21,$L62
	addiu	$17,$17,1

$L63:
	addiu	$23,$23,1
	lw	$2,24($sp)
	beq	$23,$2,$L59
	addu	$22,$22,$fp

$L60:
	beq	$fp,$0,$L63
	nop

	move	$17,$22
	b	$L62
	move	$16,$0

$L66:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$5,$19
	li	$4,10			# 0xa
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L67
	addiu	$16,$16,1

$L59:
	li	$4,10			# 0xa
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($sp)
	li	$4,10			# 0xa
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($sp)
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
	jr	$31
	addiu	$sp,$sp,72

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
	.frame	$sp,48,$31		# vars= 0, regs= 6/0, args= 16, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	li	$2,2			# 0x2
	beq	$4,$2,$L85
	slt	$4,$4,4

	bne	$4,$0,$L76
	addiu	$16,$5,4

	addiu	$18,$5,16
	lw	$20,%got(es_numerico)($28)
$L80:
	lw	$17,0($16)
	move	$4,$17
	move	$25,$20
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bne	$2,$0,$L78
	move	$19,$2

	li	$6,10			# 0xa
	move	$5,$0
	move	$4,$17
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	blez	$2,$L78
	addiu	$16,$16,4

	bne	$16,$18,$L80
	nop

$L68:
	move	$2,$19
	lw	$31,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$31
	addiu	$sp,$sp,48

$L72:
	lw	$4,%got($LC7)($28)
	addiu	$4,$4,%lo($LC7)
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L68
	li	$19,-1			# 0xffffffffffffffff

$L73:
	addiu	$4,$4,%lo($LC8)
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L68
	li	$19,-1			# 0xffffffffffffffff

$L85:
	lw	$6,%got($LC10)($28)
	addiu	$6,$6,%lo($LC10)
	li	$4,2			# 0x2
	lw	$25,%call16(getopt)($28)
	.reloc	1f,R_MIPS_JALR,getopt
1:	jalr	$25
	nop

	lw	$28,16($sp)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L76
	li	$3,104			# 0x68

	beq	$2,$3,$L72
	li	$3,118			# 0x76

	beq	$2,$3,$L73
	lw	$4,%got($LC8)($28)

	lw	$2,%got(stderr)($28)
	lw	$7,0($2)
	li	$6,62			# 0x3e
	li	$5,1			# 0x1
	lw	$4,%got($LC9)($28)
	addiu	$4,$4,%lo($LC9)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L68
	li	$19,-1			# 0xffffffffffffffff

$L76:
	lw	$2,%got(stderr)($28)
	lw	$7,0($2)
	li	$6,73			# 0x49
	li	$5,1			# 0x1
	lw	$4,%got($LC11)($28)
	addiu	$4,$4,%lo($LC11)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L68
	li	$19,-1			# 0xffffffffffffffff

$L78:
	lw	$2,%got(stderr)($28)
	lw	$7,0($2)
	li	$6,95			# 0x5f
	li	$5,1			# 0x1
	lw	$4,%got($LC12)($28)
	addiu	$4,$4,%lo($LC12)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L68
	li	$19,-1			# 0xffffffffffffffff

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
	.frame	$sp,56,$31		# vars= 16, regs= 3/0, args= 16, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$17,48($sp)
	sw	$16,44($sp)
	.cprestore	16
	move	$16,$4
	slt	$6,$6,7
	bne	$6,$0,$L87
	move	$17,$7

	lw	$2,20($5)
	lbu	$4,0($2)
	li	$3,45			# 0x2d
	bne	$4,$3,$L88
	li	$3,111			# 0x6f

	lbu	$4,1($2)
	bne	$4,$3,$L90
	move	$6,$17

	lbu	$2,2($2)
	bne	$2,$0,$L90
	move	$4,$16

	lw	$5,24($5)
	lw	$25,%call16(strcpy)($28)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L90
	move	$6,$17

$L87:
	lw	$5,16($5)
	lw	$25,%call16(strcpy)($28)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,16($sp)
$L88:
	move	$6,$17
$L90:
	lw	$5,%got($LC13)($28)
	addiu	$5,$5,%lo($LC13)
	addiu	$17,$sp,24
	move	$4,$17
	lw	$25,%call16(sprintf)($28)
	.reloc	1f,R_MIPS_JALR,sprintf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$5,$17
	move	$4,$16
	lw	$25,%call16(strcat)($28)
	.reloc	1f,R_MIPS_JALR,strcat
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$4,$16
	lw	$25,%call16(strlen)($28)
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($sp)
	addu	$2,$16,$2
	lw	$3,%got($LC14)($28)
	lw	$4,%lo($LC14)($3)
	swl	$4,0($2)
	swr	$4,3($2)
	addiu	$3,$3,%lo($LC14)
	lbu	$3,4($3)
	sb	$3,4($2)
	lw	$31,52($sp)
	lw	$17,48($sp)
	lw	$16,44($sp)
	jr	$31
	addiu	$sp,$sp,56

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
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,576,$31		# vars= 512, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-576
	sw	$31,572($sp)
	sw	$fp,568($sp)
	sw	$23,564($sp)
	sw	$22,560($sp)
	sw	$21,556($sp)
	sw	$20,552($sp)
	sw	$19,548($sp)
	sw	$18,544($sp)
	sw	$17,540($sp)
	sw	$16,536($sp)
	.cprestore	16
	move	$21,$4
	move	$23,$5
	lw	$25,%got(validar_datos)($28)
	.reloc	1f,R_MIPS_JALR,validar_datos
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bltz	$2,$L100
	li	$6,10			# 0xa

	move	$5,$0
	lw	$4,4($23)
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$22,$2
	li	$6,10			# 0xa
	move	$5,$0
	lw	$4,8($23)
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$17,$2
	li	$6,10			# 0xa
	move	$5,$0
	lw	$4,12($23)
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$18,$2
	move	$5,$2
	move	$4,$17
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$20,$2
	lw	$7,16($23)
	move	$6,$18
	move	$5,$17
	move	$4,$2
	lw	$25,%got(cargar_mapa)($28)
	.reloc	1f,R_MIPS_JALR,cargar_mapa
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bltz	$2,$L93
	lw	$2,%got(stderr)($28)

	beq	$22,$0,$L95
	addiu	$22,$22,1

	li	$16,1			# 0x1
	lw	$2,%got($LC16)($28)
	addiu	$2,$2,%lo($LC16)
	sw	$2,528($sp)
	lw	$2,%got($LC17)($28)
	addiu	$2,$2,%lo($LC17)
	sw	$2,532($sp)
	b	$L99
	lw	$fp,%got($LC18)($28)

$L93:
	lw	$7,0($2)
	li	$6,42			# 0x2a
	li	$5,1			# 0x1
	lw	$4,%got($LC15)($28)
	addiu	$4,$4,%lo($LC15)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$4,$20
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L91
	li	$2,-1			# 0xffffffffffffffff

$L103:
	lw	$3,20($23)
	lbu	$4,0($3)
	li	$2,45			# 0x2d
	subu	$2,$2,$4
	bne	$2,$0,$L105
	nop

	lbu	$4,1($3)
	li	$2,112			# 0x70
	subu	$2,$2,$4
	bne	$2,$0,$L105
	nop

	lbu	$2,2($3)
	subu	$2,$0,$2
	bne	$2,$0,$L105
	nop

	move	$6,$18
$L104:
	move	$5,$17
	move	$4,$20
	lw	$25,%got(avanzar)($28)
	.reloc	1f,R_MIPS_JALR,avanzar
1:	jalr	$25
	nop

	lw	$28,16($sp)
	addiu	$16,$16,1
	beq	$16,$22,$L106
	move	$4,$20

$L99:
	li	$2,6			# 0x6
	beq	$21,$2,$L103
	move	$7,$16

$L105:
	move	$6,$21
	move	$5,$23
	addiu	$19,$sp,24
	move	$4,$19
	lw	$25,%got(set_filename)($28)
	.reloc	1f,R_MIPS_JALR,set_filename
1:	jalr	$25
	nop

	lw	$28,16($sp)
	lw	$5,528($sp)
	move	$4,$19
	lw	$25,%call16(fopen)($28)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$19,$2
	move	$7,$2
	li	$6,3			# 0x3
	li	$5,1			# 0x1
	lw	$4,532($sp)
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$7,$17
	move	$6,$18
	addiu	$5,$fp,%lo($LC18)
	move	$4,$19
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$5,$19
	li	$4,10			# 0xa
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$7,$19
	move	$6,$18
	move	$5,$17
	move	$4,$20
	lw	$25,%got(dump)($28)
	.reloc	1f,R_MIPS_JALR,dump
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$4,$19
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($sp)
	b	$L104
	move	$6,$18

$L95:
	move	$4,$20
$L106:
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($sp)
	move	$2,$0
$L91:
	lw	$31,572($sp)
	lw	$fp,568($sp)
	lw	$23,564($sp)
	lw	$22,560($sp)
	lw	$21,556($sp)
	lw	$20,552($sp)
	lw	$19,548($sp)
	lw	$18,544($sp)
	lw	$17,540($sp)
	lw	$16,536($sp)
	jr	$31
	addiu	$sp,$sp,576

$L100:
	b	$L91
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
