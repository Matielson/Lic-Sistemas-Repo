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

PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 1000h
msj     DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
fin2    DB ? 
msjP    DB "Un mensaje se esta escribiendo en la impresora..."
fin2    DB ?

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
 INC BX
 CMP BX, offset fin2
 JNZ imprimir_caracter
 RET

 ORG 2000h
 MOV BX, offset msjP
 MOV AL, offset fin - offset msjP
 INT 7
 call ini_pio
 MOV BX, offset msj
 call imprimir_caracter
 HLT
END 


# INCISO C

PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 1000h
msjP    DB "El mensaje ingresado se esta escribiendo en la impresora..."
fin2    DB ?
msj     DB ?
fin     DB ?


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
 MOV CX, 0 ; Inicializo mi contador local
 ; Llamo al bucle "poll" esperando que se libere
 call poll
 ; Se libero la impresora, mando mi caracter al puerto de datos (PB).
 MOV AL, [BX]
 OUT PB, AL
 ; Realizo el flanco ascendente para que la impresora sepa que queremos imprimir
 call flanco_ascendente
 INC BX ; Paso al siguiente caracter
 INC CX ; Incremento mi contador local
 CMP byte ptr[BX], 0 ; Pregunto si llegue al final (con mi terminador (0))
 JNZ imprimir_caracter ; Si no llegue, sigo imprimiendo
 RET

 ORG 2000h
 MOV DX, 0 ; Inicializo mi contador de caracteres.
 ; Ingreso un mensaje a imprimir.
 MOV BX, offset msj
loop: INT 6
 CMP byte ptr[BX], '0'
 JZ seguir
 INC BX
 INC DX
 JMP loop
 ; Mensaje a mostrar en la pantalla (msjP)
seguir: MOV byte ptr[BX], 0 ; LE ASIGNO UN TERMINADOR A MI MENSAJE
 MOV BX, offset msjP
 MOV AL, offset fin2 - offset msjP
 INT 7
 ; Configuramos el PIO para la impresora.
 call ini_pio
 MOV BX, offset msj ; Movemos a BX la direccion del primer caracter del string a imprimir
 ; Imprimimos el caracter (bucle si es un string)
 call imprimir_caracter
 HLT ; Termina la ejecucion
END 
