;PROGRAM TO GIVE THE POWER OF CERTAIN NUMBER
.model SMALL
.STACK 100H
.DATA
  MSG DB 'PLEASE ENTER A NUMBER :$'
  MSG1 DB 0AH,0DH,'ENTER POWER :$'
  NUM DB ?
  POW DB ?
  RESULT DW 1
  MSG2 DB 0AH,0DH,'THE RESULT IS :$'
.CODE
  MAIN PROC
  MOV AX, @DATA
  MOV DS, AX
  
  ;PRINT A MSG
  LEA DX, MSG
  MOV AH, 09H
  INT 21H
  
  ;INPUT CHARACTER FOR NUMBER 
  MOV AH, 01H
  INT 21H
  MOV NUM, AL
  
  ;PRINTING MSG1
  LEA DX, MSG1
  MOV AH, 09H
  INT 21H
  
  ;INPUT POWER
  MOV AH, 01H
  INT 21H
  MOV POW,AL
  
  ;STORING THE VALUES OF POWER AND NUMBER FOR LOOP PREPERATION 
  LEA SI, NUM
  MOV CL, POW
  
  ;NOW USING LOOP
 POWER_LOOP:
  MOV AL, [SI]
  ;CODE FOR MULTIPLY ITSLF SO THAT IT COULD FIT IN AX 
  MOV AH, 0
  MUL AL   ;NUM=*NUM  IN (C/C++)
  MOV RESULT, AX
  MOV [SI], AL  ;RETURNING NUM VALUE TO AL REGISTER(AX LOWER)
  DEC CL
 
  JNZ POWER_LOOP
  
  ;FOR PRINTING MSG2
  LEA DX, MSG2
  MOV AH, 09H
  INT 21H
  
  MOV RESULT, AX
  CALL PRINT_DECIMAL 
  
  ;TERMINATE END FUNCTION
  MOV AH, 4CH
  INT 21H
  MAIN ENDP
       
  ;PROCEDER TO PRINT IT INTO DECIMAL BECAUSE IT WAS STORED IN BINARY IN AX     
PRINT_DECIMAL PROC
    ; Convert AX to a string and print it
    mov bx, 10  ; Divisor for decimal conversion
    mov cx, 0   ; Initialize digit count

convert_loop:
    xor dx, dx  ; Clear DX
    div bx      ; Divide AX by 10, QUOTEINT IS IN AX, remainder in DX
    push dx     ; PUSH THE remainder (digit) onto STACK
    inc cx      ; Increment digit count
    test ax, ax ; Check if quotient is zero
    jnz convert_loop

print_loop:
    pop dx      ; Pop digit from stack
    add dl, '0' ; Convert digit to ASCII
    mov ah, 02h
    int 21h     ; Print digit
    loop print_loop

    ret
print_decimal endp
end main
  