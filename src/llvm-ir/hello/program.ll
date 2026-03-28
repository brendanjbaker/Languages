target triple = "x86_64-pc-linux-gnu"

@message = private unnamed_addr constant [14 x i8] c"Hello, world!\0A"

define i32 @main() {
entry:
	; Make syscall (write to stdout).
	%res = call i64 asm sideeffect "syscall",
		"={rax},{rax},{rdi},{rsi},{rdx}"(
		i64 1,             ; syscall number: write (1)
		i64 1,             ; fd = stdout (1)
		ptr @message,      ; buffer
		i64 14             ; length
	)

	; Make another syscall (exit).
	call void asm sideeffect "syscall",
		"{rax},{rdi}"(
		i64 60,            ; syscall number: exit (60)
		i64 0              ; exit code
	)

	unreachable
}
