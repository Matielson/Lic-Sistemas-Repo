package Ejercicio4Practica4;

public class Anual extends EstacionMeteorologica {
    
    public Anual(String nombre, double latitud, double longitud, int anoInicio, int cantAnos) {
        super(nombre,latitud,longitud,anoInicio,cantAnos);
    }
    
    public double calcularPromedioAnual(int ano) {
        double suma = 0;
        for (int i=0; i<12; i++) {
            suma = suma + getTemperatura(i+1, ano);
        }
        return (double) suma / 12;
    }
    
    @Override
    public String toString () {
        String aux = "";
        for (int i=0; i<this.getCantAnos(); i++) {
            aux += "- Año: " + (this.getAnoInicio() + i) + ": " + this.calcularPromedioAnual(this.getAnoInicio() + i) + "ºC; \n";
        }
        return super.toString() + aux;
    }
}
