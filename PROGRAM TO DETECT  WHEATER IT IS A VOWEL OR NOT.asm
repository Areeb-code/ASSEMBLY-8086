.model small
.stack 100h
.data
  msg db 'ENTER A CHARACTER :$'
  msg1 db 0ah,0dh,'THE LETTER IS A VOWEL$'
  MSG2 DB 0AH,0DH,'THE LETTER IS A CONSONENT$'
  CHAR DB ?
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    
    ;FOR PRINTING A MSG 
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    
    ;FOR INPUT A CHARACTER
    MOV AH, 01H
    INT 21H
    MOV CHAR, AL
    
    ;FOR COMPARING THE LETTER
    CMP CHAR, 'A'
    JE DISP_VOWEL
    CMP CHAR, 'E'
    JE DISP_VOWEL
    CMP CHAR, 'I'
    JE DISP_VOWEL
    CMP CHAR, 'O'
    JE DISP_VOWEL
    CMP CHAR, 'U'
    JE DISP_VOWEL
    CMP CHAR,'a'
    JE DISP_VOWEL
    cmp CHAR, 'e'
    JE DISP_VOWEL
    cmp CHAR, 'i'
    JE DISP_VOWEL
    CMP CHAR, 'o'
    JE DISP_VOWEL
    CMP CHAR, 'u'
    JE DISP_VOWEL
    
    ;for printing the msg2
    LEA DX, msg2
    MOV AH, 09H
    INT 21H
    JMP EXIT
    ;NOW PRINTING THE MSG1
  DISP_VOWEL:
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    JMP EXIT
    ;FOR TERMINATING THE PROGRAM
EXIT:    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
     
    
       