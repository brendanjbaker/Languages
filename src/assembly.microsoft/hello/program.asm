option casemap:none

extrn GetStdHandle : proc
extrn WriteFile    : proc
extrn ExitProcess  : proc

STD_OUTPUT_HANDLE equ -11

.data
msg     db "Hello, world!", 13, 10
msg_len equ $ - msg

.code
main proc
	sub rsp, 40                ; shadow space + stack alignment

	mov rcx, STD_OUTPUT_HANDLE
	call GetStdHandle          ; RAX = stdout handle

	mov rcx, rax               ; hFile
	lea rdx, msg               ; lpBuffer
	mov r8,  msg_len           ; nNumberOfBytesToWrite
	lea r9,  qword ptr [rsp+32]; lpNumberOfBytesWritten
	call WriteFile

	xor ecx, ecx
call ExitProcess
main endp

end
