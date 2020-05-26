#include<sys/regdef.h>

#define SS 24

#define O_GP 20
#define O_FP 16

#define O_LTA_D 0
#define O_LTA_S 4
#define O_LTA_N 8

#define O_A0 (SS)
#define O_A1 (O_A0 + 4)
#define O_A2 (O_A1 + 4)

.text
.align 2


.globl vecinos
.ent vecinos

vecinos:
    subu sp, sp, SS
    
    /* Saved Register Area */
    sw   gp, O_GP(sp)
    sw   fp, O_FP(sp)
    move fp, sp

    /* Store in Argument Building Area */
    sw   a0, O_A0(fp)
    sw   a1, O_A1(fp)
    sw   a2, O_A2(fp)
    sw   a3, O_A3(fp)

    /* Load 5th param 
    	lw  t0, (SS+16)(fp)
    	sw  t0, O_A4(fp)		
	*/
    /* Local and temporary area */
    /* contador = 0*/
    lw t0, 0
    sw t0, O_LTA_CONT(fp)

    /* i = 0*/
    lw t0, 0
    sw t0, O_LTA_I(fp)

    /* j = 0*/
    lw t0, 0
    sw t0, O_LTA_J(fp)

    /* pos */
    lw t0, 0
    sw t0, O_LTA_POS(fp)

    /* TODO: Implementar */


    /* return contador */
    lw v0, O_LTA_CONT(fp)

    /* Stack unwinding */
    lw fp, O_FP(sp)
    lw gp, O_GP(sp)
    addiu sp, sp, SS

    jr ra
.end strlcpy