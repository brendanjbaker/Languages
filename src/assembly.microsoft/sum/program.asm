option casemap:none

extrn GetStdHandle : proc
extrn WriteFile    : proc
extrn ExitProcess  : proc

STD_OUTPUT_HANDLE equ -11

.data
buffer  db 32 dup(?)          ; enough for decimal digits + newline
bytes   dq ?

.code
main proc
    sub rsp, 40               ; shadow space + alignment

    ; -----------------------------
    ; sum = 0 + 1 + ... + 100
    ; -----------------------------
    xor eax, eax              ; sum = 0
    xor ecx, ecx              ; i = 0

sum_loop:
    add eax, ecx
    inc ecx
    cmp ecx, 101
    jl  sum_loop              ; loop while i < 101

    ; -----------------------------
    ; convert EAX to decimal ASCII
    ; -----------------------------
    lea rdi, buffer + 31      ; write digits backwards
    mov byte ptr [rdi], 10    ; newline
    dec rdi

    mov ebx, 10

convert_loop:
    xor edx, edx
    div ebx                   ; EAX /= 10, remainder in EDX
    add dl, '0'
    mov [rdi], dl
    dec rdi
    test eax, eax
    jnz convert_loop

    inc rdi                   ; point to first digit

    ; -----------------------------
    ; write to stdout
    ; -----------------------------
    mov ecx, STD_OUTPUT_HANDLE
    call GetStdHandle         ; RAX = stdout handle

    mov rcx, rax              ; hFile
    mov rdx, rdi              ; lpBuffer
    lea r8,  buffer + 32
    sub r8,  rdi               ; length
    lea r9,  bytes
    call WriteFile

    xor ecx, ecx
    call ExitProcess
main endp

end
