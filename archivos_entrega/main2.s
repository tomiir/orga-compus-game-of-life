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

	beq	$2,$0,$L27
	lw	$28,16($sp)

	lw	$19,%got($LC1)($28)
	addiu	$23,$sp,24
	lw	$20,%got($LC2)($28)
	move	$21,$2
	lw	$17,%got(es_numerico)($28)
	addiu	$19,$19,%lo($LC1)
	b	$L24
	addiu	$20,$20,%lo($LC2)

$L20:
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	move	$4,$0
	lw	$28,16($sp)
	move	$16,$2
	lw	$25,%call16(strtok)($28)
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	move	$5,$20

	move	$4,$16
	move	$25,$17
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	move	$fp,$2

	lw	$28,16($sp)
	bne	$2,$0,$L17
	move	$4,$fp

	move	$25,$17
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	nop

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	move	$4,$16
	bne	$2,$0,$L17
	lw	$25,%call16(strtol)($28)

	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	move	$4,$fp
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$16,$2

	sltu	$4,$16,$22
	bltz	$16,$L19
	lw	$28,16($sp)

	lw	$3,320($sp)
	bltz	$2,$L19
	addu	$5,$3,$2

	beq	$4,$0,$L19
	sltu	$6,$18,$2

	bne	$6,$0,$L28
	move	$7,$2

	mul	$2,$16,$18
	addu	$16,$2,$5
	li	$2,1			# 0x1
	sb	$2,0($16)
$L24:
	lw	$25,%call16(fgets)($28)
	li	$5,256			# 0x100
	move	$4,$23
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	move	$6,$21

	move	$5,$19
	lw	$28,16($sp)
	move	$4,$23
	bne	$2,$0,$L20
	lw	$25,%call16(strtok)($28)

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

$L19:
	move	$7,$2
$L28:
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

	li	$2,-1			# 0xffffffffffffffff
$L12:
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

$L17:
	lw	$2,%got(stderr)($28)
	move	$7,$fp
	lw	$5,%got($LC3)($28)
	move	$6,$16
	lw	$25,%call16(fprintf)($28)
	lw	$4,0($2)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$5,$5,%lo($LC3)

	b	$L12
	li	$2,-1			# 0xffffffffffffffff

$L27:
	lw	$2,%got(stderr)($28)
	li	$6,36			# 0x24
	lw	$4,%got($LC5)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC5)

	b	$L12
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
	lw	$25,%call16(calloc)($28)
	sw	$17,52($sp)
	move	$17,$5
	.cprestore	24
	move	$5,$6
	sw	$23,76($sp)
	move	$23,$6
	sw	$18,56($sp)
	move	$18,$4
	sw	$31,84($sp)
	move	$4,$17
	sw	$fp,80($sp)
	sw	$22,72($sp)
	sw	$21,68($sp)
	sw	$20,64($sp)
	sw	$19,60($sp)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	sw	$16,48($sp)

	lw	$28,24($sp)
	beq	$17,$0,$L56
	sw	$2,40($sp)

	lw	$2,40($sp)
	move	$16,$0
	lw	$25,%got(vecinos)($28)
	move	$20,$18
	sw	$18,32($sp)
	move	$19,$2
	sw	$2,36($sp)
$L53:
	beq	$23,$0,$L55
	nop

	lw	$22,36($sp)
	move	$fp,$0
	b	$L52
	lw	$21,32($sp)

$L70:
	addiu	$fp,$fp,1
	sltu	$2,$5,2
	sb	$2,0($22)
	addiu	$21,$21,1
	beq	$fp,$23,$L55
	addiu	$22,$22,1

$L52:
	move	$5,$16
	sw	$23,16($sp)
	move	$4,$18
	move	$6,$fp
	.reloc	1f,R_MIPS_JALR,vecinos
1:	jalr	$25
	move	$7,$17

	lbu	$4,0($21)
	addiu	$5,$2,-2
	lw	$28,24($sp)
	bne	$4,$0,$L70
	xori	$2,$2,0x3

	addiu	$fp,$fp,1
	sltu	$2,$2,1
	sb	$2,0($22)
	addiu	$21,$21,1
	bne	$fp,$23,$L52
	addiu	$22,$22,1

$L55:
	lw	$2,32($sp)
	addiu	$16,$16,1
	addu	$2,$2,$23
	sw	$2,32($sp)
	lw	$2,36($sp)
	addu	$2,$2,$23
	bne	$16,$17,$L53
	sw	$2,36($sp)

	mul	$2,$16,$23
	beq	$2,$0,$L56
	lw	$3,40($sp)

	addu	$2,$3,$2
