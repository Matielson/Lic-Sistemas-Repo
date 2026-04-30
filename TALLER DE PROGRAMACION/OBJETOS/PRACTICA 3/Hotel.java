package tema3;

public class Hotel {
    private Habitacion[] vHabitaciones;
    private int dimF;

    public Hotel(int nHabitaciones) {
        this.vHabitaciones = new Habitacion[nHabitaciones];
        for (int i=0; i<nHabitaciones; i++) {
            vHabitaciones[i] = new Habitacion();
        }
        this.dimF = nHabitaciones;
    }
    
    public void agregarCliente(Persona cliente, int num) {
        this.vHabitaciones[num].setCliente(cliente);
        this.vHabitaciones[num].setOcupada();
    }
    
    public void aumentarPrecio(double precio) {
        for (int i=0; i<dimF; i++) {
            vHabitaciones[i].setCosto(vHabitaciones[i].getCosto() + precio);
        }
    }
    
    @Override
    public String toString() {
        String aux = "";
        for (int i=0; i<dimF; i++) {
            aux += "Habitacion " + (i+1) + ": " + vHabitaciones[i].toString();
        }
        return aux;
    }
}
