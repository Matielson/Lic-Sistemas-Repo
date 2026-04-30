package tema4;

public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }
    
    @Override
    public double calcularPerimetro() {
        return 2 * this.radio * Math.PI;
    }
    
    @Override
    public double calcularArea() {
        return Math.PI * (this.radio * this.radio);
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + '}';
    }
    
    
}
