.data
    msg1: .asciiz "Enter Divident :"       #Taking input integer 1
    msg2: .asciiz "Enter Divisor :"        #Taking input integer 2
    result1: .asciiz "The Quotient is :"         #Quotient Result
    result2: .asciiz "The Remainder is :"         #Remainder Result
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

    div $t0,$t1           #Dividing the contents of both registers
    mflo $t2               #Moving Quotient in $t2
    mfhi $t3               #Moving Remainder in $t3
    
    li $v0 , 4
    la $a0, result1          #Loading the message
    syscall
    li $v0, 1                #Loading the result
    move $a0 , $t2           #Moving the value of Quotient in $a0
    syscall                  #Calling the answer in console 
    
    li $v0 , 4
    la $a0, result2          #Loading the message
    syscall
    li $v0, 1                #Loading the result
    move $a0 , $t3           #Moving the value of Remainder in $a0
    syscall                  #Calling the answer in console 

    jr $ra
.end main
