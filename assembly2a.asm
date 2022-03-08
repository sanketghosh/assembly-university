.data
     str: .asciiz "Finding the mean value: "
     array:    .word	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
     
     length:   .word	10

     sum:      .word	0

.text

  main:
     la $t0,array  #register array in memory address
     lw $t1,length  #register the length
     li $t2,0  #i=0
     lw $t3,sum  #initialize the sum=0

  loop:
     lw $t4,($t0)     #t4=array[i]
     add  $t3,$t3,$t4   #sum=sum+array[i]
     add $t2,$t2,1  #i=i+1
     add $t0,$t0,4  #array address update
     blt $t2,$t1,loop   #if i<length goto loop again
     

  calculation:
     div $t6,$t3,$t1   #t6=sum/length
  end:
     li $v0,4
     la $a0,str
     syscall
     li $v0,1
     move $a0,$t6
     syscall
     li $v0,10
     syscall





