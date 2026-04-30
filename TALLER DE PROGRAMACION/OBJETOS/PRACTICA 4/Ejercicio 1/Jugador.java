package Ejercicio2;

public class Jugador extends Empleado{
    private int cantPartidos;
    private int cantGoles;

    public Jugador(int cantPartidos, int cantGoles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantPartidos = cantPartidos;
        this.cantGoles = cantGoles;
    }
    
    @Override
    public double calcularEfectividad() {
        return (double) cantGoles / cantPartidos;
    }
    
    @Override
    public double calcularSueldoACobrar() {
        double aux = this.getSueldo();
        aux += this.getSueldo() * 0.1 * this.getAntiguedad();
        
        if (this.calcularEfectividad() > 0.5) {
            aux += this.getSueldo();
        }
        
        return aux;
    }
}
