package tema2;

import PaqueteLectura.Lector;

public class MainClassEj03 {

    public static void main(String[] args) {
        Persona[][] casting = new Persona[5][8];
        int dia = 0;
        int turno = 0;
        int cantAgregados = 0;
        String nombre = Lector.leerString();
        
        while (cantAgregados < 40 && nombre.equals("ZZZ")) {
            int dni = Lector.leerInt();
            int edad = Lector.leerInt();
            
            casting[cantAgregados / 8][cantAgregados % 8] = new Persona(nombre, dni, edad);
            cantAgregados++;
            
            nombre = Lector.leerString();
        }
        
        for (int i = 0; i < cantAgregados; i++) {
            int fila = i / 8; 
            int col  = i % 8;

            Persona p = casting[fila][col];
            System.out.println("Día " + (fila+1) + " - Turno " + (col+1) + ": " + p.getNombre());
        }
        
        
    }
    
}
