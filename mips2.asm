#Title:prime	Filename:mips2.asm
#Author:13061076赵乐	Data:2014.11.2
#Description:输入一个数，求小于次数的素数并输出
#Input:n
#Output:小于n的素数
.data
input:.asciiz"please enter your number:"
space:.asciiz" "
.text
.globl main

main:	la $a0,input	#a0存input字符串
	li $v0 4
	syscall		#print input...
	li $v0 5
	syscall
	move $t0,$v0	#输入的数存入t0

	li $a1,2		#from 2   a1=2
	add $s1,$t0,$0	#to t0    s1=t0

	jal loop1	#.............loop..........

loop1:	beq $s1,1,exit	#if s1==1:goto exit
	sub $s1,$s1,1 	#  --s1;
	li $t1,2		#  t1=2;

loop2:	div $a1,$t1 	#  t2=a1/t1;商存放在LO寄存器，余数存放在HI寄存器
	mflo $t2
	slt $v0,$t2,$t1 	#if t2<t1,v0=1
	beq $v0,1,print 	#if t2<t1（v0==1）, print a1  //相当于从2检测到a1/2（虽然不如检测到根号a1，但这样简单点）
	mfhi $t3
	beq $t3,0,no	#If t3(余数)==0,(被整除)不是素数，进入下一次循环

	add $t1,$t1,1	# ++t1(t2>=t1&&t3!=0)
	j loop2

print:	li $v0,1
	move $a0,$a1	#print $a1
	syscall
	li $v0,4
	la $a0,space	#print " "
	syscall
			#当不是素数时跳过print直接a1+1,进入下一次
no:	add $a1,$a1,1	#++a1
	jr $ra		#.............loop...........

exit:	li $v0 10	#结束程序
	syscall
