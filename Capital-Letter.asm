.data
    msg3: .asciiz "Enter the value of z"
    msg4: .asciiz "Enter the value of x"
    result: .asciiz "The product is :"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0,5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0,5
    syscall
    move $t1, $v0
    
    mult $t0,$t1
    mflo $t2
    
    li $v0 , 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0 , $t2
    syscall 



    jr $ra
.end main
