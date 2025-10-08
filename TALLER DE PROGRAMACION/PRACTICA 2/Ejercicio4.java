package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ASDASDASDASD {

    public static void main(String[] args) {
        Partido [] vPartidos = new Partido[20];
        int cantPartidos = 0;
        
        String equipoLocal = GeneradorAleatorio.generarString(7);
        String equipoVisitante = GeneradorAleatorio.generarString(7);
        int cantLocal = GeneradorAleatorio.generarInt(10);
        int cantVisitante = GeneradorAleatorio.generarInt(10);
        
        while ((cantPartidos < 20) && !equipoVisitante.equals("ZZZ"))  {
            vPartidos[cantPartidos] = new Partido(equipoLocal, equipoVisitante, cantLocal, cantVisitante);
            
            cantPartidos++;
            
            if (vPartidos[cantPartidos].getGanador() == "River");
            
            if (cantPartidos < 20) {
                equipoLocal = GeneradorAleatorio.generarString(7);
                equipoVisitante = GeneradorAleatorio.generarString(7);
                cantLocal = GeneradorAleatorio.generarInt(10);
                cantVisitante = GeneradorAleatorio.generarInt(10);
            }
        }
        
        for (int i=0; i<20; i++) {
            System.out.println("Local: " + vPartidos[i].getLocal() + " Goles: " + vPartidos[i].getGolesLocal() + (" VS") + (" Visitante: ") + vPartidos[i].getVisitante() + (" Goles: ") +vPartidos[i].getGolesVisitante());
        }
    }
}
