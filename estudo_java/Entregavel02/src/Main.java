public class Main {
    public static void main(String[] args) {

        // Exercício 1 - Pessoa

        Pessoa pessoa1 = new Pessoa("João", 20, "Programador");
        Pessoa pessoa2 = new Pessoa("Maria", 25, "Designer");
        Pessoa pessoa3 = new Pessoa("Carlos", 18, "Professor");

        if (pessoa1.idade > pessoa2.idade && pessoa1.idade > pessoa3.idade) {
            System.out.println("A pessoa mais velha é " + pessoa1.nome);
        } else if (pessoa2.idade > pessoa1.idade && pessoa2.idade > pessoa3.idade) {
            System.out.println("A pessoa mais velha é " + pessoa2.nome);
        } else {
            System.out.println("A pessoa mais velha é " + pessoa3.nome);
        }

        // Exercício 2 - Carro

        Carro carro1 = new Carro("Civic", 2020, "Preto");
        Carro carro2 = new Carro("Corolla", 2022, "Branco");

        carro1.cor = "Vermelho";

        // A alteração no carro1 não afeta o carro2 porque cada objeto
        // possui seus próprios atributos e é uma instância independente.

        System.out.println("\nDados dos carros:");
        System.out.println("Carro 1: " + carro1.modelo + ", " + carro1.ano + ", " + carro1.cor);
        System.out.println("Carro 2: " + carro2.modelo + ", " + carro2.ano + ", " + carro2.cor);
    }
}