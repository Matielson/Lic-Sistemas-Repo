package tema3;

import PaqueteLectura.Lector;

public class MainClassEj01 {

    public static void main(String[] args) {
        System.out.println("Ingrese los 3 lados del triangulo");
        double lado1 = Lector.leerDouble();
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        
        System.out.println("Ingrese el color de relleno");
        String colorR = Lector.leerString();
        
        System.out.println("Ingrese el color de linea");
        String colorL = Lector.leerString();
        
        Triangulo t1 = new Triangulo(lado1, lado2, lado3, colorR, colorL);
        
        System.out.println("---------------");
        System.out.println("El perimetro del triangulo creado es: " + t1.calcularPerimetro());
        System.out.println("El area del triangulo creado es: " + t1.calcularArea());
    }
    
}
