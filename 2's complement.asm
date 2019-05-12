.data
    msg1: .asciiz "Enter the number :"
    msg2: .space 32
   # msg3: .asciiz "Enter the value of z"
   # msg4: .asciiz "Enter the value of x"
    result: .asciiz "2's Complement is :"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0,5
    syscall
    move $t0, $v0

    nor $t1, $t0,$0
 #   sll $t3 ,$t1 16
#    sra $t3 , $t3,16
    addi $t2,$t1,1

    li $v0 , 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0 , $t2
    syscall 



    jr $ra
.end main
