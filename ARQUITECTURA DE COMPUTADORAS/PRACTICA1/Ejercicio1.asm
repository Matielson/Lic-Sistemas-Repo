        org 1000h
msj     DB "Hola, Buenas Tardes" ;1000h-1003h
cant    DB 0
        org 2000h
        MOV AL,'a'
        MOV BX, offset msj
        MOV DX, offset cant - offset msj
        
bucle:  CMP BL, DL
        JZ fin
        CMP [BX], AL
        JNZ seguir
        INC cant
        
seguir: INC BX
        JMP bucle

        
fin:    MOV CL, cant
        HLT
end
