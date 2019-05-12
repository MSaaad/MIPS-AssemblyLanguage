.data
num: .asciiz "Enter the number :  "
pow: .asciiz "Enter the power : "
result1: .asciiz " power "
result2: .asciiz " gives: "
.text
.globl main
main:
number:
    addi $s2,$zero,0 #s2=0 to input x and 1 to input y
    li $v0,4
    la $a0,num
    syscall  #print string1

    li $v0,5
    syscall  #read int

    slt $s3,$v0,$s0 #$s3=($v0<$s0) if(x<21) $s1=1
    move $t0,$v0
power:
    addi $s2,$zero,1
    li $v0,4
    la $a0,pow
    syscall  #print string2

    li $v0,5
    syscall  #read int
    slt $s3,$v0,$s1 #$s3=($v0<$s1) if(x<6) $s3=1
    move $t1,$v0

    beq $t1,$zero,else #if (t1=0) t2=1, t1=y,t2=result
    addi $t2,$zero,1
    addi $s4,$zero,0

loop:  #if s4<t1
    slt $s5,$s4,$t1 #$s5=($s4<$t1)
    beq $s5,$zero,result 
    mul $t2,$t2,$t0 #t2=t2*t0
    addi $s4,$s4,1
    jal  loop

else:
    addi $t2,$zero,1
    jal result

result:
    li $v0,1
    move $a0,$t0
    syscall  #print X
    li $v0,4
    la $a0,result1
    syscall  #print " raised to "
    
    li $v0,1
    move $a0,$t1
    syscall  #print Y

    li $v0,4
    la $a0,result2
    syscall  #print " gives "
    
    li $v0,1
    move $a0,$t2
    syscall  #print result(t2)

    li $v0,10
    syscall  #exit
