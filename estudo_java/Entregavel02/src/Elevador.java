public class Elevador {

    private int andarAtual;
    private double pesoMaximo;

    public Elevador(int andarAtual, double pesoMaximo) {
        this.andarAtual = andarAtual;
        this.pesoMaximo = pesoMaximo;
    }

    public void subir(double pesoAtual) {
        if (pesoAtual > pesoMaximo) {
            System.out.println("O elevador não vai sair do andar " + andarAtual + " por excesso de peso.");
        } else {
            andarAtual++;
            System.out.println("O elevador parou no andar " + andarAtual + ".");
        }
    }
}