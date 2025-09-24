          ORG 1000h
N         DB ?
password  DB 100, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
clave     DB "aaaa"
perm      DB "Acceso permitido"
deng      DB "Acceso denegado"
bloq      DB "Acceso BLOQUEADO"


          ORG 3000h
leerPass: INT 6
          INC AL
          CMP AL, N
          JZ fin
          INC BX
          JMP leerPass
fin:      RET

compStr:  ;LEO LA CONTRA INGRESADA
          MOV BX, AX 
          MOV AX, [BX] 
          ;LEO LA CONTRA DEFINIDA
          MOV BX, CX
          MOV BX, [BX]
          ;COMPARO LAS PASSWORDS
          CMP AX, BX
          ;DEFINO SI SON IGUALES O NO 
          JZ equal
          MOV DL, 0
          RET
equal:    MOV DL, 0FFh
          RET

impMsj:   call compStr
          CMP DL, 0FFh
          JZ allowed
          
          ; NO PERMITIDO
denied:   INC DH
          CMP DH, 5
          JZ blocked
          MOV AL, 15
          MOV BX, offset deng
          INT 7
          ;-------------
          XOR BX, BX
          MOV BX, offset password
          XOR AL, AL
          call leerPass
          MOV AX, offset password
          MOV CX, offset clave
          JMP impMsj
          
          ; BLOQUEADO
blocked:  MOV AL, 16
          MOV BX, offset bloq
          INT 7
          RET
          
          ; PERMITIDO
allowed:  MOV AL, 16
          MOV BX, offset perm
          INT 7
          RET

          
          ORG 2000h
          MOV BX, offset password
          MOV N, 4
          call leerPass
          MOV AX, offset password
          MOV CX, offset clave
          XOR DX, DX
          call impMsj
          HLT
          END
