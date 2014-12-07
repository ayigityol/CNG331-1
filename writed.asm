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
	lw $s7,listsz
	jal sort
	j exit
	
	
#####   creation and initialization of the array -one element at a time  #####	





## Write bubble sort code here
sort:																	
    add $t0,$zero,$zero #init out counter
	loop:
        
        #  Check for sentinal val and if true branch to done
        beq $t0,$s7,done

        #  init upper bound of inner
        sub $t7,$s7,$t0
        addi $t7,$t7,-1

        
        #  loop
        add $t1,$zero,$zero #  init inner count

        #  Inner Loop
        innerLoop:
            #  Check for sentinal val and if true branch to continue
            beq $t1,$t7,continue

            #  Load Array[i] and Array[i+1]
			add $t6,$s1,$t1
            lb  $s3,0($t6)
            lb  $s2,4($t6)
           
            #  If (Array[i]) > (Array[i+1]) then swap and store
            slt $t2, $s2,$s3
			
            #  Else
            beq $t2, $zero, good
            sb  $s2,0($t6)
            sb  $s3,4($t6)
			addi $t6,$t6,3
           
		   good: #  increment and Jump back 
				addi $t1,$t1,1
				addi $t6,$t6,3
				j innerLoop
        continue: #  increment and Jump back
        addi $t0,$t0,1
        j loop
## Write bubble sort code here																											

done: #print below
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