.data
msg1: .asciiz " Enter number 1 " 
msg2: .asciiz " Enter number 1 "
msg3: .asciiz " Enter number 1 "
msg4: .asciiz "Result"
#msg5: .asciiz "  years old now. Stay blessed***  "

.text
.globl main
.ent main
main:
    li $v0,4 
    la $a0,msg1      #name
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,4 
    la $a1,msg2      #name
    syscall

    li $v0,5
    syscall
    move $t1,$v0

    li $v0,4 
    la $a2,msg3      #name
    syscall

    li $v0,5
    syscall
    move $t2,$v0

    jal average

    move $t3,$v0
    li $v0,4 
    la $a0,msg4      #name
    syscall

    li $v0,1
    move $a0,$t3
    syscall

    jr $ra

.end main
.globl average
.ent average
average:
    
    addi $sp,$sp,-16
    sw $s0,0($sp)
    sw $s1,4($sp)
    sw $s2,8($sp)
    sw $s3,12($sp)

    add $s0,$a0,$a1
    add $s1, $s0,$a2
    addi $s4,$s1,1

    li $s5,3
    div $s4,$s5
    mflo $s6

    move $v0,$s7
    lw $s3,12($sp)
    lw $s2,8($sp)
    lw $s1,4($sp)
    lw $s0,0($sp)

    addi $sp,$sp,16
    jr $ra
.end average