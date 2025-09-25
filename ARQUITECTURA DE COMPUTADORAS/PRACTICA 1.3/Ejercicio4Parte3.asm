# INCISO A

      ORG 1000h
A     DB 8
B     DB 5
RES   DW ?

      ORG 3000h
mult: MOV BL, AH
      MOV CL, AL
      XOR AX, AX 
      CMP CL, 0
      JZ fin
loop: CMP BL, 0
      JZ fin
      ADD AX, CX
      DEC BL
      JMP loop
fin:  MOV RES, AX
      RET
      
      ORG 2000h
      MOV AL, A
      MOV AH, B
      call mult
      HLT
      END

# INCISO B

      ORG 1000h
A     DB 8
B     DB 5
RES   DW ?

      ORG 3000h
mult: 
; TRAER VALOR DE A
      MOV BX, AX
      MOV AX, [BX]
; TRAER VALOR DE B      
      MOV BX, CX
      MOV BX, [BX]
; MULTIPLICARLOS
      CMP AL, 0
      JZ fin
loop: CMP BL, 0
      JZ fin
      ADD DX, AX
      DEC BX
      JMP loop
fin:  MOV RES, DX
      RET
      
      ORG 2000h
      MOV AX, offset A
      MOV CX, offset B
      call mult
      HLT
      END

# INCISO C

      ORG 1000h
A     DB 8
B     DB 5
RES   DW ?

      ORG 3000h
mult: 
; TRAER VALOR DE A
      MOV BX, AX
      MOV AX, [BX]
      XOR AH, AH
; TRAER VALOR DE B      
      MOV BX, CX
      MOV BX, [BX]
      XOR BH, BH
; MULTIPLICARLOS
      CMP AX, 0
      JZ fin
loop: CMP BX, 0
      JZ fin
      ADD DX, AX
      DEC BX
      JMP loop
fin:  MOV RES, DX
      MOV DX, offset RES
      RET
      
      ORG 2000h
      MOV AX, offset A
      MOV CX, offset B
      call mult
      HLT
      END

# INCISO D

TERMINAR

# INCISO E 

TERMINAR


      
