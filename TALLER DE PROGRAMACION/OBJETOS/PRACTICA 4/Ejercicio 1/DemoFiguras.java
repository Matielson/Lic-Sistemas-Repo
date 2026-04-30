package tema4;


public class DemoFiguras {

    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Area: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
        
        Circulo cir = new Circulo(5, "Verde", "Rojo");
        Triangulo tri = new Triangulo(5,5,5, "Rojo", "Violeta");
        
        System.out.println(cir);
        System.out.println(tri);
        
        cir.despintar();
        cir.esGrande();
        
        tri.despintar();
        tri.esGrande();
        
        System.out.println(cir);
        System.out.println(tri);
    }
    
    
    
}
