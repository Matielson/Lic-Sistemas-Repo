package tema4;

public class Triangulo extends Figura{
    private double ladoA;
    private double ladoB;
    private double ladoC;

    public Triangulo(double ladoA, double ladoB, double ladoC, String colorR, String colorL){
        super(colorR, colorL);
        this.ladoA = ladoA;
        this.ladoB = ladoB;
        this.ladoC = ladoC;
    }
    
    @Override
    public double calcularPerimetro() {
        return ladoA + ladoB + ladoC;
    }
    
    @Override
    public double calcularArea() {
        double s = calcularPerimetro() / 2.0;
        return Math.sqrt(s * (s - this.ladoA) * (s - this.ladoB) * (s - this.ladoC));
    }

    @Override
    public String toString() {
        return "Triangulo{" + "ladoA=" + ladoA + ", ladoB=" + ladoB + ", ladoC=" + ladoC + '}';
    }
}
