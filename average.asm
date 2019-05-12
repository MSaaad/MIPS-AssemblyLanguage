.data
   msg1: .asciiz " Please enter an integer: "
   msg2: .asciiz " Please enter an integer: "
   msg3: .asciiz " Please enter an integer: "
   result: .asciiz "The average is: "

.text
main:

   li $v0, 4        # syscall to print string
   la $a0, msg1
   syscall

   # Read integer1
   li $v0, 5        # syscall to read an integer
   syscall
   move $t0, $v0        # move number to read into $t0

   # Prompt the user to enter integer 2.
   li $v0, 4
   la $a0, msg2
   syscall

   # Read integer2
   li $v0,5
   syscall
   move $t1, $v0

   # Prompt the user to enter integer 3.
   li $v0, 4
   la $a0, msg3
   syscall

   # Read integer3
   li $v0,5
   syscall
   move $t2, $v0


   # add all integers to $t5
   add $t3, $t0, $t1
   add $t4,$t3,$t2

   # Divide Sum / count
   addi $s0,$0, 3
   div $t4, $s0

   # retrieve it
   mflo $t5
   #print out the average
    li $v0 , 4
    la $a0, result          #Loading the message
    syscall

    li $v0, 1
    move $a0, $t5           #Loading the result
    syscall
    jr $ra

.end main