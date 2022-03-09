.data
     str: .asciiz "Mean value is: "

     array:    .word	4, 5, 6, 7, 8, 9, 10, 11, 12, 13
     
     length:   .word	10

     sum:      .word	0

.text

   main:
     la $t0,array  #register array in memory address
     lw $t1,length #register the length
     li $t2,0      #i=0
     lw $t3,sum    #initialize the sum=0

   loop:
     lw $t4,($t0)       #t4=array[i]
     add  $t3,$t3,$t4   #sum=sum+array[i]
     add $t2,$t2,1      #i=i+1
     add $t0,$t0,4      #array address update
     blt $t2,$t1,loop   #if i<length goto loop again
     
   cal:
     div $t6,$t3,$t1    #t6=sum/length

   end:
     li $v0,4           #syscall 4 (print_str)
     la $a0,str         #string to be printed
     syscall            
     li $v0,1           #syscall 1 (print_int)
     move $a0,$t6       #integer to be printed
     syscall
     li $v0,10          #syscall 10 to exit the program
     syscall
