


.data
msg1 : .asciiz "Enter the number for sum of the series: "
msg3 : .asciiz "The result is : "

.text 

.globl main

.ent main

main:

    li $v0, 4
    la $a0, msg1
    syscall     

    li  $v0, 5   #read the input
    syscall

    addi    $s0, $v0, 1    #s0= the number from the keyboard + 1 (the limit)

    li  $t0, 1        #counter set to 1
    loop:

        beq $t0, $s0, exit      #if the counter becomes equal tothe limit, exit the loop
        add $t1, $t1, $t0       #add the counter to the sum to this point
        addiu $t0, $t0, 1     #add 1 to the counter for each loop

    j loop                      #go to the "loop" label above

    exit:
    li $v0 , 4
    la $a0, msg3          #Loading the message
    syscall

    li  $v0, 1
    move $a0, $t1              #Loading the result
    syscall
    
    jr $ra
.end main