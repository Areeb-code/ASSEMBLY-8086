;PROGRAM TO CONVERT DECIMAL INTO BINARY NUMBER
.MODEL SMALL
.STACK 100H
.DATA
  MSG DB 'PLEASE ENTER A DECIMAL NUMBER :$'
  MSG1 DB 0AH,0DH,'THE SPECIFIED BINARY NUMBER IS :$'
.CODE
  MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    
    ;PRINT MSG
    lea dx, MSG 
    MOV AH, 09H
    INT 21H
    
    ;NOW IN PUT A NUMBER
    MOV AH, 01H
    INT 21H
    
    SUB AL, 48  ;AX=05=58-48
    mov ah, 0
    MOV BX, 2
    MOV DX, 0
    MOV CX,0               ;____
                         ;CX   |
    CONVERT_BIN:  ;    _______ |
    DIV BX         ;BX)        |
    PUSH DX             ;AX    |__
    INC CX           ; _       |__  ;THE WHOLE SUBTRACTION PROCESS
    CMP AX, 0         ;------  |
    JNE CONVERT_BIN     ;DX    |
                           ;___|
    
    ;DISPLAY MESSAGE NO.2
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    ;TO DISPLAY THE BINARY NUMBER BY POPING FROM STACK
    DISP:
    POP DX
    ADD DX, 48
    MOV AH, 02H
    INT 21H
    LOOP DISP
    
    ;TERMINATING THE PROGRAM 
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
  END MAIN
    
    
    
    
   
    
      