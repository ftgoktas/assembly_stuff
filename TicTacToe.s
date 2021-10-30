
	.data
ttt: 	.asciiz	"0123456789"
MSG0:	.asciiz	"\n Hey \n Would you like to play Tic-Tac-Toe?\n\n"
MSG1:	.asciiz	"\Welcome to Tic-Tac-Toe\n"
MSG2:	.asciiz	"\nComputer Moves\n\n"
MSG3:	.asciiz	"\nPlayer, enter a position:"
MSG4:	.asciiz	"\nSquare number below 1\n"
MSG5:	.asciiz	"\nSquare number above 9\n"
MSG6:	.asciiz	"\nTie Game\n"
MSG7:	.asciiz	"\nThe Winner is: "
DASHES:	.asciiz	"\n-----\n"

BAR:	.byte	'|'
X:	.byte	'X'
O:	.byte	'O'
EOL:	.byte	'\n'

	.text
	.globl main
main:
	li	$v0, 4		# Tell syscall to print a string
	la	$a0, MSG0	#Load the string
	syscall			#Print the string

################################################################
# Print the board                                              #
################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

################################################################
# Get the computers first square                               #
################################################################

	li	$v0, 4			# Print a string
	la	$a0, MSG2		# Tell it computer moves
	syscall				# Print the string
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVN			# Computer moves
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t0, X			# Load the X in a register
	sb	$t0, 0($v0)		# Move x to the empty square

####################################################################
# Print the board                                                  #
####################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

#####################################################################
# Get the 1st human move                                            #
#####################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVH			# Call the human move routine
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t1, O			# Load the O in a register
	sb	$t1, 0($v0)		# Move the O in the board

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

################################################################
# Get the computers second time                                #
################################################################

	li	$v0, 4			# Print a string
	la	$a0, MSG2		# Tell it computer moves
	syscall				# Print the string
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVN			# Computer moves
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t0, X			# Load the X in a register
	sb	$t0, 0($v0)		# Move x to the empty square


###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

#####################################################################
# Get the 2nd human move                                            #
#####################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVH			# Call the human move routine
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t1, O			# Load the O in a register
	sb	$t1, 0($v0)		# Move the O in the board

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space
  
################################################################
# Get the computers third time                                 #
################################################################

	li	$v0, 4			# Print a string
	la	$a0, MSG2		# Tell it computer moves
	syscall				# Print the string
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVN			# Computer moves
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t0, X			# Load the X in a register
	sb	$t0, 0($v0)		# Move x to the empty square

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space
  
###################################################################
# Check for a winner                                              #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	WIN			# Call the routine to check for a win
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Restore the stack space
	bnez	$v0, W			# If the return value is zero then we have a winner

#####################################################################
# Get the 3rd human move                                            #
#####################################################################

  addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVH			# Call the human move routine
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t1, O			# Load the O in a register
	sb	$t1, 0($v0)		# Move the O in the board
  
###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

###################################################################
# Check for a winner                                              #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	WIN			# Call the routine to check for a win
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Restore the stack space
	bnez	$v0, W			# If the return value is zero then we have a winner

################################################################
# Get the computers fourth time                                #
################################################################

	li	$v0, 4			# Print a string
	la	$a0, MSG2		# Tell it computer moves
	syscall				# Print the string
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVN			# Computer moves
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t0, X			# Load the X in a register
	sb	$t0, 0($v0)		# Move x to the empty square

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space
  
###################################################################
# Check for a winner                                              #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	WIN			# Call the routine to check for a win
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Restore the stack space
	bnez	$v0, W			# If the return value is zero then we have a winner

#####################################################################
# Get the 4th human move                                            #
#####################################################################
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVH			# Call the human move routine
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t1, O			# Load the O in a register
	sb	$t1, 0($v0)		# Move the O in the board

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space
  
###################################################################
# Check for a winner                                              #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	WIN			# Call the routine to check for a win
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Restore the stack space
	bnez	$v0, W			# If the return value is zero then we have a winner

