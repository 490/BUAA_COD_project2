#Title:prime	Filename:mips2.asm
#Author:13061076����	Data:2014.11.2
#Description:����һ��������С�ڴ��������������
#Input:n
#Output:С��n������
.data
input:.asciiz"please enter your number:"
space:.asciiz" "
.text
.globl main

main:	la $a0,input	#a0��input�ַ���
	li $v0 4
	syscall		#print input...
	li $v0 5
	syscall
	move $t0,$v0	#�����������t0

	li $a1,2		#from 2   a1=2
	add $s1,$t0,$0	#to t0    s1=t0

	jal loop1	#.............loop..........

loop1:	beq $s1,1,exit	#if s1==1:goto exit
	sub $s1,$s1,1 	#  --s1;
	li $t1,2		#  t1=2;

loop2:	div $a1,$t1 	#  t2=a1/t1;�̴����LO�Ĵ��������������HI�Ĵ���
	mflo $t2
	slt $v0,$t2,$t1 	#if t2<t1,v0=1
	beq $v0,1,print 	#if t2<t1��v0==1��, print a1  //�൱�ڴ�2��⵽a1/2����Ȼ�����⵽����a1���������򵥵㣩
	mfhi $t3
	beq $t3,0,no	#If t3(����)==0,(������)����������������һ��ѭ��

	add $t1,$t1,1	# ++t1(t2>=t1&&t3!=0)
	j loop2

print:	li $v0,1
	move $a0,$a1	#print $a1
	syscall
	li $v0,4
	la $a0,space	#print " "
	syscall
			#����������ʱ����printֱ��a1+1,������һ��
no:	add $a1,$a1,1	#++a1
	jr $ra		#.............loop...........

exit:	li $v0 10	#��������
	syscall
