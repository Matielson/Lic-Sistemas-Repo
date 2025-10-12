package ejercicio2practica5;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class MainClass {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        // CREO EL ESTACIONAMIENTO
        Estacionamiento est = new Estacionamiento("La Plata Autos", "12 y 50", "8:00", "21:00", 3,3);
        
        // CREO 6 AUTOS Y LOS AGREGO EN POSICIONES ALEATORIAS DEL ESTACIONAMIENTO
        for (int i = 0; i < 6; i++) {
            System.out.println("Ingrese dueño y patente del auto: ");
            Auto au = new Auto(Lector.leerString(), Lector.leerString());
            est.agregarAuto(au, GeneradorAleatorio.generarInt(3)+1, GeneradorAleatorio.generarInt(3)+1);;
        }
        
        System.out.println(est.toString());
        System.out.println("La cantidad de autos en la plaza 1 es: ");
        System.out.println(est.contAutos(1));
        System.out.println("");
        System.out.println("Ingrese la patente a buscar en el estacionamiento: ");
        System.out.println(est.devolverPosAuto(Lector.leerString()));
    }
}