################################################################
# Get the computers fifth time                                 #
################################################################

	li	$v0, 4			# Print a string
	la	$a0, MSG2		# Tell it computer moves
	syscall				# Print the string
	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return address
	jal 	MOVN			# Computer moves
	lw	$ra, 4($sp)		# Restore the return address
	addiu	$sp, $sp, 4		# Return the stack space
	lb	$t0, X			# Load the X in a register
	sb	$t0, 0($v0)		# Move x to the empty square

###################################################################
# Print the board                                                 #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	PRTTTT			# Call the print routine 
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Return the stack space

###################################################################
# Check for a winner                                              #
###################################################################

	addiu	$sp, $sp, -4		# Get some stack space
	sw	$ra, 4($sp)		# Store the return register
	jal	WIN			# Call the routine to check for a win
	lw	$ra, 4($sp)		# Restore the return register
	addiu	$sp, $sp, 4		# Restore the stack space
	bnez	$v0, W			# If the return value is zero then we have a winner

###################################################################
# If no one won, it's a tie.                                      #
###################################################################

T:	li	$v0, 4			# Print a string
	la	$a0, MSG6		# Tell it computer moves
	syscall				# Print the string
	jr	$ra			#Stop the game
  
#######################################################################
# If some one has won, we are jumping here. i.e. there is a non-zero  #
# value returned in $v0 from the routine that checks for winners.     #
#######################################################################

W:	
	move	$t0, $v0			# save the winning character
	li	$v0, 4			# Tell syscall we are printing a string
	la	$a0, MSG7		# Load the message
	syscall				# Print the string
	move	$a0, $t0			# Move the winning character to $a0
	li	$v0, 11			# Tell syscall we are printing a character
	syscall
	lb	$a0, EOL		# Load the EOL character
	syscall				# Print the EOL character
	jr	$ra			# Stop the game


###################################################################
# Print the Tic-Tac-Toe game board                                #
###################################################################

PRTTTT:	
	la	$t0, ttt			# Load the board
	lb	$a0, 1($t0)		# Load the first square
	li	$v0, 11			# Tell it to print a byte
	syscall
	lb	$a0, BAR		# Print vertical bar
	syscall
	lb	$a0, 2($t0)		# Load the second square
	syscall
	lb	$a0,  BAR		# Print vertical bar
	syscall
	lb	$a0, 3($t0)		# Load the third square
	syscall
	la	$a0, DASHES
	li	$v0, 4
	syscall
	lb	$a0, 4($t0)		# Load the fourth square
	li	$v0, 11			# Tell syscall to print a byte
	syscall
	lb	$a0,  BAR		# Print vertical bar
	syscall
	lb	$a0, 5($t0)		# Load the fifth square
	syscall
	lb	$a0,  BAR		# Print vertical bar
	syscall
	lb	$a0, 6($t0)		# Print the sixth square
	syscall

	la	$a0, DASHES
	li	$v0, 4
	syscall
	lb	$a0, 7($t0)		# Load the seventh square
	li	$v0, 11			# Tell syscall to print a byte
	syscall
	lb	$a0,  BAR		# Print vertical bar
	syscall
	lb	$a0, 8($t0)		# Load the eighth square
	syscall
	lb	$a0,  BAR		# Print vertical bar
	syscall
	lb	$a0, 9($t0)		# Print the ninth square
	syscall
	lb	$a0, EOL
	syscall

	jr $ra

###############################################################################
# This is the routine the computer uses to move to the next                   #
# position. Note it just goes through the board and pick the                  #
# first available position. No error checking is done                         #
# because we know we are controlling the game and the                         #
# only time a square would not be available is after the game                 #
# is over.                                                                    #
###############################################################################

GETN:
	la 	$t0, ttt			# Get address of board
