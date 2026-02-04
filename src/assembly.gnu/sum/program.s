.section .data
buffer:
	.space 32

.section .text
.global _start
_start:
	# sum = 0 + 1 + ... + 100
	xor     %eax, %eax
	xor     %ecx, %ecx

sum_loop:
	add     %ecx, %eax
	inc     %ecx
	cmp     $101, %ecx
	jl      sum_loop

	# convert EAX to decimal ASCII
	lea     buffer+31(%rip), %rsi
	movb    $'\n', (%rsi)
	dec     %rsi

	mov     $10, %ebx

convert_loop:
	xor     %edx, %edx
	div     %ebx
	add     $'0', %dl
	mov     %dl, (%rsi)
	dec     %rsi
	test    %eax, %eax
	jnz     convert_loop

	inc     %rsi            # start of string

	# write(1, rsi, buffer+32 - rsi)
	mov     $1, %rax        # sys_write
	mov     $1, %rdi        # stdout
	lea     buffer+32(%rip), %rdx
	sub     %rsi, %rdx      # length
	syscall

	# exit(0)
	mov     $60, %rax       # sys_exit
	xor     %rdi, %rdi
	syscall
