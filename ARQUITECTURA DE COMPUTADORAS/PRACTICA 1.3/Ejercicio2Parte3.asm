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
