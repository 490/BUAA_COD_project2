.data
n:   .asciiz  "input n:  "
space:.asciiz" "
.globl main
.text
main:
	la    $a0,   n
	li    $v0,   4  #��ӡ�ַ���
	syscall
	li    $v0,   5   #����n
	syscall
	move    $a1,   $v0

	li     $t0,   0#����ֵ
	li     $s0,   1
	
	li $v0,1
	la $a0,1
	syscall#��ӡ��һ����
	
fib:    
	add    $t1,   $t0,  $s0
	move   $t0,   $s0        #���´���һ����ֵ����F(n-2)
	move   $s0,   $t1        #������һ��쳲�������ֵF(n-1)
	
	li $v0,4
	la $a0,space	#print " "
	syscall
	
	li $v0,1
	move $a0,$t1	#print ��ǰ��
	syscall
        
	sub    $a1,   $a1,  1
	bgt    $a1,   1,    fib#����1��ת