MOVN: 
	addiu 	$t0, $t0, 1 		#set it to the next position 
	lb	$t2, 0($t0) 		# Load the byte from the board.
	lb	$t1, X			# Load the letter X in $t1
	beq	$t2, $t1, MOVN		# If an X, move to another position
	lb	$t1, O			# Load the letter O in $₺1
	beq	$t2, $t1, MOVN		# If an O, move to another position
	move 	$v0, $t0			# Empty slot, return it to calling function
	jr	$ra

###########################################################################
# Get a square number from the Human player,                              #
# Must be between 1 and 9 inclusive and must be empty.                    #
# Return the space to move the 'O' to in $v0.                             #
###########################################################################

MOVH:
	la	$a0, MSG3		# Tell syscall to print string
	li	$v0, 4			# Syscall code of string
	syscall
	li	$v0, 5			# Tell it to read an integer
	syscall				# Read an integer
	li	$t1, 1			# See if it is < 1
	blt	$v0, $t1, LT1		# Print the message
	li	$t1, 9			# See if it is > 9
	bgt	$v0, $t1, GT9
	la	$t0, ttt			# Load the board
	add	$a0, $t0, $v0		# Get the square
	addiu	$sp, $sp, -4
	sw	$ra, 4($sp)
	jal	SQOK			
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4		
	beqz	$v0, MOVH
	jr	$ra			# $v0 has a good address

LT1:
	la	$a0, MSG4
	li	$v0, 4
	syscall
	j 	MOVH
GT9:
	la	$a0, MSG5
	li	$v0, 4
	syscall
	j	MOVH

###########################################################################
# Accept an address in $a0, return a 0 in $v0 if the space is occupied,   #
# The address you are checking if it is ok                                #
###########################################################################

SQOK:
	li	$v0, 0		# Set to a  NO
	lb	$t0, X		# See if it is an X 
	lb	$t1, 0($a0)	# Load the byte  of the pos
	beq	$t0, $t1, NOK	#Equal, not OK
	lb	$t0, O		# See if it is an O
	beq	$t0, $t1, NOK	#Equal, not OK
	move 	$v0, $a0	# Empty square, send it back
NOK:
	jr	$ra		# Return to calling routine

###########################################################################
# Check rows, cols and diagonals if we have a winner                      #
# only needs to be done after the 3rd computer move.                      #
###########################################################################

WIN:
	addiu	$sp, $sp, -4	# Get stack space
	sw	$ra, 4($sp)	# Store stack space
	jal	ROWS		# Check the rows
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4	# restore stack space
	bnez	$v0, WINNER	# If not zero, somebody won
	addiu	$sp, $sp, -4	# Get stack space
	sw	$ra, 4($sp)	# Store stack space
	jal	COLS		# Check the columns
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4	# restore stack space
	bnez	$v0, WINNER	# If not zero, somebody won
	addiu	$sp, $sp, -4	# Get stack space
	sw	$ra, 4($sp)	# Store stack space
	jal	DIAG		# Check the diagonals
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4	# restore stack space

	# If $v0, comes back zero there is no winner. 
	# If it comes back not zero we have a winner and we 
	# just return that back to the calling routine
WINNER:
	jr	$ra

#############################################################################################
# Check the rows to see if there is a winner. If there is a winner we return the character  #
# that won (X or O) back in $v0 otherwise we return a zero in $v0                           #
#############################################################################################

ROWS:
	addiu	$sp, $sp, -4	# Get space from the stack 
	sw	$ra, 4($sp)	# Store stack space / save of return address
	li	$a0, 1		# Check Row 1
	jal	ROW		# Check the row
	bnez	$v0, ROWW	# If $v0 not zero, Row Won
	li	$a0, 2		# Check Row 2
	jal	ROW
	bnez	$v0, ROWW	# If $v0 not zero, Row won
	li	$a0, 3		# Check Row 3
	jal 	ROW
	bnez	$v0, ROWW	# ROW win?
	li	$v0, 0		# Row did not win

ROWW:
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4	
	jr	$ra		# Go home

