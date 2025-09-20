       ORG 1000H
letra  DB "A"
       ORG 2000H
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 7
       INC letra
       CMP byte ptr[offset letra],'Z'
       JNZ bucle
       INT 0
END
