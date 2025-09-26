          ORG 1000h
msj1      DB "Ingresa la palabra a adivinar:"
msj2      DB "Comenza a adivinar!"
pal       DB 100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
pal2      DB 100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
perdiste  DB "Perdiste, el string era", 0
          
          ORG 3000h
          ; FASE 1
run:      MOV BX, offset msj1
          MOV AL, 30
          INT 7
          RET
           
leerPal:  MOV BX, offset pal
loop:     INT 6
          CMP byte ptr[BX], '.'
          JZ fin
          INC BX
          JMP loop
fin:      RET

run2:     MOV BX, offset msj2
          MOV AL, 19
          INT 7
          RET

          ; FASE 2

leerChar: MOV CL, 0
          MOV DX, offset pal
          MOV BX, offset pal2
          INT 6
          CMP DX, '.'
          JZ success
          INC CL
          CMP CL, 50
          JZ loss
          CMP DX, BX
          JZ impr
          
success:  MOV AL, 1
          INT 7
          JMP leerChar
          
impr:     MOV AL, 1
          INT 7
          JMP leerChar
          
loss:     MOV BX, offset perdiste
          INT 6
          INC BX
          CMP byte ptr [BX], 0
          JNZ loss
          RET




          ORG 2000h
          ; FASE 1
          CALL run
          CALL leerPal
          CALL run2
          ; FASE 2
          
          
          HLT
          END
