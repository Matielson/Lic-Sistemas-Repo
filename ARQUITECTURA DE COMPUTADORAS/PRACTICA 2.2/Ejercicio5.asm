# INCISO A

HAND_DATO EQU 40h
HAND_ESTADO EQU 41h

ORG 1000h
msj    DB "INGENIERIA E INFORMATICA"
fin    DB ?

ORG 3000h
ini_hand:
 IN AL, HAND_ESTADO ; Traigo el estado actual del estado a AL
 AND AL, 01111111b ; Fuerzo el estado para dejar el bit mas significativo en 0 (ponerlo en modo polling)
 OUT HAND_ESTADO, AL ; Pongo el nuevo estado en el estado del handshake.
 RET

poll: ; QUEDA EN BUCLE HASTA QUE SE LIBERE LA IMPRESORA
 IN AL, HAND_ESTADO ; Tomo el estado de la impresora
 AND AL, 1 ; Pregunto si esta ocupada
 JNZ poll ; Utilizando el "flag interno" salto si sigue ocupada
 RET

imprimir_caracter_hand:
 call poll
 MOV AL, [BX]
 OUT HAND_DATO, AL
 INC BX
 CMP BX, offset fin
 JNZ imprimir_caracter_hand
 RET
 
 ORG 2000h
 call ini_hand
 MOV BX, offset msj
 call imprimir_caracter_hand
 HLT
END 


# INCISO B

; - La diferencia con el inciso anterior es que no tengo que decirle manualmente a la impresora que puede imprimir
; un caracter, ya que el HandShake se encarga de eso.

; - La principal ventaja es que yo lo unico que tengo que hacer es configurar el HS para la impresion, y mandarle el dato que quiero imprimir. 
; En cambio, si la estuviera manejando a traves del PIO, tendria que ademas de poner el dato que quiero imprimir en el PIO debo decirle a la impresora "ahora podes imprimir" (haciendo el flanco ascendente con el strobe).

; - No, ya que el HS unicamente maneja la impresora. Las LUCES y las LEDS son manejadas unicamente por el PIO.
