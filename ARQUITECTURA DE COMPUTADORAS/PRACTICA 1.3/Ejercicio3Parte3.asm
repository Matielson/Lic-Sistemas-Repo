
          ORG 1000h
mensaje   DB 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
char      DB ?
cant      DB ?
cantTotal DB 0
          ORG 3000h
leerChar: INT 6
          CMP byte ptr [BX], '0'
          JZ fin
          INC BX
          INC cantTotal
          JMP leerChar
fin:      MOV byte ptr [BX], 0
          RET

es_mayus: MOV CH, 'Z'
          CMP AL, 'A'   ;d=100 - A=65
          JS noEsMay
          CMP CH, AL   ;Z=90 - d=100
          JS noEsMay
          MOV AH, 0FFh
          RET
noEsMay:  MOV AH, 0
          RET  

a_minus:  ADD AL, 20h
          RET

strMin:   MOV DL, cantTotal
loop:     MOV AL, byte ptr[BX]
          call es_mayus
          CMP AH, 0FFh
          JNZ seguir
          call a_minus
          MOV [BX], AL
seguir:   INC BX
          DEC DL
          JNZ loop
          RET

leerPal:  MOV AL, cantTotal
          MOV BX, offset mensaje
          INT 7
          RET

          ORG 2000h
          MOV BX, offset mensaje
          call leerChar ; INGRESE 0 PARA TERMINAR
          MOV BX, offset mensaje
          call strMin
          call leerPal
          HLT
          END

