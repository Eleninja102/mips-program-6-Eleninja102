# Author: Coleton Watt
# Date: Dec 5, 2022
# Description:  recurisive multiplier

.data  # Data used by the program
	prompt1: .asciiz "Enter the Multiplicand?: "
	prompt2: .asciiz "Enter Multiplier: "
	result: .asciiz "The result is: "
	
.text  # Instructions/code of the actual program

.globl main
main:
	la $a0, prompt1
	jal promptReturnInt #print promt1 and get multicand in $v0
	move $s0, $v0
	
	la $a0, prompt2
	jal promptReturnInt #print promt1 and get multicand in $v0
	move $s1, $v0
	
	#call multipliier
	move $a0, $s0
	move $a1, $s1
	jal Start_Multipy
	move $s2, $v0
	
	la $a0, result
	jal printString #print string 
	
	move $a0, $s2
	jal printInt #print int
	


end_main:
	jal Exit



################################################################
# Procedure: Multipy
# Functional Description: Multiply Two numbers

# Argument parameters: $a0 multiplicand, $a1 multiplier
# Return Value: n == 1? m: m+mulitpy(m, n-1)

#int mulitpy( int m, int n){
#}
################################################################
.data

.text
Start_Multipy:
	#Begin register in the stack from Stack
	subi $sp, $sp, 8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	#End save register from Stack
Multipy:

	
	seq $t0, $a1, $zero #if a1 == 0
	add $v0 $zero, $0
	bnez $t0, End_Multipy
	
	
	
	addi $a1, $a1, -1
	jal Start_Multipy
	lw $a0, 4($sp)
	add $v0, $a0, $v0

	
End_Multipy:
	#Begin restore registers from Stack
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	#End restore registers from Stack
	
	jr $ra

#################################
.include "utilities.asm" #at the end of the file
