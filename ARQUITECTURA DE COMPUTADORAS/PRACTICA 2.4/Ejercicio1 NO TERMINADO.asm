PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 1000h

PATRON_LUCES DB 00000001b

ORG 3000h

ini_pio:
 MOV AL, 00000000b
 OUT CB, AL
RET

rotarizq:
 MOV AL, [BX]
 ;Multiplicamos el byte x2
 ADD AL, AL
 JNC fin
 ;Si se activo el CF (bit mas significativo estaba en 1), le sumo 1.
 INC AL
fin: MOV [BX], AL
 RET ;Vuelvo

rotarizq_n:
 CALL rotarizq ;Roto a la izquierda el byte
 DEC CX ;Hice 1 rotacion
 CMP CX, 0
 JNZ fin2
 JMP rotarizq_n
fin2: RET

rotarder_n:
 MOV CX, 8
 SUB CX, DX
 INC BX
 call rotarizq_n
 CMP BX, CX
 JNZ rotarder_n
fin3: RET
 
 
ORG 2000h
 MOV DX, 0; Inicializo mi contador en 0
 call ini_pio
 MOV BX, offset PATRON_LUCES
 MOV AL, [BX]
loop4: OUT PB, AL
 call rotarizq
 INC DX
 CMP DX, 8
 JNZ loop4
 call rotarder_n
 JMP loop4
 HLT
END 