$L57:
	lbu	$3,0($19)
	addiu	$20,$20,1
	addiu	$19,$19,1
	bne	$2,$19,$L57
	sb	$3,-1($20)

$L56:
	lw	$4,40($sp)
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
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jr	$25
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
	beq	$5,$0,$L73
	sw	$16,24($sp)

	lw	$18,%got($LC6)($28)
	move	$23,$0
	addiu	$21,$6,-1
	move	$fp,$5
	addiu	$18,$18,%lo($LC6)
	move	$19,$6
	move	$20,$7
	move	$22,$4
$L76:
	beq	$19,$0,$L77
	lw	$25,%call16(printf)($28)

	move	$16,$0
	move	$17,$22
$L85:
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

	beq	$16,$21,$L84
	lw	$28,16($sp)

$L74:
	addiu	$16,$16,1
	bne	$19,$16,$L85
	lw	$25,%call16(printf)($28)

$L77:
	addiu	$23,$23,1
	bne	$fp,$23,$L76
	addu	$22,$22,$19

$L73:
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

$L84:
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

	b	$L74
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
	beq	$4,$3,$L104
	sw	$16,28($sp)

	slt	$2,$4,4
	bne	$2,$0,$L94
	lw	$19,%got(es_numerico)($28)

	addiu	$16,$5,4
	addiu	$18,$5,16
$L97:
	lw	$17,0($16)
	move	$25,$19
	addiu	$16,$16,4
	.reloc	1f,R_MIPS_JALR,es_numerico
1:	jalr	$25
	move	$4,$17

	move	$4,$17
	lw	$28,16($sp)
	li	$6,10			# 0xa
	move	$5,$0
	move	$17,$2
	bne	$2,$0,$L96
	lw	$25,%call16(strtol)($28)

	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	blez	$2,$L96
	lw	$28,16($sp)

	bne	$18,$16,$L97
	lw	$31,44($sp)

$L106:
	move	$2,$17
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,48

$L104:
	lw	$6,%got($LC10)($28)
	lw	$25,%call16(getopt)($28)
	.reloc	1f,R_MIPS_JALR,getopt
1:	jalr	$25
	addiu	$6,$6,%lo($LC10)

	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L94
	lw	$28,16($sp)

	li	$3,104			# 0x68
	beq	$2,$3,$L90
	li	$3,118			# 0x76

	bne	$2,$3,$L105
	lw	$2,%got(stderr)($28)

	lw	$4,%got($LC8)($28)
	li	$17,-1			# 0xffffffffffffffff
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	addiu	$4,$4,%lo($LC8)

	b	$L106
	lw	$31,44($sp)

$L96:
	lw	$2,%got(stderr)($28)
	li	$6,95			# 0x5f
	lw	$4,%got($LC12)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	li	$17,-1			# 0xffffffffffffffff
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC12)

	move	$2,$17
	lw	$31,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,48

$L105:
	li	$6,62			# 0x3e
	lw	$4,%got($LC9)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	li	$17,-1			# 0xffffffffffffffff
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC9)

	b	$L106
	lw	$31,44($sp)

$L94:
	lw	$2,%got(stderr)($28)
	li	$6,73			# 0x49
	lw	$4,%got($LC11)($28)
	li	$5,1			# 0x1
	lw	$25,%call16(fwrite)($28)
	li	$17,-1			# 0xffffffffffffffff
	lw	$7,0($2)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	addiu	$4,$4,%lo($LC11)

	b	$L106
	lw	$31,44($sp)

$L90:
	lw	$4,%got($LC7)($28)
	li	$17,-1			# 0xffffffffffffffff
	lw	$25,%call16(puts)($28)
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	addiu	$4,$4,%lo($LC7)

	b	$L106
	lw	$31,44($sp)

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
	bne	$6,$0,$L108
	sw	$16,52($sp)

	lw	$2,20($5)
	li	$3,45			# 0x2d
	lbu	$6,0($2)
	bne	$6,$3,$L109
	li	$3,111			# 0x6f

	lbu	$6,1($2)
	bne	$6,$3,$L109
	nop

	lbu	$2,2($2)
	bne	$2,$0,$L109
	lw	$25,%call16(strcpy)($28)

	lw	$5,24($5)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	sw	$7,40($sp)

	lw	$28,16($sp)
	lw	$7,40($sp)
$L109:
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

$L108:
	lw	$25,%call16(strcpy)($28)
	lw	$5,16($5)
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	sw	$7,40($sp)

	lw	$28,16($sp)
	b	$L109
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
	.frame	$sp,584,$31		# vars= 520, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-584
	lw	$25,%got(validar_datos)($28)
	.cprestore	16
	sw	$19,556($sp)
	move	$19,$5
	sw	$16,544($sp)
	move	$16,$4
	sw	$31,580($sp)
	sw	$fp,576($sp)
	sw	$23,572($sp)
	sw	$22,568($sp)
	sw	$21,564($sp)
	sw	$20,560($sp)
	sw	$18,552($sp)
	.reloc	1f,R_MIPS_JALR,validar_datos
