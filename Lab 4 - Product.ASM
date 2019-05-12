.data
    msg1: .asciiz "Enter first number :"       #Taking input integer 1
    msg2: .asciiz "Enter second number :"      #Taking input integer 2
    result: .asciiz "The Product is :"         #Product Result
.text
.globl main
.ent main
main:
    li $v0, 4                
    la $a0, msg1               #Loading the message 
    syscall                    #Showing it on console
    li $v0,5                   #Loading the input integer
    syscall                    
    move $t0, $v0              #moving the int value in register $t0
    
    li $v0, 4                #Loading the message
    la $a0, msg2             
    syscall
    li $v0,5               #Loading second integer value
    syscall
    move $t1, $v0          #Moving the int value in register $t1

    mult $t0,$t1           #Multiplying the contents of both registers
    mflo $t2               #Moving least significant 32 bits in $t2
    
    li $v0 , 4
    la $a0, result          #Loading the message
    syscall
    li $v0, 1                #Loading the result
    move $a0 , $t2           #Moving the value of answer in $a0
    syscall                  #Calling the answer in console 

    jr $ra
.end main
