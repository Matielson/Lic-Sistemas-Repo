package ejercicio2practica5;

public class Estacionamiento {
    /// ATRIBUTOS DE LA CLASE ESTACIONAMIENTO
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto mAutos[][];
    private int numPisos;
    private int numPlazas;
    
    public Estacionamiento (String miNombre, String miDireccion) {
        this.nombre = miNombre;
        this.direccion = miDireccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.numPisos = 5;
        this.numPlazas = 10;
        this.mAutos = new Auto[this.numPisos][this.numPlazas];
    }
    
    public Estacionamiento (String miNombre, String miDireccion, String miHoraApertura, String miHoraCierre, int miNumPisos, int miNumPlazas) {
        this.nombre = miNombre;
        this.direccion = miDireccion;
        this.horaApertura = miHoraApertura;
        this.horaCierre = miHoraCierre;
        this.numPisos = miNumPisos;
        this.numPlazas = miNumPlazas;
        this.mAutos = new Auto[numPisos][numPlazas];
    }
    
    /// GETTERS Y SETTERS
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getmAutos() {
        return mAutos;
    }

    public void setmAutos(Auto[][] mAutos) {
        this.mAutos = mAutos;
    }
    
    /// METODOS PROPIOS DE LA CLASE ESTACIONAMIENTO
    
    public void agregarAuto (Auto miAuto, int numPiso, int numPlaza) {
        this.mAutos[numPiso-1][numPlaza-1] = miAuto;
    }
    
    public String devolverPosAuto(String miPatente) { 
        int i = 0; int j = 0;
        String aux = "Auto inexistente"; 
        boolean seEncontro = false; 
        while (i < numPisos && !seEncontro) { 
            j = 0;
            while(j < numPlazas && !seEncontro) { 
                if ((this.mAutos[i][j] != null) && this.mAutos[i][j].getPatente().contentEquals(miPatente)) { 
                    aux = "El auto de patente " + this.mAutos[i][j].getPatente() + " esta estacionado en el piso " + (i+1) + " en la plaza " + (j+1) + "."; 
                    seEncontro = true; 
                }
                j++; 
            }
        i++;
        }  
        return aux; 
    }
    
    @Override
    public String toString () {
        String aux = "";
        for (int i=0; i < numPisos; i++) {
            for (int j=0; j < numPlazas; j++) {
                if (this.mAutos[i][j] == null) {
                    aux += "Piso: " + (i+1) + " Plaza: " + (j+1) + " libre \n"; 
                }
                else
                    aux += "Piso: " + (i+1) + " Plaza: " + (j+1) + " Dueño: " + this.mAutos[i][j].getDueno() + " Patente: " + this.mAutos[i][j].getPatente() + "\n"; 
            }
        }
        return aux;
    }
    
    public int contAutos (int miPlaza) {
        int cant = 0;
        miPlaza--;
        for (int i=0; i < numPisos; i++) {
            if (this.mAutos[i][miPlaza] != null) {
                cant++;
            }
        }
        return cant;
    }
}
