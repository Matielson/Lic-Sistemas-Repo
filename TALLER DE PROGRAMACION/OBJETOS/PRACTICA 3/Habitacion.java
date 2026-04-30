package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costo = GeneradorAleatorio.generarDouble(6001) + 2000;
        this.ocupada = false;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setOcupada() {
        this.ocupada = true;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    @Override
    public String toString() {
        String aux = " cuesta: " + this.costo;
        if (this.ocupada == true) {
            aux += " Ocupada por: " + this.cliente.toString() + "\n";
        }
        else {
            aux += " Desocupada " + "\n";
        }
        return aux;
    }
    
    
}
