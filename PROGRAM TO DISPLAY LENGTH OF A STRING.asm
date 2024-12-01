.model small
.stack 100h
.data
    msg db 'Enter a string: $'
    input db 100 dup('$')
    prompt db 'Number of characters: $'
    count db 0

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Display the prompt to enter a string
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Read the input string
    mov ah, 0Ah
    lea dx, input
    int 21h

    ; Get the length of the input string
    mov si, offset input + 1
    mov cl, [si]        ; First byte is the count of characters
    mov count, cl

    ; Display the number of characters
    mov ah, 09h
    lea dx, prompt
    int 21h

    mov al, count
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Terminate the program
    mov ah, 4Ch
    int 21h
main endp
end main
