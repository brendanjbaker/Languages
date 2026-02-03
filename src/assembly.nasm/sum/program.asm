; Linux x86-64

global _start

section .bss
	buffer   resb 20

section .data
	newline  db 10

section .text
_start:
	; sum = 0
	xor     rax, rax        ; rax = sum
	xor     rcx, rcx        ; rcx = i

sum_loop:
	add     rax, rcx
	inc     rcx
	cmp     rcx, 101
	jne     sum_loop

	; convert rax to decimal
	mov     rbx, 10
	lea     rsi, [buffer + 20]
	mov     rdi, rsi

convert:
	xor     rdx, rdx
	div     rbx
	add     dl, '0'
	dec     rdi
	mov     [rdi], dl
	test    rax, rax
	jnz     convert

	; write number
	mov     rax, 1          ; sys_write
	mov     rdx, rsi
	sub     rdx, rdi        ; length
	mov     rsi, rdi
	mov     rdi, 1          ; stdout
	syscall

	; write newline
	mov     rax, 1          ; sys_write
	mov     rdi, 1          ; stdout
	lea     rsi, [newline]
	mov     rdx, 1
	syscall

	; exit(0)
	mov     rax, 60         ; sys_exit
	xor     rdi, rdi
	syscall
