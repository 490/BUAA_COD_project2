.data
n:   .asciiz  "input n:  "
space:.asciiz" "
.globl main
.text
main:
	la    $a0,   n
	li    $v0,   4  #打印字符串
	syscall
	li    $v0,   5   #输入n
	syscall
	move    $a1,   $v0

	li     $t0,   0#赋初值
	li     $s0,   1
	
	li $v0,1
	la $a0,1
	syscall#打印第一个数
	
fib:    
	add    $t1,   $t0,  $s0
	move   $t0,   $s0        #更新次上一个数值，即F(n-2)
	move   $s0,   $t1        #更新上一个斐波那契数值F(n-1)
	
	li $v0,4
	la $a0,space	#print " "
	syscall
	
	li $v0,1
	move $a0,$t1	#print 当前数
	syscall
        
	sub    $a1,   $a1,  1
	bgt    $a1,   1,    fib#大于1跳转


