# Author: Coleton Watt
# Date: December 8, 2022
# Description: get 4 numbers and then compare numbers 

.data
	prompt1: .asciiz "Enter first number: "
	prompt2: .asciiz "Enter second number: "
	prompt3: .asciiz "Enter third number: "
	prompt4: .asciiz "Enter fourth number: "

	average: .asciiz "The average is: "
	
	largest: .asciiz "The largest is: "

.text
#Subprogram largestAndAverage($a1, $a2, $a3, $a4)
#{
#	int var0 = $a0, var1 = $a1, var2 = $a2, var3 = $a3;
#	$s0 = getLarger($a1, $a2);
#	$v0 = getLarager(s0, $a4); // Largest is in $v0
#	$v1 = (var0 + var1 + var2 + var3)/ 4; // (Integer) Average is in $v1
#	return;
#}

#Subprogram getLarger($a0, $a1) {
#	$v0 = $a0
#	if ($a1 > $a0)
#	$v0 = $a1
#	return;
#}

.globl main

main:
	# register conventions
	# $s0 - num1
	# $s1 - num2
	# $s2 - num3
	# $s3 - num4
	# $s4 - largest
	# $s5 - average
	
	# TODO: First numb
	la $a0, prompt1
	jal PromptInt
	move $t0, $v0
	
	# TODO: Second numb
	la $a0, prompt2
	jal PromptInt
	move $t1, $v0
	
	# TODO: Third numb
	la $a0, prompt3
	jal PromptInt
	move $t2, $v0
	
	# TODO: Fourht numb
	la $a0, prompt4
	jal PromptInt
	move $t3, $v0
	
 	# TODO: Call Function
	# .......
	# jal Largest_Avg
	# .......
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
	move $a3, $t3
	jal Start_Largest_Avg
	move $s0, $v0 #s0 has largest 
	move $s1, $v1 #s1 avergage
	
	
	
	# TODO: Print the largest
	la $a0, largest
	move $a1, $s0
	jal PrintInt
	
	
	jal PrintNewLine
	
	# TODO:  Print average
	la $a0, average
	move $a1, $s1
	jal PrintInt
	
	jal Exit
	
###############################################################
# YOUR PRECEDURES HERE ...........
###############################################################



################################################################
# Procedure: Largest_Avg
# Functional Description:  get largest number and average

# Argument parameters: $a0... $a3 for all numbers
# Return Value: $v0 largest number, $v1 average number
################################################################
.data

.text
Start_Largest_Avg:
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
Largest_Avg:
	move $s7, $a0
	move $s6, $a1
	move $s5, $a2
	move $s4, $a3
	
	largerNumbers:
		move $a0, $s7
		move $a1, $s6
		jal Start_Get_Larger
		move $s0, $v0 #s0 has lagrest of a0 and a1
	
		move $a0, $s4
		move $a1, $s5
		jal Start_Get_Larger
		move $s1, $v0 #s1 has largest of a3 and a2
	
		move $a0, $s1
		move $a1, $s0
		jal Start_Get_Larger
		move $s0, $v0 #s0 has lagrets of s0 s1
	
	averageNumbers:
		add $t1, $s7, $s6
		add $t2, $s4, $s5
		add $t3, $t1, $t2 #t3== a1+a2+a3+a4
		div $s1, $t3, 4 #s1 = t3/4
	
	move $v0, $s0
	move $v1, $s1
End_Largest_Avg:
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



################################################################
# Procedure: Get_Larger
# Functional Description:  Get largest number of any two numbers

# Argument parameters: $a0 $a1 for numbers
# Return Value: $v0 larger
################################################################
.data

.text
Start_Get_Larger:
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
Get_Larger:
	move $t1, $a0
	move $t2, $a1
	
	
	bge $t1, $2, ifGreater
	j else
	ifGreater:
		move $t7, $t1 #store $s1 because bigger
		j endIf
	else:	
		move $t7, $t2 #store $s2 because bigger $s1 was smaller
	endIf:

	
	move $v0, $t7
End_Get_Larger:
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




###############################################################
.include "utils.asm"     # Do not modify this line, it has to be the last line
