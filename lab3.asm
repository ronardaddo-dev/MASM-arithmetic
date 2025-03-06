TITLE

; Author: Ronard Addo
; Date: 06/03/2025 (DD/MM/YYYY)

; Description: A MASM program for evaluating arithmetic expressions using indirect addressing and a loop command

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; Variable declarations
    A DWORD 20
    B DWORD 10
    varC DWORD 5
    D DWORD 50
    E DWORD 15
    Result DWORD ?
    sumAB DWORD ?
    prodABC DWORD ?
    diffDE DWORD ?

.code
main PROC
	
    ; zeroing out registers
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

	mov eax, OFFSET A       ; loading starting address of A into eax
    mov ebx, [eax]          ; loading value stored in eax into ebx

    mov eax, OFFSET B       ; loading starting address of B into eax
    add ebx, [eax]          ; ebx = A + B
    mov DWORD PTR [sumAB], ebx  ; Storing the A+B in sumAB

    mov eax, OFFSET varC       ; loading starting address of C into eax
    add ecx, [eax]          ; retrieving loop counter

    mov eax, 0              ; zeroing eax for loop calculation

L1:
    add eax, ebx
    loop L1

    mov DWORD PTR [prodABC], eax        ; Storing C X (A+B) in prodABC

    mov edx, D
    sub edx, E                          ; ebx = D-E
    mov DWORD PTR [diffDE], edx        ; Storing D-E in diffDE

    mov eax, prodABC                ; loading predABC into eax
    sub eax, diffDE                 ; subtracting diffDE from prodABC
    mov DWORD PTR [Result], eax     ; Storing prodABC - diffDE in Result

    mov ecx, Result                 ; checking value stored in Result variable

	call DumpRegs                   ; displays registers in console

	exit

main ENDP
END main