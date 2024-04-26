# Author: Coleton Watt
# Date: 
# Description: 

.data  # Data used by the program
	prompt1: .asciiz "Enter Fibb Number: "


.text  # Instructions/code of the actual program

.globl main
main:
	la $a0, prompt1
	jal promptReturnInt
	move $s0, $v0
	
	move $a0, $s0
	jal Start_Fibo
	move $s1, $v0
	
	move $a0, $s1
	jal printInt


end_main:
	jal Exit


################################################################
# Procedure 
# Functional Description: 

# Argument parameters: 
# Return Value: 
################################################################
.data

.text
Start_Fibo:
	#Begin register in the stack from Stack
	subi $sp, $sp, 36
	sw $ra, 32($sp)
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)
	sw $s3, 16($sp)
	sw $s4, 12($sp)
	sw $s5, 8($sp)
	sw $s6, 4($sp)
	sw $s7, 0($sp)
	#End save register from Stack
Fibo:

	move $s0, $a0
	
	blt $s0, 2, fib_base_case
	
	sub $a0, $s0, 1
	jal Start_Fibo
	move $s1, $v0 #$s1 = fibo of n-1
	
	sub $a0, $s0, 2
	jal Start_Fibo
	move $s2, $v0
	
	add $v0, $s1, $s2 #v0 = fib(n-1) + fib(n-2)
	j End_Fibo
	
	
	fib_base_case:
		li $v0, 1
	

End_Fibo:
	#Begin restore registers from Stack
	lw $ra, 32($sp)
	lw $s0, 28($sp)
	lw $s1, 24($sp)
	lw $s2, 20($sp)
	lw $s3, 16($sp)
	lw $s4, 12($sp)
	lw $s5, 8($sp)
	lw $s6, 4($sp)
	lw $s7, 0($sp)
	addi $sp, $sp, 36 
	#End restore registers from Stack
	
	jr $ra

#################################
.include "utilities.asm" #at the end of the file
