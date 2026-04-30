package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class MainClassEj02 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int cantAgregados = 0;
        Persona[] vPersonas = new Persona[15];
        boolean noCero = true;
        
        while ((cantAgregados < 15) && (noCero)) {
            Persona p = new Persona(GeneradorAleatorio.generarString(7), GeneradorAleatorio.generarInt(100), GeneradorAleatorio.generarInt(100));
            
            vPersonas[cantAgregados] = p;
            cantAgregados++;
            
            if (p.getEdad() == 0) {
                noCero = false;
            }
        }
        
        int cantMas65 = 0;
        int dniAct;
        int edadAct;
        int minDni = 99999;
        Persona aux = null;
        
        for (int i=0; i < cantAgregados; i++) {
            edadAct = vPersonas[i].getEdad();
            dniAct = vPersonas[i].getDNI();
            
            if (edadAct > 65) {
                cantMas65++;
            }
            if (dniAct < minDni) {
                minDni = dniAct;
                aux = vPersonas[i];
            }
        }
        
        System.out.println("La cantidad de personas mayores a 65 años es: " + cantMas65);
        if (aux != null) {
            System.out.println(aux.toString());
        }   
    }
}
