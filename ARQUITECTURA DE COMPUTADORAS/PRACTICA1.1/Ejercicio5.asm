# EJERCICIO A:

       ORG 1000H
letra  DB "A"
       ORG 2000H
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 7
       INC letra
       CMP byte ptr[offset letra],'Z'+1
       JNZ bucle
       INT 0
END

# EJERCICIO B
; Tendria que modificar el valor de la variable letra (la inicial) y la condicion de fin Z y poner 9

       ORG 1000H
letra  DB "0"
       ORG 2000H
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 7
       INC letra
       CMP byte ptr[offset letra],'9'+1
       JNZ bucle
       INT 0
END

# EJERCICIO C
       ORG 1000H
letra  DB ?
       ORG 2000H
       MOV letra, 32
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 7
       INC letra
       CMP byte ptr[offset letra],127
       JNZ bucle
       INT 0
END

# EJERCICIO D
       ORG 1000H
letra  DB "0"
       ORG 2000H
       MOV AL, 1
bucle: MOV BX, offset letra
       INT 7
       INC letra
       MOV BX, 10
       INT 7
       CMP byte ptr[offset letra],'9'+1
       JNZ bucle
       INT 0
END



