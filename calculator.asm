
.data
option: .asciiz "Which operation you want to perform? \n"
select: .asciiz "Press 1 for ADDITION ----- 2 for SUBTRACTION ------ 3 for MULTIPLICATION ------ 4 for DIVISION ! "
num1: .asciiz "Enter the number :  "
num2: .asciiz "Enter the number : "
result1: .asciiz " Answer "

.text
.globl main

main:
    li $v0,4
    la $a0,option    #Displaying the message
    syscall
    
    li $v0,4
    la $a0,select       #Asking for the operation
    syscall
    li $v0,5           #Read int
    syscall
    move $t0, $v0 

    li $v0,4
    la $a0,num1            #User input 1
    syscall  
    li $v0,5
    syscall
    move $t1, $v0 

    li $v0,4
    la $a1,num2           #User input 2
    syscall  
    li $v0,5
    syscall
    move $t2, $v0 

    addi $t3,$t3,1    #Initializing with 1
    addi $t4,$t4,2    #Initializing with 2
    addi $t5,$t5,3    #Initializing with 3
    addi $t6,$t6,4     #Initializing with 4
    
    beq $t0,$t3,adding       #selction = 1 goto add
    beq $t0,$t4,subtract    #selction = 2 goto sub
    beq $t0,$t5,multi         #selction = 3 goto mult
    beq $t0,$t6,divide          #selction = 4 goto div

adding:
    add $s0,$t1,$t2    #Adding input

    jal resultadd      #Goto resultadd function
    jr $ra

subtract:
    sub $s1,$t1,$t2     #SUbtracting inputs

    jal resultsub       #Goto resultsub function
    jr $ra

multi:
    mult $t1,$t2       #Multiplying inputs
    mflo $s2          

    jal resultmult   #Goto resultmult function
    jr $ra

divide:
    div $t1,$t2       #Dividing inputs
    mflo $s3          

    jal resultdiv      #Goto resultdiv function
    jr $ra

resultadd:
    li $v0 , 4
    la $a0, result1          #Loading the message
    syscall

    li $v0, 1                #Loading the result
    move $a0 , $s0         
    syscall

resultsub:
    li $v0 , 4
    la $a0, result1          #Loading the message
    syscall

    li $v0, 1                #Loading the result
    move $a0 , $s1          
    syscall

resultmult:
    li $v0 , 4
    la $a0, result1          #Loading the message
    syscall

    li $v0, 1                #Loading the result
    move $a0 , $s2          
    syscall

resultdiv:
    li $v0 , 4
    la $a0, result1          #Loading the message
    syscall

    li $v0, 1                #Loading the result
    move $a0 , $s3          
    syscall

    jr $ra 
.end main