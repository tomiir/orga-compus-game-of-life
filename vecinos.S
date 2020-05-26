
#include<sys/regdef.h>

#define SS 32

/* SRA */
#define O_GP 28
#define O_FP 24

/* LTA */
#define O_LTA_CONT 0
#define O_LTA_I 4

#define O_LTA_J 8
#define O_LTA_X 12

#define O_LTA_Y 16
#define O_LTA_POS 20

/* ABA */
#define O_A0 (SS)
#define O_A1 (O_A0 + 4)
#define O_A2 (O_A1 + 4)
#define O_A3 (O_A2 + 4)

/* Extra Regs*/
#define O_A4 (SS + 16)


#define END_LOOP 2

.text
.align 2


.globl vecinos
.ent vecinos

vecinos:
    subu sp, sp, SS
    
    /* Saved Register Area 8B */
    sw   gp, O_GP(sp)
    sw   fp, O_FP(sp)
    move fp, sp

    /* Store in Argument Building Area */
    sw   a0, O_A0(fp)
    sw   a1, O_A1(fp)
    sw   a2, O_A2(fp)
    sw   a3, O_A3(fp)

    /* Local and temporary area 16B (2 int, 2 uint) */
    /* contador = 0*/
    lw t0, 0
    sw t0, O_LTA_CONT(fp)

    /* i = -1*/
    lw t0, -1
    sw t0, O_LTA_I(fp)

    /* j = -1*/
    lw t0, -1
    sw t0, O_LTA_J(fp)

    /* _x */
    lw t0, 0
    sw t0, O_LTA_X(fp)

    /* _y */
    lw t0, 0
    sw t0, O_LTA_Y(fp)

    /* pos */
    lw t0, 0
    sw t0, O_LTA_POS(fp)

    /* Planteo de loop */

    lw t0, O_LTA_I(fp)  		# i = -1  
    li t1, END_LOOP	 		# i_j_fin = 2  

start_loop_1:  
	beq t0, t1, end_loop_1  
	lw t2, O_LTA_J(fp)  		# j = -1  

start_loop_2:  
  	beq t2, t1, end_loop_2  
  	
/* ========= CUERPO LOOP ========== */
_x:
	lw t3, O_LTA_X(fp)	 		# t3 = _x
	lw t4, O_A1(fp)				# t4 = x
	lw t5, O_A3(fp)				# t5 = filas
	addi t3, t4, t0	  	  		# _x = x + i

	bneg t3, jump_map_x
	
	div t3, t5
	mfhi t3						#_x = _x % filas
	b _y
	
jump_map_x:
	sub t3, t5, 1				# _x = filas - 1
	b _y


_y:
	lw t6, O_LTA_Y(fp)			# t6 = _y
	lw t7, O_A2(fp)				# t7 = y
	lw t8, O_A4(fp)				# t8 = cols
	addi t6, t7, t2  	  		# _y = y + j

	bneg t6, jump_map_y

	DIV t6, t8
	MFHI t6					#_y = _y % cols
	b pos
	
jump_map_y:
	sub t6, t8, 1				# _y = cols - 1
	b pos

pos:
	mult t9, t6, t8			# pos = _y * cols
	addi t9, t9, t3			# pos = pos + _x

mapa: 
	lw t4, O_A0(fp)			# libero la ref a x (t4) y t4 = mapa
	or t5, t0, t2			# libero la ref a filas (t5) y t5 = i | j
	beq t5, 0, end_loop_body	# si estoy en la celda actual salteo al fin del loop

	addi t7, t4, t9			# t7 = mapa + pos
	lw t7, ($t7)				# t7 = *t7

	beq t7, 0, end_loop_body	# si la celda vecina está apagada, no la cuento como vecino

	lw t7, O_LTA_CONT(fp)  
	addi t7, t7, 1			# contador ++
	sw t7, O_LTA_CONT(fp)   	# persisto contador para futuras iteraciones



/* ========= FIN CUERPO LOOP ========== */

end_loop_body:

  	addi t2, t2, 1    # j++  
  	b start_loop_2  

end_loop_2:
	addi t0, t0, 1    # i++ 
	b start_loop_1  

end_loop_1: 
    /* return contador */
    lw v0, O_LTA_CONT(fp)

    /* Stack unwinding */
    lw fp, O_FP(sp)
    lw gp, O_GP(sp)
    addiu sp, sp, SS

    jr ra
.end vecinos
