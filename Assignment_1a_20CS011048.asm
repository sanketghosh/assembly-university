.data
     str: .asciiz "The result of the operation A * B+ 20 / C - D: "
.text

 main:
     li $t0,12  # The value of variable A is 12
     li $t1,32  # The value of variable B is 32
     li $t2,20  # For the register the constant value is given 20
     li $t3,9  # The value of var C is 9 
     li $t4,16   # The value of var D is 16
  loop:
     mul  $t5,$t0,$t1   #t5= A*B
     div  $t6,$t2,$t3   #t6= 20 / C
     add $t7,$t6,$t5    #t7= A * B+ 20 / C
     sub  $t8,$t7,$t4   #t8= t7 - D
  end:
     li $v0,4 #calling the string to be printed
     la $a0,str # the actual string to be printed
     syscall #prints the string
     li $v0,1
     move $a0,$t8 #the integer result to be printed
     syscall #prints the integer
     li $v0,10 #calls to exit the program
     syscall # execute the exit operation
     
