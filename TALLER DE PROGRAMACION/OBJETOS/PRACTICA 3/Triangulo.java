package tema3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorR;
    private String colorL;

    public Triangulo(double lado1, double lado2, double lado3, String colorR, String colorL) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorR = colorR;
        this.colorL = colorL;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorR() {
        return colorR;
    }

    public void setColorR(String colorR) {
        this.colorR = colorR;
    }

    public String getColorL() {
        return colorL;
    }

    public void setColorL(String colorL) {
        this.colorL = colorL;
    }
    
    public double calcularPerimetro() {
        return this.lado1 + this.lado2 + this.lado3;
    }
    
    public double calcularArea() {
        double s = (this.lado1 + this.lado2 + this.lado3) / 2.0;
        
        return Math.sqrt(s * (s - this.lado1) * (s - this.lado2) * (s - this.lado3));
    }
    
    

    
    
    
}
