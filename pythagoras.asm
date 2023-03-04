extern printf
extern scanf
global pythagoras

segment .data
length1 db "Enter the length of the first side of the triangle: ", 0
length2 db "Enter the length of the second side of the triangle: ", 0

one_float db"%lf", 0

thankyou_float db "Thank you. You entered two sides: %0.8lf and %0.8lf", 10, 0
hypot_float db "The length of the hypotenuse is %0.8lf", 0

segment .bss

segment .text 

pythagoras:
;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.

push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags

push qword 0


;=========== Display length input for first side ========================================================================
push qword 0                                                ;Must be used everytime printf and scanf is called
mov rax, 0
mov rdi, length1
call printf
pop rax                                                     ;Used at the end when using 'push' 

push qword 0                                                ;Must be used everytime printf and scanf is called
mov rax, 0
mov rdi, one_float
mov rsi, rsp
call scanf
movsd xmm10, [rsp]
pop rax                                                     ;Used at the end when using 'push'

;=========== Display length input for second side ========================================================================
push qword 0                                                ;Must be used everytime printf and scanf is called
mov rax, 0
mov rdi, length2
call printf
pop rax                                                     ;Used at the end when using 'push'

push qword 0                                                ;Must be used everytime printf and scanf is called
mov rax, 0
mov rdi, one_float
mov rsi, rsp
call scanf
movsd xmm11, [rsp]
pop rax                                                     ;Used at the end when using 'push'


push qword 0

;=========== Display both inputs =========================================================================================
mov rax, 2
mov rdi, thankyou_float
movsd xmm0, xmm10
movsd xmm1, xmm11    
call printf
pop rax


;=========== Find the hypotenuse =========================================================================================
mulsd xmm10, xmm10
mulsd xmm11, xmm11 
addsd xmm11, xmm10 
sqrtsd xmm15, xmm11

;======= Displaying the hypotenuse =======================================================================================
push qword 0
mov rax, 1
mov rdi, hypot_float 
movsd xmm0, xmm15
call printf
pop rax

;========= Ending the program =============================================================================================
        
pop rax                                                     ;Used after the first qword 0 at the beginning of the program

movsd xmm0, xmm15

;===== Restore original values to integer registers =======================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp


ret