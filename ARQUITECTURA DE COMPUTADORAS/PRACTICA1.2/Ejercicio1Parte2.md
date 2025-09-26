# EJERCICIO A

| Instrucción | Valor del registro SP  | AX | BX |
|-------------|------------------------|----|----|
| mov ax,5    | 8000h                  | 5  | -  |
| mov bx,3    | 8000h                  | 5  | 3  |
| push ax     | 7FFEh                  | 5  | 3  |
| push ax     | 7FFCh                  | 5  | 3  |
| push bx     | 7FFAh                  | 5  | 3  |
| pop bx      | 7FFCh                  | 5  | -  |
| pop bx      | 7FFEh                  | 5  | -  |
| pop ax      | 8000h                  | -  | -  |


# EJERCICIO B

| -  | Dirección | Instrucción       | Valor del registro SP  |
|----|-----------|-------------------|------------------------|
| 1  |  -------  | org 3000h         |        -------         |
| 2  | 3000h     | rutina: mov bx,3  |         7FFCh          |
| 3  | 3004h     | ret               |         7FFEh          |
| 4  |  -------  | org 2000h         |        -------         |
| 5  | 2000h     | push ax           |         7FFEh          |
| 6  | 2001h     | call rutina       |         7FFCh          |
| 7  | 2004h     | pop bx            |         8000h          |
| 8  | 2005h     | hlt               |         8000h          |
| 9  |  -------  | end               |        -------         |

 
# EJERCICIO C

FALTA HACER
