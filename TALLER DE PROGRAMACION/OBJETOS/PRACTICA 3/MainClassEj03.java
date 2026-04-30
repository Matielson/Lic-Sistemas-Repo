package tema3;

public class MainClassEj03 {
    public static void main(String[] args) {
        Autor autor1 = new Autor("Louisa May Alcott", 
            "Escritora estadounidense, conocida por Mujercitas", 
            "Estados Unidos");
        Autor autor2 = new Autor("Gabriel García Márquez", 
            "Colombiano, Premio Nobel de Literatura", 
            "Colombia");
        Autor autor3 = new Autor("Julio Cortázar", 
            "Argentino, escritor del boom latinoamericano", 
            "Argentina");

        Libro libro1 = new Libro("Mujercitas", "Roberts Brothers", 1868, autor1, "978-84-376-0494-7", 1500.0);
        Libro libro2 = new Libro("Cien años de soledad", "Sudamericana", 1967, autor2, "978-84-376-0494-8", 2500.0);
        Libro libro3 = new Libro("Rayuela", "Editorial Sudamericana", autor3, "978-950-07-1234-5");

        Estante estante = new Estante();
        estante.agregarLibro(libro1);
        estante.agregarLibro(libro2);
        estante.agregarLibro(libro3);

        Libro buscado = estante.devolverLibro("Mujercitas");
        if (buscado != null) {
            System.out.println("El autor de Mujercitas es: " + buscado.getPrimerAutor().getNombre());
        } 
        else {
            System.out.println("El libro Mujercitas no se encuentra en el estante.");
        }
    }
}
