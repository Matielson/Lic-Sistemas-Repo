# INCISO A

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
       CMP byte ptr[offset letra],'.'+1
       JNZ bucle
       MOV DL, cant
       INT 0
END

# INCISO B

       ORG 1000H
letra  DB ?
cant   DB 0
       ORG 2000H
       MOV letra, 32
       MOV AL, 1
       
bucle: MOV BX, offset letra
       INT 6
       CMP byte ptr[offset letra],'a'
       JNZ NoEsA
       INC cant

NoEsA: INC letra
       CMP byte ptr[offset letra],'.'+1
       JNZ bucle
       MOV DL, cant
       INT 0
END

# INCISO C