################################################################################################
# Check the columns to see if there is a winner. If there is a winner we return the character  #
# that won (X or O) back in $v0 otherwise we return a zero in $v0.                             #
################################################################################################

COLS:
	addiu	$sp, $sp, -4	# Get space from the stack 
	sw	$ra, 4($sp)	# Store stack space / save of return address
	li	$a0, 1		# Check Col 1
	jal	COL		# Check the col
	bnez	$v0, COLW	# If $v0 not zero, Col Won
	li	$a0, 2		# Check Row 2
	jal	COL
	bnez	$v0, COLW	# If $v0 not zero, Col won
	li	$a0, 3		# Check Col 3
	jal 	COL
	bnez	$v0, COLW	# Column win?
	li	$v0, 0		# Col did not win

COLW:
	lw	$ra, 4($sp)
	addiu	$sp, $sp, 4	
	jr	$ra		# Go home

##########################################################################################
# Check to see if a row wins. $a0 contains the row number as in 1,2, 3.                  #
# If the row contains the same value then we return the character that won back in $v0   #
# otherwise we return a zero in $v0	                                                     #
##########################################################################################

ROW:
	li	$v0, 0		# Set answer to false
	addiu	$a0, $a0, -1	# Normalize the row number
	li	$t0, 3		# Size of each row
	mul	$t0, $t0, $a0	# Offset in $t0
	la	$t1, ttt		# Load the address of Board in ttt
	addi	$t1, $t1, 1	# bump the address up one
	add	$t1, $t1, $t0	# Add the offset to the address
	lb	$t2, 0($t1)	# Load the first byte
	lb 	$t3, 1($t1)	# Load the second byte
	bne	$t2, $t3, ROWN	# If not equal, no go
	lb	$t3, 2($t1)	# Load the third byte
	bne	$t2, $t3, ROWN	# If not equal, no go
	move	$v0, $t1		# Load winning byte
ROWN:
	jr	$ra

##########################################################################################
# Check to see if a col wins. $a0 contains the row number as in 1,2, 3.                  #
# If the col contains the same value then we return the character that won back in $v0   #
# otherwise we return a zero in $v0                                                      #
##########################################################################################

COL:
	li	$v0, 0		# Set answer to false
	la	$t0, ttt		# Load the address of the table
	add	$t0, $t0, $a0	# Add the column number
				# 1, 2 or 3
	lb	$t1, 0($t0)	# Load the first byte
	lb	$t2, 3($t0)	# Load the second byte
	lb 	$t3, 6($t0)	# Load the third byte 
	li	$v0, 0

	bne	$t1, $t2, COLN	# No win, go to COLN
	bne	$t1, $t3, COLN	# No win, go to COLN
	move	$v0, $t1		# Move in winning character
COLN:
	jr	$ra 

#############################################################################
# Check both diagonals, check the 1, 5, 9 first and then the 3, 5, 7.       #
# Return the character of the winner in $v0 otherwise return a zero.        #
#############################################################################

DIAG:
	li	$v0, 0		# Set answer to false
	la	$t0, ttt		# Load the address of the table
	lb	$t1, 1($t0)	# Load the 1st square
	lb	$t2, 5($t0)	# Load the second square
	lb 	$t3, 9($t0)	# Load the 3rd square 
	bne	$t1, $t2, DIAG2	# no match for diag1
	bne	$t2, $t3, DIAG2	# no match for diag1
	move	$v0, $t1		# Move in winning character, we have a winner
	jr	$ra

DIAG2:
	lb	$t1, 3($t0)	# Load the 1st square
	lb	$t2, 5($t0)	# Load the 2nd square
	lb 	$t3, 7($t0)	# Load the 3rd square
	bne	$t1, $t2, DIAGN	# no match for diag2
	bne	$t2, $t3, DIAGN	# no match for diag2
	move	$v0, $t1		# Move in winning character, we have a winner

DIAGN:
	jr	$ra

	

