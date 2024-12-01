.model small
.stack 100h
.data
   num1 dw 46
   num2 dw 47
   num3 dw 45
   msg1 db 'FIRST NUMBER IS THE SMALLEST$', 0
   msg2 db 'SECOND NUMBER IS THE SMALLEST$', 0
   msg3 db 'THIRD NUMBER IS THE SMALLEST$', 0

;MACRO (FUNCTION) TO DISPLAY 
PRINT MACRO str
    mov ah, 09h
    lea dx, str
    int 21h
PRINT ENDM    

.code
MAIN PROC FAR
   MOV ax, @data
   MOV ds, ax

   MOV AX, num1
   MOV BX, num2
   MOV CX, num3
   
;CODE FOR COMPARING NUMBER 1 AND NUMBER 2
   CMP AX, BX
   JL COMP_12 
   JMP COMP_23

COMP_12:   
   CMP AX, CX
   JL PRINT_NO1  
   JMP COMP_23

PRINT_NO1:
   PRINT msg1
   JMP EXIT

COMP_23:   
   CMP BX, CX
   JL PRINT_NO2
   JMP PRINT_NO3

PRINT_NO2:
   PRINT msg2
   JMP EXIT

PRINT_NO3:
   PRINT msg3
   JMP EXIT

EXIT:
   MOV AH, 4CH
   INT 21H
MAIN ENDP
END MAIN
