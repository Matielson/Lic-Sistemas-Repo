package Ejercicio4Practica4;

public class Mensual extends EstacionMeteorologica {
    
    public Mensual(String nombre, double latitud, double longitud, int anoInicio, int cantAnos) {
        super(nombre,latitud,longitud,anoInicio,cantAnos);
    }
    
    public double calcularPromedioMensual(int mes) {
        double suma = 0;
        for(int i=0;i < getCantAnos();i++) {
            suma += this.getTemperatura(mes, i+ getAnoInicio());
        }
        return suma;
    }

    @Override
    public String toString() {
        String [] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo","Junio","Julio", "Agosto","Septiembre","Octubre","Noviembre", "Diciembre"};
        String aux = super.toString();
        for(int i = 0; i < 12; i++) {
            aux += "- " + meses[i]+": " + calcularPromedioMensual(i + 1) + " °C; \n" ;
        }
        return aux;
    }
}
