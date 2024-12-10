.model small
.stack 100h
.data
    prompt db 'Enter a decimal number: $'
    number db 0
    result db 8 dup(0)
    msg db 0AH,0DH,'Binary equivalent: $'
    newline db 13, 10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Display the prompt to enter a decimal number
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Read the input number
    mov ah, 01h
    int 21h
    sub al, '0'  ; Convert ASCII to decimal
    mov number, al

    lea si, result + 7 ; Point SI to the last element of the result array
    mov cx, 8 ; Loop counter for 8 bits
    mov al, number ; Load the decimal number into AL

convert_loop:
    mov bl, al
    and bl, 1 ; Get the least significant bit
    mov [si], bl ; Store the bit in result array
    dec si ; Move to the previous element in result array
    shr al, 1 ; Shift AL right to get the next bit
    dec cx ; Decrement the loop counter
    jnz convert_loop ; Repeat the loop if CX is not zero

    ; Display the result message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Display a newline for better readability
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display the binary result
    lea si, result
    mov cx, 8 ; Loop counter for 8 bits

display_loop:
    mov dl, [si] ; Load the next bit into DL
    add dl, '0' ; Convert the bit to ASCII
    mov ah, 02h
    int 21h ; Display the bit
    inc si ; Move to the next bit
    loop display_loop ; Repeat the loop

    ; Terminate the program
    mov ah, 4Ch
    int 21h

main endp
end main
