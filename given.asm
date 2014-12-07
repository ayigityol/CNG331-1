	.data
array:	.space 20
listsz: .word 5
whitesp:.asciiz " "
arr:    .asciiz "Array: "
	.text
main:	

#####   creation and initialization of the array -one element at a time   #####	
	
	la   $s1, array		#start address of array is stored in $s1 (array)
	lw   $s0, listsz	#size of the array is stored in $s0
	li   $v0, 5		#copy 5 in $v0
	sw   $v0, 0($s1)	#store the value of $v0 to array[0] 
	li   $v0, 3		
	sw   $v0, 4($s1)
	li   $v0, 12
	sw   $v0, 8($s1)
	li   $v0, 7
	sw   $v0, 12($s1)
	li   $v0, 1
	sw   $v0, 16($s1)
#####   creation and initialization of the array -one element at a time  #####	






## Write bubble sort code here																											








## Write bubble sort code here																											





#####   This part prints the array   #### 
	li   $t1, 0
	li   $t2, 0
	li   $v0, 4
	la   $a0, arr
	syscall

printLoop:
	li   $v0, 1
	lw   $t0, 0($s1)
	addi $s1, $s1, 4
	add  $a0, $t0, $zero
	addi $t1, $t1, 1
	syscall
	li   $v0, 4
	la   $a0, whitesp
	syscall
	bne  $t1, $s0, printLoop
	
	
	la   $s1, array
#####   This part prints the array   #### 