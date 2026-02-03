; Linux x86-64

section .data
	msg db "Hello, world!", 10   ; 10 = newline
	len equ $ - msg              ; length of the message

section .text
	global _start

_start:
	; write(1, msg, len)
	mov rax, 1        ; syscall number for sys_write
	mov rdi, 1        ; file descriptor 1 = stdout
	mov rsi, msg      ; pointer to message
	mov rdx, len      ; message length
	syscall

	; exit(0)
	mov rax, 60       ; syscall number for sys_exit
	xor rdi, rdi      ; exit code 0
	syscall
