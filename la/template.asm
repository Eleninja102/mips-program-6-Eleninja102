# Author: 
# Date: 
# Description: 

.data  # Data used by the program

.text  # Instructions/code of the actual program
.globl main
main:


exit:
	#exit the program using syscall 10 - exit
	li $v0, 10
	syscall
	

###############################################################
# Desc: PROCEDURE DESCRIPTION
# Argument parameters:
# $a0 - IF APPLICABLE
# $a1 - IF APPLICABLE
# $a... - IF APPLICABLE
# Return Value:
# $v0 - IF APPLICABLE
# Uses: 
# $s0: IF APPLICABLE (required)
# $s...: IF APPLICABLE (required)
procedure_name:
	##### Begin Save registers to Stack
	subi  $sp, $sp, 36
	sw   $ra, 32($sp)
	sw   $s0, 28($sp)
	sw   $s1, 24($sp)
	sw   $s2, 20($sp)
	sw   $s3, 16($sp)
	sw   $s4, 12($sp)
	sw   $s5, 8($sp)
	sw   $s6, 4($sp)
	sw   $s7, 0($sp)
	##### End Save registers to Stack

	# Now your function begins here
	# move $s0, $a0   # If you are taking params
	
	# .............
	

end_procedure_name:
	##### Begin Restore registers from Stack
	lw   $ra, 32($sp)
	lw   $s0, 28($sp)
	lw   $s1, 24($sp)
	lw   $s2, 20($sp)
	lw   $s3, 16($sp)
	lw   $s4, 12($sp)
	lw   $s5, 8($sp)
	lw   $s6, 4($sp)
	lw   $s7, 0($sp)
	addi $sp, $sp, 36
	##### End Restore registers from Stack
    jr $ra

## OTHER PROCEDURES ...



############# LAST LINE ###########################
# Do not remove this line. IT MUST BE THE LAST ONE
.include "utils.asm"

