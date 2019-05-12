.data
    msg1: .asciiz "Enter the value of x"
    msg2: .asciiz "Enter the value of y"
    msg3: .asciiz "Enter the value of z"
   # msg4: .asciiz "Enter the value of x"
    result: .asciiz "The result of x-y+z - 12 is"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0 , 5
    syscall 
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0 , 5
    syscall
    move $t1, $v0
    
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0 , 5
    syscall
    move $t2, $v0

    sub $t3,$t0,$t1
    add $t4, $t3,$t2
    addi $t5, $t4, -12

    li $v0,5
    la $v0,result
    syscall
    li $v0,1
    move $a0, $t5
    syscall
    jr $ra
.end main
