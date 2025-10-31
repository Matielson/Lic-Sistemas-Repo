# Aritmético-lógicas (AL)
| Instrucción | Tipo | Descripción                                                    | Ejemplo                                 |
| ----------- | ---- | -------------------------------------------------------------- | --------------------------------------- |
| **and**     | AL   | Realiza la operación lógica AND bit a bit entre dos registros. | `and $t0, $t1, $t2` → $t0 = $t1 AND $t2 |
| **andi**    | AL   | AND inmediato (usa un número constante).                       | `andi $t0, $t1, 5`                      |
| **or**      | AL   | OR bit a bit.                                                  | `or $t0, $t1, $t2`                      |
| **ori**     | AL   | OR inmediato.                                                  | `ori $t0, $t1, 2`                       |
| **xor**     | AL   | XOR bit a bit (1 si los bits son distintos).                   | `xor $t0, $t1, $t2`                     |
| **xori**    | AL   | XOR inmediato.                                                 | `xori $t0, $t1, 4`                      |
| **slt**     | AL   | “Set Less Than”: pone 1 si $t1 < $t2, si no, 0.                | `slt $t0, $t1, $t2`                     |
| **slti**    | AL   | Igual que `slt` pero con un valor inmediato.                   | `slti $t0, $t1, 10`                     |
| **add**     | AL   | Suma dos registros.                                            | `add $t0, $t1, $t2`                     |
| **dadd**    | AL   | Suma de 64 bits (entero largo).                                | `dadd $t0, $t1, $t2`                    |
| **daddi**   | AL   | Suma inmediata de 64 bits.                                     | `daddi $t0, $t1, 4`                     |
| **sub**     | AL   | Resta dos registros.                                           | `sub $t0, $t1, $t2`                     |
| **dmul**    | AL   | Multiplica enteros de 64 bits.                                 | `dmul $t0, $t1, $t2`                    |
| **ddiv**    | AL   | Divide enteros de 64 bits.                                     | `ddiv $t0, $t1, $t2`                    |
| **nop**     | AL   | “No operation”: no hace nada (espera un ciclo).                | `nop`                                   |

# Salto condicional (SC)
| Instrucción | Tipo | Significado / Comentario breve        | Ejemplo                                                    |
| ----------- | ---- | ------------------------------------- | ---------------------------------------------------------- |
| **beq**     | SC   | Salta si los registros son iguales    | `beq $t0, $t1, etiqueta` → Salta a `etiqueta` si $t0 = $t1 |
| **beqz**    | SC   | Salta si el registro es igual a 0     | `beqz $t0, etiqueta` → Salta a `etiqueta` si $t0 = 0       |
| **bnez**    | SC   | Salta si el registro es distinto de 0 | `bnez $t0, etiqueta` → Salta a `etiqueta` si $t0 ≠ 0       |
| **bne**     | SC   | Salta si los registros son distintos  | `bne $t0, $t1, etiqueta` → Salta a `etiqueta` si $t0 ≠ $t1 |

# Salto incondicional (SI)
| Instrucción | Tipo | Significado / Comentario breve                 | Ejemplo                                                                       |
| ----------- | ---- | ---------------------------------------------- | ----------------------------------------------------------------------------- |
| **halt**    | SI   | Detiene la ejecución del programa              | `halt` → Termina el programa inmediatamente                                   |
| **j**       | SI   | Salto incondicional a una etiqueta             | `j etiqueta` → Salta siempre a `etiqueta`                                     |
| **jal**     | SI   | Salto incondicional con enlace (a subrutina)   | `jal subrutina` → Salta a `subrutina` y guarda la dirección de retorno en $ra |
| **jr**      | SI   | Salta a la dirección almacenada en un registro | `jr $ra` → Salta a la dirección que está en $ra                               |

# Lectura de memoria (LMEM)
| Instrucción | Tipo | Significado / Comentario breve              | Ejemplo                                                      |
| ----------- | ---- | ------------------------------------------- | ------------------------------------------------------------ |
| **ld**      | LMEM | Carga un doubleword (64 bits) desde memoria | `ld R1, A(R0)` → R1 = memoria[A + 0]                    |
| **lb**      | LMEM | Carga un byte con signo desde memoria       | `lb R2, B(3)` → R2 = byte con signo de memoria[B + 3]  |
| **lbu**     | LMEM | Carga un byte sin signo                     | `lbu R3, A(R0)` → R3 = byte sin signo de memoria[A + 0] |
| **lw**      | LMEM | Carga una palabra (32 bits) desde memoria   | `lw $t0, 0($t1)` → $t0 = palabra de 32 bits en memoria[$t1]  |

# Escritura de memoria (EMEM)
| Instrucción | Tipo | Significado / Comentario breve | Ejemplo                                           |
| ----------- | ---- | ------------------------------ | ------------------------------------------------- |
| **sb**      | EMEM | Guarda un byte en memoria      | `sb $t0, 4($t1)` → memoria[$t1 + 4] = byte de $t0 |
| **sd**      | EMEM | Guarda un doubleword (64 bits) | `sd $t0, 8($t1)` → memoria[$t1 + 8] = $t0         |
| **sw**      | EMEM | Guarda una palabra (32 bits)   | `sw $t0, 0($t1)` → memoria[$t1] = palabra de $t0  |
