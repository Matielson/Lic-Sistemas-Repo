package tema2;

import PaqueteLectura.Lector;

public class MainClassEj05 {

    public static void main(String[] args) {
        Partido[] vPartidos = new Partido[20];
        
        String local;
        String visitante = Lector.leerString();
        int golesL;
        int golesV;
        int cantPartidos = 0;
        
        while (visitante.equals("ZZZ") && cantPartidos < 20) {
            local = Lector.leerString();
            golesL = Lector.leerInt();
            golesV = Lector.leerInt();
            
            vPartidos[cantPartidos] = new Partido(local, visitante, golesL, golesV);    
        }
        
        int cantRiver = 0;
        int cantBoca = 0;
        
        for (int i=0; i < cantPartidos; i++) {
            System.out.println(vPartidos[i].getLocal() + " " + vPartidos[i].getGolesLocal() + " - " + vPartidos[i].getVisitante() + " " + vPartidos[i].getGolesVisitante());
            
            if (vPartidos[i].getGanador().equals("River Plate")) {
                cantRiver++;
            }
            
            if (vPartidos[i].getLocal().equals("Boca")) {
                cantBoca += vPartidos[i].getGolesLocal();
            }
        }
    }
    
}