1:	jalr	$25
	sw	$17,548($sp)

	bltz	$2,$L119
	lw	$28,16($sp)

	lw	$25,%call16(strtol)($28)
	li	$6,10			# 0xa
	lw	$4,4($19)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$5,$0

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	lw	$4,8($19)
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$22,$2

	li	$6,10			# 0xa
	lw	$28,16($sp)
	move	$5,$0
	lw	$4,12($19)
	lw	$25,%call16(strtol)($28)
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	move	$17,$2

	move	$4,$17
	lw	$28,16($sp)
	move	$5,$2
	lw	$25,%call16(calloc)($28)
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	move	$18,$2

	move	$6,$18
	lw	$28,16($sp)
	move	$5,$17
	lw	$7,16($19)
	move	$4,$2
	lw	$25,%got(cargar_mapa)($28)
	.reloc	1f,R_MIPS_JALR,cargar_mapa
1:	jalr	$25
	move	$21,$2

	bltz	$2,$L113
	lw	$28,16($sp)

	beq	$22,$0,$L118
	lw	$2,%got($LC18)($28)

	addiu	$22,$22,1
	li	$fp,1			# 0x1
	lw	$23,%got(avanzar)($28)
	sw	$2,536($sp)
	lw	$2,%got($LC16)($28)
	addiu	$2,$2,%lo($LC16)
	sw	$2,528($sp)
	lw	$2,%got($LC17)($28)
	addiu	$2,$2,%lo($LC17)
	b	$L117
	sw	$2,532($sp)

$L115:
	lw	$25,%got(set_filename)($28)
$L126:
	.reloc	1f,R_MIPS_JALR,set_filename
1:	jalr	$25
	nop

	move	$4,$20
	lw	$28,16($sp)
	lw	$25,%call16(fopen)($28)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	lw	$5,528($sp)

	li	$6,3			# 0x3
	lw	$28,16($sp)
	li	$5,1			# 0x1
	lw	$4,532($sp)
	move	$7,$2
	lw	$25,%call16(fwrite)($28)
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	move	$20,$2

	move	$7,$17
	lw	$28,16($sp)
	move	$6,$18
	lw	$2,536($sp)
	move	$4,$20
	lw	$25,%call16(fprintf)($28)
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$5,$2,%lo($LC18)

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$25,%call16(fputc)($28)
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	move	$5,$20

	move	$6,$18
	lw	$28,16($sp)
	move	$5,$17
	move	$7,$20
	lw	$25,%got(dump)($28)
	.reloc	1f,R_MIPS_JALR,dump
1:	jalr	$25
	move	$4,$21

	lw	$28,16($sp)
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$20

	move	$6,$18
	move	$5,$17
	move	$25,$23
	.reloc	1f,R_MIPS_JALR,avanzar
1:	jalr	$25
	move	$4,$21

	beq	$22,$fp,$L118
	lw	$28,16($sp)

$L117:
	addiu	$20,$sp,24
	li	$2,6			# 0x6
	move	$7,$fp
	move	$6,$16
	move	$5,$19
	move	$4,$20
	bne	$16,$2,$L115
	addiu	$fp,$fp,1

	lw	$2,20($19)
	li	$8,45			# 0x2d
	lbu	$9,0($2)
	bne	$9,$8,$L115
	li	$10,112			# 0x70

	lbu	$8,1($2)
	bne	$8,$10,$L126
	lw	$25,%got(set_filename)($28)

	lbu	$2,2($2)
	bne	$2,$0,$L115
	move	$25,$23

	move	$6,$18
	move	$5,$17
	.reloc	1f,R_MIPS_JALR,avanzar
1:	jalr	$25
	move	$4,$21

	bne	$22,$fp,$L117
	lw	$28,16($sp)

$L118:
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	move	$4,$21

	move	$2,$0
$L111:
	lw	$31,580($sp)
	lw	$fp,576($sp)
	lw	$23,572($sp)
	lw	$22,568($sp)
	lw	$21,564($sp)
	lw	$20,560($sp)
	lw	$19,556($sp)
	lw	$18,552($sp)
	lw	$17,548($sp)
	lw	$16,544($sp)
	jr	$31
	addiu	$sp,$sp,584

$L119:
	b	$L111
	li	$2,-1			# 0xffffffffffffffff

$L113:
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
	move	$4,$21

	b	$L111
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
