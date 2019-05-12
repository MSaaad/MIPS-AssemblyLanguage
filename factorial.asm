.data
msg1 : .asciiz "Enter the number for its factorial: "
msg2 : .asciiz "Factorial is 1 "
msg3 : .asciiz "Doesn't exist "
msg4 : .asciiz "The factorial is: "
.text 
.globl main
.ent main

main:

    li $v0, 4
    la $a0, msg1
    syscall     

    li  $v0, 5   #read the input
    syscall
    move $t0,$v0

    addi $t1, $0, 0
    addi $s0, $0, 1
    addi $s1, $0, 0
check:
    beq $t0, 0, zero
    slt $s1, $t0, $0
    bne $s1, $0, negative
    slt $t5, $t1, $t0
    bne $t5, $0, fact

    li $v0 , 4
    la $a0, msg4          #Loading the message
    syscall

    li $v0, 1
    move $a0, $s0
    syscall
    jr $ra
    
zero:
    li $v0 , 4
    la $a0 , msg2
    syscall 
    jr $ra
negative:
    li $v0 , 4
    la $a0 , msg3
    syscall 
    jr $ra
fact:
    addi $t1,$t1,1
    mult $s0, $t1
    mflo $s0

    j check
    
jr $ra
.end main