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
MSJ DB "Ingrese un numero del 1 al 9"
FIN DB ?
NUM DB ?

ORG 3000h

leer_digito: MOV BX, offset msj
  MOV AL, offset fin - offset msj
  INT 7
  loop: MOV BX, OFFSET NUM
  MOV AL, 1
  INT 6
  CMP NUM, 030h
  JZ LOOP
  CMP NUM, 03Ah
  JNS LOOP
  MOV CL, NUM
  RET

poll: IN AL, ESTADO
  AND AL, 1
  JNZ poll
  RET

descender: MOV BX, SP
  ADD BX, 4 
loop2: call poll
  MOV AL, [BX]
  OUT DATO, AL
  CMP AL, 30h
  JZ fin2
  DEC byte ptr [BX]
  JMP loop2
  IRET
  
 ORG 2000H
  ; ASIGNO LA DIRECCION DE LA SUBRUTINA A EJECUTAR EN EL VECTOR DE INTERRUPCIONES PARA MI IDF10
  MOV BX, IDF10 * 4
  MOV AX, descender
  MOV [BX], AX
  ; Libero el registro completo de AX (todo en 0)
  XOR AX, AX
  ; CONFIGURO EL HS MODO POLLING
  IN AL, ESTADO
  AND AL, 01111111b
  OUT ESTADO, AL
  CLI ; CONFIGURO EL PIC PARA INTERRUPCION F10
  ; ACTIVO EL DISP F10 (IMR)
  MOV AL, 11111110b
  OUT IMR, AL
  ; PONGO EL ID DE LA TECLA F10 EN INT0
  MOV AL, IDF10
  OUT INT0, AL
  STI
  CALL LEER_DIGITO
  PUSH CX
asd: JMP asd
fin2: HLT
END





3. Escriba un programa para VonSim que lea caracteres por teclado y los envíe a medida que se van ingresando a la impresora a través del Handshake (por consulta de estado, esperando a que la impresora esté libre). 
El programa debe terminar cuando se presiona la tecla F10. Antes de finalizar, si se imprimieron más de 100 caracteres, debe informarlo en pantalla.


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

ORG 4
  RUT DW PARAR

ORG 1000h
  mensaje DB "Se imprimieron mas de 10 caracteres."
  char DB ?
  fin DB ?
  
ORG 3000h
  IMPRIMIR: MOV AL, BYTE PTR [BX]
  OUT DATO, AL
  INC DL
  INC BX
  RET



  PARAR: MOV AL, 11111111b
  OUT IMR, AL
  CMP DL, 10
  JS seguir
  MOV BX, offset mensaje
  MOV AL, offset char - offset mensaje
  INT 7
  seguir: INT 0
  MOV AL, 20h
  OUT EOI, AL
  IRET
  
ORG 2000h
  MOV DL, 0
  CLI
  MOV AL, 01111111b
  OUT ESTADO, AL
  MOV AL, 11111110b
  OUT IMR, AL
  MOV AL, IDF10
  OUT INT0, AL
  STI
  MOV BX, OFFSET CHAR
  ESPERAR: IN AL, ESTADO
  AND AL, 1
  JNZ ESPERAR
  INT 6
  CALL IMPRIMIR
  JMP ESPERAR
  HLT
END
