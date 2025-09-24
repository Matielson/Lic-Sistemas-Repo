# INCISO A

      ORG 1000h
A     DB 8
B     DB 5
RES   DW ?
      ORG 3000h
mult: MOV BL, AH
      MOV CL, AL
      XOR AX, AX 
loop: CMP BL, 0
      JZ fin
      ADD AX, CX
      DEC BL
      JMP loop
fin:  RET
      ORG 2000h
      MOV AL, A
      MOV AH, B
      call mult
      HLT
      END

# INCISO B

      
