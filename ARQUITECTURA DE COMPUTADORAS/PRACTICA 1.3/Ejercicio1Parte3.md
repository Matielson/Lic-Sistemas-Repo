| Código                       | A través de |                | Por         |            |
|------------------------------|-------------|----------------|-------------|------------|
|                              | Registro    | Pila           | Valor       | Referencia |
| a) mov ax,5 <br> call subrutina |      -      |                |       -     |            |
| b) mov dx, offset A <br> call subrutina |     -       |                |             |      -     |
| c) mov bx,5 <br> push bx <br> call subrutina <br> pop bx |             |        -       |      -      |            |
| d) mov cx, offset A <br> push cx <br> call subrutina <br> pop cx |             |        -       |             |      -     |
| e) mov dl,5 <br> call subrutina |      -      |                |      -      |            |
| f) call subrutina <br> mov A, dx |             |                |             |      -     |
 
