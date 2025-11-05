# INCISO A

      .data
A:    .word  5
B:    .word  3
S:    .word  0
P:    .word  0
D:    .word  0

      .text
      ld $s0, A($zero)
      ld $s1, B($zero)
      dadd $s2, $s1, $s0
      sd $s2, S($zero)

      dmul $t0, $s0, $s1
      daddi $s3, $t0, 2
      sd $s3, P($zero)
