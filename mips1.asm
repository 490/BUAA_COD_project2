#Title:pow	Filename:mips1.asm
#Author:13061076����	Date:2014.11.1
#Description:��2��n�η������ǰ16�����,������ѭ��,����*2
#i= $s0 ;j= $s1; x= $s2 ;n=$s3
	.data
space:.asciiz " "			#space to insert between numbers
	.text
	.globl main

main:	addi $s0,$0,1		#i=1
	addi $s1,$0,1		#j=1
	addi $s2,$0,1		#x=1
	addi $s3,$0,17		#n=17����Ϊ���������ж�j==n�����ӡ��x������nҪ��һ����

loop2:	move $a0,$s2		#$s2=value to print
	li $v0,1			#print x(integer)
	syscall
	la $a0,space       	# load address of spacer for syscall
      	li $v0,4          	# print"space"
     	syscall  
	jal loop1		#�ڲ�ѭ��
	addi $s1,$s1,1		#++j
	bne $s1,$s3,loop2		#if j!=n:goto loop2
	beq $s1,$s3,end		#if j=n:goto end

loop1:	sll $s2,$s2,1		#x=x*2
	addi $s0,$s0,1		#++i
	jr $ra

end:	li $v0,10		#end
	syscall
