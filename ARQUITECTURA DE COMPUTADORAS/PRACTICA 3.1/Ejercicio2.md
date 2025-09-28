| Dispositivos | IMR       | INT0 | INT1       | INT2       | Dirección Vector |
|--------------|-----------|------|------------|------------|------------------|
| F10          | 1111 1110 | 5    | No importa | No importa | 20               |
| F10          | 1111 1110 | 8    |            |            | 32               |
|              | 1111 1101 | 10   |            |            | 40               |
| HANDSHAKE    |           | No importa    | No importa | 10         | 40               |
| Ninguno  | 1111 1111 |   -   |      -     |      -     |         -        |
| F10 y Timer  | 1111 1100 | 10   | 20         |            |                  |
| Timer y HandShake  | 1111 1001 |      |            |            | 16 y 32          |
| F10, Timer y HandShake | 1111 1000 | 5    | 10         | 15         | 20, 40 y 60                 |
