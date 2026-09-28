class Pagamento {
    protected double valor;
    protected String status;

    public Pagamento(double valor) {
        this.valor = valor;
        this.status = "Pendente";
    }

    public boolean validarValor() {
        if (valor <= 0) {
            status = "Recusado";
            System.out.println("Pagamento recusado: valor inválido.");
            return false;
        }
        return true;
    }

    public void pagar() {
    }

    public void exibirDetalhes() {
        System.out.println("Valor: R$ " + valor);
        System.out.println("Status: " + status);
    }
}

class Pix extends Pagamento {

    public Pix(double valor) {
        super(valor);
    }

    public void pagar() {
        if (validarValor()) {
            status = "Aprovado";
            System.out.println("Pix realizado.");
        }
    }

    public void exibirDetalhes() {
        System.out.println("Pix - R$ " + valor + " - " + status);
    }
}

class Debito extends Pagamento {
    private double saldo;

    public Debito(double valor, double saldo) {
        super(valor);
        this.saldo = saldo;
    }