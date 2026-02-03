.section .data
msg:
	.ascii  "Hello, world!\n"
len = . - msg

.section .text
.global _start
_start:
	mov     $1, %rax        # sys_write
	mov     $1, %rdi        # stdout
	mov     $msg, %rsi      # buffer
	mov     $len, %rdx      # length
	syscall

	mov     $60, %rax       # sys_exit
	xor     %rdi, %rdi      # status 0
	syscall
