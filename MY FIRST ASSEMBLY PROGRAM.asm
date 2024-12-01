.model small
.stack 100h
.data
   msg db 'LABAYIK YA EKHWATUNA LABAYIK$'
 .code
    main proc far
     mov ax, @data
     mov ds, ax
     mov dx, offset msg
      
      
     mov ah, 09h
     int 21h
     
     
     mov ah, 4ch
     int 21h
    main endp
  end main
     
     
     
     
     
   
     