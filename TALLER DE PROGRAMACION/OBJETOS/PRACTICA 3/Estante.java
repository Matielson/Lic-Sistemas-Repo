package tema3;

public class Estante {
    private Libro[] vLibros = new Libro[20];
    int dimL = 0;

    public Estante() {
        for (int i=0; i<20; i++) {
            vLibros[i] = null;
        }
    }
    
    public boolean estaLleno() {
        return dimL == 20;
    }
    
    public void agregarLibro(Libro libro) {
        if (dimL < 20) {
            vLibros[dimL] = libro;
            dimL++;
        }
    }
    
    public Libro devolverLibro(String titulo) {
        int i = 0;
        Libro aux = null;
        
        while (i < dimL) {
            if (vLibros[i].getTitulo().equals(titulo)) {
                return vLibros[i];
            }
            i++;
        }
        return null;
    }
    
    
}
