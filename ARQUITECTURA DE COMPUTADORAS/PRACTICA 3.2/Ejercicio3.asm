EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
N_F10 EQU 15

ORG 1000H
  IP_F10 DW RUT_F10

ORG 3000H
  RUT_F10: PUSH AX
  INC DX
  MOV AL, EOI
  OUT EOI, AL
  POP AX
  IRET
  
ORG 2000H
  MOV AX, IP_F10
  MOV BX, N_F10 * 4
  MOV [BX], AX
  CLI
  ; CONFIGURO EL DISP QUE QUIERO USAR
  MOV AL, 0FEH ; = 11111110
  OUT IMR, AL
  ; 
  MOV AL, N_F10
  OUT INT0, AL
  MOV DX, 0
  STI
  LAZO:JMP LAZO
END

# A
;- Las instrucciones CLI y STI son donde debemos configurar nuestro PIC. Deshabilitan cualquier interrupcion, se ejecuta 
;lo de adentro (nuestra configuracion) y son STI volvemos a activar las interrupciones.

;- Lo que podria suceder es que se ejecute la interrupcion mientras estamos configurando el PIC, es decir, se rompe todo

# B
;- Se usa el valor 0FEh (1111 1110 en binario) para configurar el IMR (campo del PIC donde se debe habilitar/deshabilitar
;dispositivos). Con un 0 indicamos que dispositivo quiero recibir interrupciones, y con 1 los que no.

# C
;- Las instrucciones que le indican al PIC que la interrupcion termino son:
MOV AL, EOI
OUT EOI, AL

;Lo que hace es basicamente pone al campo EOI = 20h (SU MISMO VALOR) Para indicar que la interrupcion termino.

# D
;- La direccion de la subrutina que atiende las interrupciones del F10 la indica la varialbe IP_F10 (en este caso).


























