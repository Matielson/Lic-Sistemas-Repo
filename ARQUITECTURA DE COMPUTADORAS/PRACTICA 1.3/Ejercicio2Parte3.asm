# INCISO A

       ORG 1000h
A      DB 8
B      DB 5
C      DB 4
D      DB ?

       ORG 3000h
CALC:  ADD DL, AL
       ADD DL, AH
       SUB DL, CL
       RET

       ORG 2000h
       MOV AL, A
       MOV AH, B
       MOV CL, C
       CALL CALC
       MOV D, DL
       INT 0
END


# INCISO B

       ORG 1000h
A      DB 8
B      DB 5
C      DB 4
D      DB ?

       ORG 3000h
CALC:  PUSH BX
       MOV BX, SP
       SUB BX, 8
       MOV DL, [BX]
       SUB BX, 2
       ADD DL, [BX]
       SUB BX, 2
       SUB DL, [BX]
       POP BX
       RET

       ORG 2000h
       MOV AL, A
       PUSH AX
       MOV AL, B
       PUSH AX
       MOV AL, C
       PUSH AX
       CALL CALC
       MOV D, DL
       POP AX
       POP AX
       POP AX
       INT 0
END

# INCISO C

TERMINAR.



