.data
    var: .word 9 , 5 , 32
    cTemp: .asciiz "Enter temperature in  celcius: "
    res: .asciiz "The result is: "
    Fah: .asciiz "`F"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, cTemp
    syscall                    #Displaying the temperature

    li $v0, 5
    syscall                 #User Input
    move $t0 , $v0          #Saved in $t0

    la $t1 , var            #Base addresses of var loaded in $t1

    lw $t2, 0($t1)         #.word 9 loaded in $t2
    mult $t0, $t2          #.word 9 is multiplied by user Input
    mflo $t3               # 9*cTemp is saved in $t3

    lw $t4, 4($t1)         #.word 5 is loaded in $t4
    addi $t3, $t3, 2       #half of divisor added to 9*cTemp for round value

    div $t3 , $t4          #9*cTemp/5
    mflo $t5                

    addi $t5 , $t5, 32       #9cTemp/5 + 32

    li $v0,4              
    la $a0 , res            #Result message Displaying
    syscall

    li $v0,1
    move $a0, $t5          #Resultant value Displaying
    syscall

    
    li $v0,4
    la $a0 , Fah        #Unit is Displaying
    syscall

    jr $ra
.end main

