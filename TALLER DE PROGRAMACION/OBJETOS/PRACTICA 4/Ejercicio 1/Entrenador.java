package Ejercicio2;

public class Entrenador extends Empleado{
    private int cantCampeonatos;

    public Entrenador(int cantCampeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatos = cantCampeonatos;
    }

    @Override
    public double calcularEfectividad() {
        return (double) cantCampeonatos / this.getAntiguedad();
    }
    
    @Override
    public double calcularSueldoACobrar() {
        double aux = this.getSueldo();
        aux += this.getSueldo() * 0.1 * this.getAntiguedad();
        
        if (this.cantCampeonatos >= 1 && this.cantCampeonatos <= 4) {
            aux += 5000;
        }
        else if (this.cantCampeonatos >= 5 && this.cantCampeonatos <= 10) {
            aux += 30000;
        }
        else {
            aux += 50000;
        }
        
        return aux;
    }
}
