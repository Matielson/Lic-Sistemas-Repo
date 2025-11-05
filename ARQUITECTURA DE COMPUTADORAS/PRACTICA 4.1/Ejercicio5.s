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
A:    .word
B:    .word
C:    .word
      
