package tema2;

import PaqueteLectura.Lector;

public class MainClassEj04 {

    public static void main(String[] args) {
        Persona[][] mCasting = new Persona[5][8];
        int[] vDimL = new int[5];
        String nombre = Lector.leerString();
        int dni;
        int edad;
        int dia;
        int cantTotal = 0;
        for (int i=0; i<5; i++) {
            vDimL[i] = 0;
        }
        
        while (!nombre.equals("ZZZ") && cantTotal < 40) {
            dni = Lector.leerInt();
            edad = Lector.leerInt();
            dia = Lector.leerInt();
            
            if (vDimL[dia - 1] < 7) {
                mCasting[dia][vDimL[dia]] = new Persona(nombre,dni,edad);
                vDimL[dia]++;
                cantTotal++;
            }
            else {
                System.out.println("No hay turnos disponibles en el dia ingresado.");
            }
            
            nombre = Lector.leerString();
        }
    }
    
}
