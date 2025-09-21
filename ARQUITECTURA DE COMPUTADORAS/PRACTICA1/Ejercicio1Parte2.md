| Instrucción | Valor del registro SP | AX | BX |
|-------------|------------------------|----|----|
| mov ax,5    | 8000h                  | 5  | -  |
| mov bx,3    | 8000h                  | 5  | 3  |
| push ax     | 7FFEh                  | 5  | 3  |
| push ax     | 7FFCh                  | 5  | 3  |
| push bx     | 7FFAh                  | 5  | 3  |
| pop bx      | 7FFCh                  | 5  | -  |
| pop bx      | 7FFEh                  | 5  | -  |
| pop ax      | 8000h                  | -  | -  |
