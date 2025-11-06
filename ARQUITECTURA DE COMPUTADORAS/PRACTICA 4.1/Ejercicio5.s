# INCISO A

      .data
A:    .word  5
B:    .word  3
S:    .word  0
P:    .word  0
D:    .word  0

      .text
      # Calculo: A + B
      ld $s0, A($zero)
      ld $s1, B($zero)
      dadd $s2, $s1, $s0
      sd $s2, S($zero)

      # Calculo: 2 + (A*B)
      dmul $t0, $s0, $s1
      daddi $s3, $t0, 2
      sd $s3, P($zero)

      # Calculo: A^2 / B
      dmul $t1, $s0, $s0
      ddiv $s4, $t1, $s1
      sd $s4, D($zero)
      
      
# INCISO B

            .data
A:          .word
B:          .word
C:          .word

            .text 
            ld $s0, A($zero) 
            ld $s1, B($zero) 
            beqz $s0, AesCero 
            slt $t0, $s1, $s0 
            bne $t0, $zero, AesMayor 
            sd $s1, C($zero) 
            halt 
AesCero:    sd $zero, C($zero) 
            halt 
AesMayor:   dmul $t1, $zero, 2 
            sd $t1, C($zero) 
            halt


# INCISO C

            .data 
N:          .word 5 
F:          .word 0 

            .text 
            ld $s0, N($zero) 
            ld $s1, F($zero) 
            daddi $s1, $zero, 1 
            daddi $s2, $zero, 1 
            LOOP: slt $t0, $s0, $s2 
            bne $t0, $zero, FIN # Si N < i -> salir 
            dmul $s1, $s1, $s2 # F = F * i 
            daddi $s2, $s2, 1 # i:= i + 1 j 
            j loop 
FIN:        sd $s1, F($zero) halt
