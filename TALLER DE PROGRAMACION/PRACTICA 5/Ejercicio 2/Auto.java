package ejercicio2practica5;

public class Auto {
    String dueno;
    String patente;

    public Auto(String dueno, String patente) {
        this.dueno = dueno;
        this.patente = patente;
    }
    
    public String getDueno() {
        return dueno;
    }

    public void setDueno(String dueno) {
        this.dueno = dueno;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
}
