#include<sys/regdef.h>

#define SS 32

#define O_GP 28
#define O_FP 24

#define O_LTA_CONT 0
#define O_LTA_I 4
#define O_LTA_J 8

#define O_LTA_X 12
#define O_LTA_Y 16
#define O_LTA_POS 20
/*padding 4B*/

#define O_A0 (SS)
#define O_A1 (O_A0 + 4)
#define O_A2 (O_A1 + 4)
#define O_A3 (O_A2 + 4)

#define END_LOOP 1

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

    /* TODO: Implementar */

    lw $t0, O_LTA_I(fp)  		# i = -1  
  	lI $t1, END_LOOP	 		# i_j_fin = 1  

start_loop_1:  
	beq $t0, $t1, end_loop_1  
	lw $t2, O_LTA_J(fp)    		# j = -1  

start_loop_2:  
  	beq $t2, $t1, end_loop_2  
  	
/* ========= CUERPO FUNCION ========== */



/* ========= FIN CUERPO FUNCION ========== */


  	addi $t2, $t2, 1    # j++  
  	b start_loop_2  

end_loop_2:
	addi $t0, $t0, 1    # i++ 
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