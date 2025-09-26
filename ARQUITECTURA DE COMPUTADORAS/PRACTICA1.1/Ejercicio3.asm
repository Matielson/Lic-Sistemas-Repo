; a)- La principal diferencia que tiene INT7 con INT6 es que en BX se almacena la direccion de memoria en donde esta la variable donde queremos guardar el caracter a ingresar.
 
; b)- La segunda instruccion INT 7 imprime el caracter que fue leido.

; c)- El valor numerico almacenado en CL es el que se ingresa por teclado.

; d)- 

ORG 1000H
MSJ   DB "INGRESE UN NUMERO:"
FIN   DB ?

ORG 1500H
NUM1   DB ?
NUM2   DB ?

ORG 2000H
  MOV BX, OFFSET MSJ
  MOV AL, OFFSET FIN-OFFSET MSJ
  INT 7
  MOV BX, OFFSET NUM1
  INT 6
  MOV AL, 1
  INT 7
  MOV BX, OFFSET NUM2
  INT 6
  MOV AL, 1
  INT 7
  MOV CL, NUM1
  MOV CH, NUM2
  INT 0
END

