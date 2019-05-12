.data
	.word 7
	.word 3
.text
.globl main
.ent main
main:
	lui $s0 , 0x1001
	lw  $t1 0($s0)    
	lw  $t2 4($s0)    
	sw  $t1 4($s0)
	sw  $t2 0($s0)
	jr $ra
.end main 