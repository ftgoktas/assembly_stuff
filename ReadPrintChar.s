	.data
MSG1:	.asciiz "Enter in a string, max 100 characters\n"
buffer:	.space 100
buff:	.byte ' '
	.text
	.globl main
main:
	li		$v0,4		#Tell syscall to print a string
	la		$a0,MSG1	#Get address of string
	syscall
	li		$v0, 12		# Tell syscall to read in a character
					# It puts the character into $v0
	syscall
	la		$s0, buff
	sb		$v0, 0($s0)	# How to store a byte 

	lb		$a0, buff	# Load the byte
	la		$v0, 11		# Tell syscall to print a character
					# The character is in $a0
	syscall				# Print it

	jr		$ra
