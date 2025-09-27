# INCISO A

PA EQU 30h
CA EQU 32h
ORG 2000H
MOV AL, 00111100b
OUT CB, AL
MOV AL, 11000011b
OUT PB, AL
HLT
END


# INCISO B

        PA EQU 30h
        PB EQU 31h
        CA EQU 32h
        CB EQU 33h
        
        ORG 1000h
msj     DB "Llave Prendida"
msj2    DB "Llave Apagada"
        ORG 2000h
        MOV AL, 10000000b
        OUT CA, AL
        MOV AL, 00000000b
        OUT CB, AL
        IN AL, PA
        OUT PB, AL
        IN AL, PB
        CMP AL, 10000000b
        JNZ apag
        MOV AL, 14
        MOV BX, offset msj
        INT 7
        JMP fin
apag:   MOV AL,  13
        MOV BX, offset msj2
        INT 7
FIN:    HLT
        END


# INCISO C

        PA EQU 30h
        PB EQU 31h
        CA EQU 32h
        CB EQU 33h
        
        ORG 1000h
msj     DB "Llave Prendida"
msj2    DB "Llave Apagada"
        ORG 2000h
loop:   MOV AL, 11111111b
        OUT CA, AL
        MOV AL, 00000000b
        OUT CB, AL
        IN AL, PA
        OUT PB, AL
        IN AL, PB
        JMP loop
        END
