	.data
MSG1:	.asciiz 		"Please enter in a single number: "
	.text
	.globl		main
main:
	li		$v0,4			    #Tell syscall to print a string
	la		$a0,MSG1		  #Get address of string
	syscall
	li		$v0, 5		    # Tell syscall to read an integer
	syscall				      # Read the integer
	move		$s0, $v0		# Save the read integer
	li		$v0, 1		    # Tell syscall to print an integer
	move		$a0,$s0		  # Move number to $a0
	syscall
	jr		$ra
