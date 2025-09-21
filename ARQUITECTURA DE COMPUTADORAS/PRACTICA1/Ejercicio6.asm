       ORG 1000H
letra  DB ?
cant   DB 0
       ORG 2000H
       MOV letra, 32
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 6
       INC letra
       INC cant
       CMP byte ptr[offset letra],'.'
       JNZ bucle
       MOV DL, cant
       INT 0
END
