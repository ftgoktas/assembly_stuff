		.data
#17/5=3 REM 2
SLASH:		.byte		'/'
EQUAL:		.byte		'='
REM:		.asciiz 		" REM "
		.text
		.globl 		main

main:
	li		$t2, 17		# Load $t2 with 17
	li		$t3, 5		# Load $t3 with 5
	div		$t2, $t3	# Do divide
					# The Quotient goes in register lo
					# The remainder goes in register hi

	li		$v0, 1		# Print an integer
	move		$a0, $t2	# Move integer to print in $a0
	syscall				# Print the integer
	li		$v0, 11		# Print a byte
	lb		$a0, SLASH	# Load the byte
	syscall
	li		$v0, 1		# Print an integer
	move		$a0, $t3	# Move the integer into $a0
	syscall
	li		$v0, 11		# Print a byte
	lb		$a0, EQUAL	# Load the byte
	syscall

	li		$v0, 1		# Print an integer
	mflo		$a0		# Move answer into $a0
	syscall
	li		$v0, 4		# Print a string
	la		$a0, REM	# Load the address of the string
	syscall				# Print the string
	li		$v0, 1		# Tell it to print an integer
	mfhi		$a0		# Moves remainder into $a0
	syscall
	jr		$ra




