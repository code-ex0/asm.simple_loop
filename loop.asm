section .data
	sentence db "hello world!", 10
	length_sentence equ $ - sentence

section .text
global _start


_start:
	mov r9, 10
	.loop:
		dec r9
		cmp r9, 0
		jl .exit
		call _print_sentence
		jmp .loop		

	.exit:
		call _exit_code
	


_print_sentence:
	mov rax, 1
	mov rdi, 1
	mov rsi, sentence
	mov rdx, length_sentence
	syscall
	ret

_exit_code:
	mov rax, 60
	mov rdi, 0
	syscall
	ret
