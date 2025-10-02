;Escribir un programa para un Simul que cuenta la cantidad de valores pares de un vector de números de 16 bits.
;Luego, deberá informar "Cantidad de pares es: " y el valor de la cantidad de pares en caso de:

;- es par: Recibe en un número y devuelve el valor de 1 si el número es par o 0 si no lo es.

;- contar_pares: Recibe un vector del registro AX y retorna la cantidad de valores pares en el vector en el registro AX.

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

org 1000h
  vector DW 50,15,25,12,3,5,4,3,1
org 3000h

  ES_PAR: AND AX, 1
  JNZ fin
  MOV DL, 1
  RET
  fin: MOV DL, 0
  RET

  CONTAR_PARES: MOV BX, SP
  ADD BX, 2
  MOV BX, WORD PTR [BX]
  loop: MOV AX, [BX]
  CALL ES_PAR
  ADD BX, 2
  CMP DL, 1
  JNZ seguir
  ADD CH, 1
  seguir: INC DH
  CMP DH, CL
  JZ fin2
  JMP loop
  fin2: MOV AL, CH
  RET
  
  
org 2000h
  MOV DX, 0
  MOV BX, offset vector
  PUSH BX
  MOV CX, 9
  CALL CONTAR_PARES
  POP BX
  HLT
end

