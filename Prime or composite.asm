# -------- Prime Number ---------- #
.data
    
    msg1 : .asciiz "Enter the number : "
    msg2 : .asciiz "The result is: "
    msg3 : .asciiz "Prime number : "
    msg4 : .asciiz "Composite number : "
    
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msg1
    syscall                    #Displaying the temperature

    li $v0, 5
    syscall                 #User Input
    move $t3, $v0          #Saved in $t0

    addi $t0,$t0,2
    addi $t1,$t1,10

# for i in range(m):
   # i %2
   # i$3
   slt $t2, $t0,$t1
   slt $t4, $t0, $t3
   div $t2,$t4
   mflo $t6

   bne $t6,$0,else

    li $v0,4              
    la $a0 , msg4          #Result message Displaying
    syscall
else:
    
    li $v0,4              
    la $a0 , msg3          #Result message Displaying
    syscall
    jr $ra








jr $ra
.end main
