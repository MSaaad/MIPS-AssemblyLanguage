.data
    var: .word 30,20
    temp: .asciiz "Enter temperature: "
    hot: .asciiz "Its hot today"
    pleasant: .asciiz "Its pleasant today"
    cold: .asciiz "Its cold today"
.text
.globl main
.ent main
main:
    la $s0, var
    lw $s1, 0($s0)
    lw $s2, 4($s0)
    li $v0, 4
    la $a0, temp
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    slt $t1,$s1,$t0
    bne $t1,$0,HOT
    j out
    out:
        slt $t2,$t0,$s1
        bne $t2,$0, label
        label: slt $t3, $s2,$t0
        bne $t3,$0,PLEASANT
        j out2
    out2:
        slt $t4, $s2, $t0
        beq $t4,$0,COLD
    HOT:
        li $v0 , 4
        la $a0, hot
        syscall
        jr $ra
    PLEASANT:
        li $v0 , 4
        la $a0, pleasant
        syscall
        jr $ra
    COLD:
        li $v0 , 4
        la $a0, cold
        syscall
        jr $ra

    
