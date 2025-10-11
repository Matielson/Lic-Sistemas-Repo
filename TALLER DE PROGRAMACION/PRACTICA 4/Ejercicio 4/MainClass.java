package Ejercicio4Practica4;

import PaqueteLectura.GeneradorAleatorio;

public class MainClass {

    public static void main(String[] args) {
        
        Anual sistemaAnual = new Anual("La Plata", -34.921, 57.955, 2021, 3);
        for (int i=0; i<3; i++){
            for (int j=0; j<12; j++) {
                double temp = GeneradorAleatorio.generarDouble(40);
                sistemaAnual.setTemperatura(j+1,i+sistemaAnual.getAnoInicio(),temp);
            }
        }
        
        System.out.println(sistemaAnual.toString());

      --- FALTA TODO LO DE MENSUAL
    }
}
