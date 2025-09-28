# INCISO A

PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 1000h
msj     DB "Ingrese un caracter a imprimir:"
char    DB ?
FIN     DB ? 

ORG 3000h
ini_pio:
 ; CONFIGURO EL PA (estado) CON EL STROBE EN 0 Y EL BUSY EN 1
 MOV AL, 11111101b
 OUT CA, AL
 
 ; CONFIGURO EL PUERTO DE DATO TODO EN SALIDA.
 MOV AL, 00000000b
 OUT CB, AL
 RET

poll: ; QUEDA EN BUCLE HASTA QUE SE LIBERE LA IMPRESORA
 IN AL, PA ; Tomo el estado de la impresora
 AND AL, 1 ; Pregunto si esta ocupada
 JNZ poll ; Utilizando el "flag interno" salto si sigue ocupada
 RET
 
flanco_ascendente: 
 ; MANDO EL STROBE EN 0
 IN AL, PA
 AND AL, 0FDh
 OUT PA, AL

 ; MANDO EL STROBE EN 1 (FLANCO ASCENDENTE)
 IN AL, PA
 OR AL, 2
 OUT PA, AL
 
 ; VUELVO
 RET

imprimir_caracter:
 ; Llamo al bucle "poll" esperando que se libere
 call poll
 ; Se libero la impresora, mando mi caracter al puerto de datos (PB).
 MOV AL, [BX]
 OUT PB, AL
 call flanco_ascendente
 RET

 ORG 2000h
 MOV BX, offset msj
 MOV AL, offset char - offset msj
 INT 7
 MOV BX, offset char
 INT 6
 call ini_pio
 call imprimir_caracter
 HLT
END 


# INCISO B
