	.data
MSG1:	.asciiz "The numbers 10 and 20 added together are:"
	.text
	.globl		main
main:
	li		$t1,10		#Loads the number 10 into $t1
	li		$t2,20		#Loads the number 20 into $t2
	add		$t1,$t1,$t2	#$t1 = $t1 + $t2
	li		$v0,4		#Print out a string
	la		$a0,MSG1	#Get address of string
	syscall				#Printing the string
	li		$v0,1		#Tell syscall to print a number
	move 		$a0,$t1		#Move number to $a0
	syscall
	jr		$ra
