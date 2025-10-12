package Ejercicio4Practica4;

public class EstacionMeteorologica {
    private String nombre;
    private double latitud, longitud;
    private int anoInicio, cantAnos;
    private double temperaturas[][];

    public EstacionMeteorologica(String nombre, double latitud, double longitud, int anoInicio, int cantAnos) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.anoInicio = anoInicio;
        this.cantAnos = cantAnos;
        this.temperaturas = new double[cantAnos][12];
        
        for (int i=0; i<getCantAnos(); i++){
            for (int j=0; j<12; j++) {
                this.temperaturas[i][j] = 99999.0;
            }
        }
    }
    
    public double getTemperatura(int mes, int ano) {
        double aux = this.temperaturas[ano - getAnoInicio()][mes-1];
        return aux;
    }
    
    public void setTemperatura(int mes, int ano, double temp) {
        this.temperaturas[ano - getAnoInicio()][mes-1] = temp;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public int getAnoInicio() {
        return anoInicio;
    }

    public void setAnoInicio(int anoInicio) {
        this.anoInicio = anoInicio;
    }

    public int getCantAnos() {
        return cantAnos;
    }

    public void setCantAnos(int cantAnos) {
        this.cantAnos = cantAnos;
    }
    
    public String mesYAnoMayorTemp() {
        double maxTemp = -99999;
        String mensaje = "No se registraron temperaturas validas.";
        for (int i=0; i<getCantAnos(); i++) {
            for (int j=0; j<12; j++) {
                if (temperaturas[i][j] > maxTemp) {
                    maxTemp = this.temperaturas[i][j];
                    mensaje = "La mayor temperatura registrada fue en el año: " + (i+getAnoInicio()) + " en el mes: " + (j+1) + " con una temperatura de: " + maxTemp;
                }
            }
        }
        return mensaje;
    }
    
    @Override
    public String toString() {
        return getNombre() + "(" + getLatitud() + "S - " + getLongitud() + " O): \n";
    }
}
