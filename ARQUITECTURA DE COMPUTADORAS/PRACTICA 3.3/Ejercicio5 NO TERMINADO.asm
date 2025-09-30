CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H
INT2 EQU 26H
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
DATO EQU 40H
ESTADO EQU 41H
IDF10 EQU 1
IDTIMER EQU 2
IDHAND EQU 3

ORG 1000h

estado_luces DB ?

ORG 3000h
  LUCES12: MOV AL, 0
  OUT CONT, AL 
  MOV AX, [BX]
  MOV BX, AX
  MOV AX, [BX]
  AND AX, 10000000b
  JNZ luces12
  MOV AL, 11111111b
  OUT PB, AL
  IRET

  esperar: MOV CL, CONT
  CMP CL, 12
  JNZ esperar
  RET
  
  
ORG 2000H
  ; Config VECTOR INT's (SubRutina a ejecutar)
  MOV BX, IDTIMER * 4
  MOV AX, LUCES12
  MOV [BX], AX
  CLI

  ; Config IMR (disp a usar)
  MOV AL, 11111101b
  OUT IMR, AL

  ; Config INT1 (ID)
  MOV AL, IDTIMER
  OUT INT1, AL

loop:
  ; Config CONT
  MOV AL, 0
  OUT CONT, AL 
  
  ; Config COMP
  MOV AL, 12
  OUT COMP, AL
  STI
  
  ; Config Llaves.
  MOV AL, 11111111b
  OUT CA, AL
  ; Config Luces.
  MOV AL, 00000000b
  OUT CB, AL

  ; Asignar direccion del estado de las luces a BX
  IN AL, PA
  MOV estado_luces, AL
  MOV BX, offset estado_luces
  PUSH BX
  CALL esperar
HLT
END
