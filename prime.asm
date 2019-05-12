.data
	msg1: .asciiz "Enter Number: "
	msg2: .asciiz "It is a Composite Number! "
	msg3: .asciiz "It is a Prime Number! "

.text
.globl main
.ent main

main:
	 # Enter Number
	li $v0,4
	la $a0,msg1
	syscall

	 # Taking Input	
	li $v0,5
	syscall
	move $t0,$v0 # input in $t0
		
	addi $t1,$t1,2  # dividing numbers in $t1
loop: 
	slt $t4,$t1,$t0
	bne $t4,$0,divide	
	
	li $v0,4
	la $a0,msg3
	syscall
	jr $ra

divide:
	div $t0,$t1
	mfhi $t3 	# divide of answer in $t3
	beq $t3,$0,primeNumber
	addi $t1,$t1,1
	j loop	

primeNumber: 
	li $v0,4
	la $a0,msg2
	syscall

	jr $ra
.end main