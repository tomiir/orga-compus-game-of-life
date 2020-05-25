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
	.globl	liberar_mapa
	.set	nomips16
	.set	nomicromips
	.ent	liberar_mapa
	.type	liberar_mapa, @function
liberar_mapa:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$4,32($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	liberar_mapa
	.size	liberar_mapa, .-liberar_mapa
	.align	2
	.globl	mapear_posicion
	.set	nomips16
	.set	nomicromips
	.ent	mapear_posicion
	.type	mapear_posicion, @function
mapear_posicion:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	sw	$6,16($fp)
	lw	$3,12($fp)
	lw	$2,16($fp)
	mul	$3,$3,$2
	lw	$2,8($fp)
	addu	$2,$3,$2
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	mapear_posicion
	.size	mapear_posicion, .-mapear_posicion
	.align	2
	.globl	vecinos
	.set	nomips16
	.set	nomicromips
	.ent	vecinos
	.type	vecinos, @function
vecinos:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,56($fp)
	sw	$5,60($fp)
	sw	$6,64($fp)
	sw	$7,68($fp)
	sw	$0,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,28($fp)
	b	$L7
	nop

$L16:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,32($fp)
	b	$L8
	nop

$L15:
	lw	$3,60($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	sw	$2,36($fp)
	lw	$2,36($fp)
	bgez	$2,$L9
	nop

	lw	$2,68($fp)
	addiu	$2,$2,-1
	b	$L10
	nop

$L9:
	lw	$3,36($fp)
	lw	$2,68($fp)
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$2
$L10:
	sw	$2,36($fp)
	lw	$3,64($fp)
	lw	$2,32($fp)
	addu	$2,$3,$2
	sw	$2,40($fp)
	lw	$2,40($fp)
	bgez	$2,$L11
	nop

	lw	$2,72($fp)
	addiu	$2,$2,-1
	b	$L12
	nop

$L11:
	lw	$3,40($fp)
	lw	$2,72($fp)
	teq	$2,$0,7
	divu	$0,$3,$2
	mfhi	$2
$L12:
	sw	$2,40($fp)
	lw	$2,36($fp)
	lw	$3,40($fp)
	lw	$6,72($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(mapear_posicion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mapear_posicion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,44($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L13
	nop

	lw	$2,32($fp)
	beq	$2,$0,$L14
	nop

$L13:
	lw	$3,56($fp)
	lw	$2,44($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sltu	$2,$0,$2
	andi	$2,$2,0x00ff
	move	$3,$2
	lw	$2,24($fp)
	addu	$2,$2,$3
	sw	$2,24($fp)
$L14:
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L8:
	lw	$2,32($fp)
	slt	$2,$2,2
	bne	$2,$0,$L15
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L7:
	lw	$2,28($fp)
	slt	$2,$2,2
	bne	$2,$0,$L16
	nop

	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
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
	.frame	$fp,80,$31		# vars= 40, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$4,80($fp)
	sw	$5,84($fp)
	sw	$6,88($fp)
	lw	$2,84($fp)
	lw	$3,88($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(crear_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,crear_mapa
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,48($fp)
	sw	$0,32($fp)
	b	$L19
	nop

$L27:
	sw	$0,36($fp)
	b	$L20
	nop

$L26:
	lw	$2,32($fp)
	lw	$3,36($fp)
	lw	$6,88($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(mapear_posicion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mapear_posicion
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,52($fp)
	lw	$2,88($fp)
	sw	$2,16($sp)
	lw	$7,84($fp)
	lw	$6,36($fp)
	lw	$5,32($fp)
	lw	$4,80($fp)
	lw	$2,%got(vecinos)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vecinos
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,56($fp)
	lw	$3,80($fp)
	lw	$2,52($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	beq	$2,$0,$L21
	nop

	lw	$3,56($fp)
	li	$2,3			# 0x3
	beq	$3,$2,$L22
	nop

	lw	$3,56($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L23
	nop

$L22:
	li	$2,1			# 0x1
	b	$L25
	nop

$L23:
	move	$2,$0
	b	$L25
	nop

$L21:
	lw	$2,56($fp)
	xori	$2,$2,0x3
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
$L25:
	sw	$2,60($fp)
	lw	$3,48($fp)
	lw	$2,52($fp)
	addu	$2,$3,$2
	lw	$3,60($fp)
	andi	$3,$3,0x00ff
	sb	$3,0($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L20:
	lw	$3,36($fp)
	lw	$2,88($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L26
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L19:
	lw	$3,32($fp)
	lw	$2,84($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L27
	nop

	sw	$0,40($fp)
	b	$L28
	nop

$L31:
	sw	$0,44($fp)
	b	$L29
	nop

$L30:
	lw	$2,40($fp)
	lw	$3,44($fp)
	lw	$6,88($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(mapear_posicion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mapear_posicion
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,64($fp)
	lw	$3,80($fp)
	lw	$2,64($fp)
	addu	$2,$3,$2
	lw	$4,48($fp)
	lw	$3,64($fp)
	addu	$3,$4,$3
	lbu	$3,0($3)
	sb	$3,0($2)
	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
$L29:
	lw	$3,44($fp)
	lw	$2,88($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L30
	nop

	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L28:
	lw	$3,40($fp)
	lw	$2,84($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L31
	nop

	lw	$2,84($fp)
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%got(liberar_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,liberar_mapa
1:	jalr	$25
	nop

	lw	$28,24($fp)
	nop
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	addiu	$sp,$sp,80
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	avanzar
	.size	avanzar, .-avanzar
	.rdata
	.align	2
$LC0:
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
	b	$L33
	nop

$L37:
	sw	$0,28($fp)
	b	$L34
	nop

$L36:
	lw	$6,56($fp)
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(mapear_posicion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mapear_posicion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$3,48($fp)
	lw	$2,32($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	move	$5,$2
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$3,48($fp)
	lw	$2,32($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	move	$6,$2
	lw	$2,%got($LC0)($28)
	addiu	$5,$2,%lo($LC0)
	lw	$4,60($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,52($fp)
	addiu	$3,$2,-1
	lw	$2,28($fp)
	bne	$3,$2,$L35
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
$L35:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L34:
	lw	$3,28($fp)
	lw	$2,52($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L36
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L33:
	lw	$3,24($fp)
	lw	$2,56($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L37
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
$LC1:
	.ascii	"Iniciando \000"
	.align	2
$LC2:
	.ascii	"Cantidad incorrecta de parametros. \000"
	.text
	.align	2
	.globl	validar_datos
	.set	nomips16
	.set	nomicromips
	.ent	validar_datos
	.type	validar_datos, @function
validar_datos:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,32($fp)
	slt	$2,$2,5
	bne	$2,$0,$L39
	nop

	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L40
	nop

$L39:
	lw	$2,%got($LC2)($28)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,1			# 0x1
$L40:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	validar_datos
	.size	validar_datos, .-validar_datos
	.rdata
	.align	2
$LC3:
	.ascii	"-o\000"
	.align	2
$LC4:
	.ascii	"default\000"
	.align	2
$LC5:
	.ascii	"%d\000"
	.align	2
$LC6:
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
	lw	$3,56($fp)
	li	$2,7			# 0x7
	bne	$3,$2,$L42
	nop

	lw	$2,52($fp)
	addiu	$2,$2,20
	lw	$3,0($2)
	lw	$2,%got($LC3)($28)
	addiu	$5,$2,%lo($LC3)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L44
	nop

	lw	$2,52($fp)
	addiu	$2,$2,24
	lw	$2,0($2)
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%call16(strcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L44
	nop

$L42:
	lw	$2,48($fp)
	lw	$3,%got($LC4)($28)
	lw	$4,%lo($LC4)($3)
	addiu	$3,$3,%lo($LC4)
	lw	$3,4($3)
	swl	$4,0($2)
	swr	$4,3($2)
	swl	$3,4($2)
	swr	$3,7($2)
$L44:
	lw	$6,60($fp)
	lw	$2,%got($LC5)($28)
	addiu	$5,$2,%lo($LC5)
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
	lw	$3,%got($LC6)($28)
	lw	$4,%lo($LC6)($3)
	swl	$4,0($2)
	swr	$4,3($2)
	addiu	$3,$3,%lo($LC6)
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
$LC7:
	.ascii	"r\000"
	.align	2
$LC8:
	.ascii	" \000"
	.align	2
$LC9:
	.ascii	"ERROR EN EL ARCHIVO DE ENTRADA \000"
	.align	2
$LC10:
	.ascii	"Celda [%d, %d] fuera del mapa\000"
	.align	2
$LC11:
	.ascii	"wb\000"
	.align	2
$LC12:
	.ascii	"P1\012\000"
	.align	2
$LC13:
	.ascii	"%d %d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,832,$31		# vars= 800, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-832
	sw	$31,828($sp)
	sw	$fp,824($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,832($fp)
	sw	$5,836($fp)
	lw	$2,836($fp)
	addiu	$2,$2,4
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$2,836($fp)
	addiu	$2,$2,8
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$2,836($fp)
	addiu	$2,$2,12
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,40($fp)
	lw	$2,40($fp)
	lw	$3,36($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(crear_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,crear_mapa
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,44($fp)
	lw	$2,836($fp)
	lw	$2,16($2)
	sw	$2,48($fp)
	lw	$2,%got($LC7)($28)
	addiu	$5,$2,%lo($LC7)
	lw	$4,48($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,52($fp)
	lw	$2,52($fp)
	beq	$2,$0,$L46
	nop

	b	$L47
	nop

$L51:
	addiu	$3,$fp,568
	lw	$2,%got($LC8)($28)
	addiu	$5,$2,%lo($LC8)
	move	$4,$3
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,56($fp)
	lw	$2,%got($LC8)($28)
	addiu	$5,$2,%lo($LC8)
	move	$4,$0
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$4,$2
	lw	$2,%call16(atoi)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,atoi
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,60($fp)
	lw	$3,56($fp)
	lw	$2,40($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L48
	nop

	lw	$3,60($fp)
	lw	$2,36($fp)
	sltu	$2,$2,$3
	beq	$2,$0,$L49
	nop

$L48:
	lw	$2,%got($LC9)($28)
	addiu	$4,$2,%lo($LC9)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$6,60($fp)
	lw	$5,56($fp)
	lw	$2,%got($LC10)($28)
	addiu	$4,$2,%lo($LC10)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,1			# 0x1
	b	$L54
	nop

$L49:
	lw	$2,56($fp)
	lw	$3,60($fp)
	lw	$6,36($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%got(mapear_posicion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mapear_posicion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,64($fp)
	lw	$3,44($fp)
	lw	$2,64($fp)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sb	$3,0($2)
$L47:
	addiu	$2,$fp,568
	lw	$6,52($fp)
	li	$5,256			# 0x100
	move	$4,$2
	lw	$2,%call16(fgets)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L51
	nop

$L46:
	sw	$0,28($fp)
	b	$L52
	nop

$L53:
	addiu	$2,$fp,68
	lw	$7,28($fp)
	lw	$6,832($fp)
	lw	$5,836($fp)
	move	$4,$2
	lw	$2,%got(set_filename)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,set_filename
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$3,$fp,68
	lw	$2,%got($LC11)($28)
	addiu	$5,$2,%lo($LC11)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$7,24($fp)
	li	$6,3			# 0x3
	li	$5,1			# 0x1
	lw	$2,%got($LC12)($28)
	addiu	$4,$2,%lo($LC12)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$7,40($fp)
	lw	$6,36($fp)
	lw	$2,%got($LC13)($28)
	addiu	$5,$2,%lo($LC13)
	lw	$4,24($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$5,24($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(fputc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$7,24($fp)
	lw	$6,36($fp)
	lw	$5,40($fp)
	lw	$4,44($fp)
	lw	$2,%got(dump)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,dump
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$6,36($fp)
	lw	$5,40($fp)
	lw	$4,44($fp)
	lw	$2,%got(avanzar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,avanzar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L52:
	lw	$3,28($fp)
	lw	$2,32($fp)
	sltu	$2,$3,$2
	bne	$2,$0,$L53
	nop

	lw	$2,40($fp)
	move	$5,$2
	lw	$4,44($fp)
	lw	$2,%got(liberar_mapa)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,liberar_mapa
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
	move	$2,$0
$L54:
	move	$sp,$fp
	lw	$31,828($sp)
	lw	$fp,824($sp)
	addiu	$sp,$sp,832
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
