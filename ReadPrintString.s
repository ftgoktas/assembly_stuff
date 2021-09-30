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
	li		$v0, 8		# Tell syscall to read in a string
	la		$a0, buffer	# Maximum number pf characters
	li		$a1, 100	# Maximum number of characters
	syscall

	li		$v0, 4		# Tell syscall to print a string
	la		$a0, buffer	# Tell syscall what to print
	syscall				# Print it

	jr		$ra



