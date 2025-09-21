| Instrucción | Valor del registro SP | AX | BX |
|-------------|------------------------|----|----|
| mov ax,5    |                        | 5  |    |
| mov bx,3    |                        | 5  | 3  |
| push ax     | SP-2                   | 5  | 3  |
| push ax     | SP-4                   | 5  | 3  |
| push bx     | SP-6                   | 5  | 3  |
| pop bx      | SP-4                   | 5  | ?  |
| pop bx      | SP-2                   | 5  | ?  |
| pop ax      | SP inicial             | ?  | ?  |
