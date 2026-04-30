package tema3;

public class MainClassEJ04 {

    public static void main(String[] args) {
        Hotel hotel = new Hotel(10);
        
        Persona cli1 = new Persona("Juan", 7890, 30);
        Persona cli2 = new Persona("Pedro", 3451, 21);
        Persona cli3 = new Persona("Marcos", 4925, 52);
        
        hotel.agregarCliente(cli1, 2);
        hotel.agregarCliente(cli2, 6);
        hotel.agregarCliente(cli3, 5);
        
        System.out.println(hotel.toString());
        
        hotel.aumentarPrecio(1000);
        
        System.out.println(hotel.toString());
    }
    
}
