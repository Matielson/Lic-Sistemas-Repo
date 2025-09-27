# INCISO A

PA EQU 30h
CA EQU 32h

ORG 1000h
si db "Ocupada"
no db "Libre"

ORG 2000H
MOV AL, 11111101b
out CA, al
in al, PA
AND AL, 1
jnz ocupada
MOV BX, offset no
mov al, 5
int 7
jmp fin
ocupada: mov bx, offset si
mov al, 7
INT 7
fin: int 0
end

# INCISO B

PA EQU 30h
CA EQU 32h
PB EQU 31h
CB EQU 33h

ORG 1000h
si db "Ocupada"
no db "Libre"

ORG 2000H
MOV AL, 11111101b
out CA, al
in al, PA
AND AL, 1
jnz esperar
libre: MOV BX, offset no
mov al, 5
int 7
jmp fin
esperar: in al, PA
AND AL, 1
JZ libre
JMP esperar
fin: int 0
end
