package Ejercicio2;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldo;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    @Override
    public String toString () {
        String aux = "";
        aux += "Nombre: " + this.getNombre() + " Sueldo a cobrar: " + this.calcularSueldoACobrar() + " Efectividad: " + this.calcularEfectividad();
        return aux;
    }
}
