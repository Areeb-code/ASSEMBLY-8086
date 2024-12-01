; Program to convert lower case strong to upper case string

.MODEL SMALL

.STACK 100H

.DATA
    STR DB 'areeb siddiqui$'   ; string str = "hello world"; (C++)

.CODE 
    MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        ;TO CONVERT LOWER CASE TO UPPER CASE
        MOV SI, 0
        
    AGAIN:
        MOV DL, STR[SI]
        SUB DL, 32
        MOV AH, 02H
        INT 21H
        INC SI
        CMP STR[SI], '$'
        JNE AGAIN
        ;TERMINATING THE THE PROGRAM
        MOV AH,4CH
        INT 21H     
        
    MAIN ENDP
END MAIN