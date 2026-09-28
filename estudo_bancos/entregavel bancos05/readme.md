# Sistema de E-commerce

## 1. Descrição do projeto

O projeto consiste no desenvolvimento de um banco de dados para um sistema de e-commerce utilizando PostgreSQL.

O banco permite armazenar informações sobre clientes, endereços, produtos, categorias, fornecedores, pedidos, itens dos pedidos, pagamentos, cupons, transportadoras e avaliações.

O objetivo é representar as principais operações de uma loja virtual, permitindo o cadastro de produtos e clientes, realização de pedidos, controle de estoque, pagamentos e avaliações.

## 2. Modelo lógico

O banco de dados possui as seguintes tabelas:

* clientes
* enderecos
* categorias
* fornecedores
* produtos
* pedidos
* itens_pedido
* pagamentos
* cupons
* transportadoras
* avaliacoes

As principais relações são:

* Um cliente pode possuir um endereço.
* Um cliente pode realizar vários pedidos.
* Um pedido pertence a um cliente.
* Um pedido possui vários itens.
* Um item de pedido pertence a um produto.
* Um produto pertence a uma categoria.
* Um produto possui um fornecedor.
* Um pedido possui um pagamento.
* Um cliente pode realizar avaliações de produtos.

As tabelas utilizam chaves primárias para identificação dos registros e chaves estrangeiras para garantir a integridade referencial.

## 3. Normalização

O banco foi estruturado buscando evitar redundância e inconsistência de dados.

As informações foram separadas em diferentes tabelas de acordo com suas responsabilidades. Por exemplo, os dados dos clientes ficam na tabela `clientes`, enquanto os produtos ficam em `produtos` e suas categorias ficam em `categorias`.

Dessa forma, uma categoria não precisa ser repetida em todos os produtos.

## 4. Restrições utilizadas

Foram utilizadas as seguintes restrições:

* PRIMARY KEY
* FOREIGN KEY
* NOT NULL
* UNIQUE
* CHECK
* DEFAULT

As restrições garantem a integridade e a validade dos dados armazenados.

Exemplos:

* CPF e e-mail dos clientes são únicos.
* O preço dos produtos deve ser maior que zero.
* O estoque não pode ser negativo.
* A nota das avaliações deve estar entre 1 e 5.
* O status dos pedidos possui valores previamente definidos.

## 5. Índices

Foram criados índices em colunas utilizadas frequentemente em consultas, filtros e relacionamentos.

Entre elas estão:

* `clientes.email`
* `produtos.id_categoria`
* `produtos.id_fornecedor`
* `produtos.preco`
* `pedidos.id_cliente`
* `pedidos.status`
* `pedidos.data_pedido`
* `itens_pedido.id_pedido`
* `itens_pedido.id_produto`
* `pagamentos.status`
* `avaliacoes.id_produto`

O objetivo é reduzir o custo de consultas que utilizam essas colunas.

## 6. Consultas SQL

Foram desenvolvidas 15 consultas utilizando diferentes recursos do PostgreSQL.

Foram utilizados:

* INNER JOIN
* LEFT JOIN
* GROUP BY
* HAVING
* ORDER BY
* WHERE
* funções de agregação
* subconsultas
* AVG
* SUM
* COUNT
* MAX

As consultas permitem obter informações como produtos por categoria, pedidos por cliente, valor total dos pedidos, média das avaliações, faturamento por produto e clientes com maior valor de compras.

## 7. Transações

Foram implementadas duas transações.

A primeira utiliza `BEGIN` para iniciar uma operação de compra e `COMMIT` para confirmar as alterações.

A segunda utiliza `BEGIN` e realiza alterações no banco, mas posteriormente utiliza `ROLLBACK`, fazendo com que as alterações sejam desfeitas.

As transações demonstram o controle de operações que precisam ser executadas de forma segura e consistente.

## 8. Controle de acesso

Foram criados dois usuários:

* vendedor
* gerente

O usuário vendedor possui permissões relacionadas às operações de clientes, endereços e pedidos.

O usuário gerente possui permissões mais amplas sobre as tabelas do sistema.

Também foi utilizado `REVOKE` para retirar a permissão de exclusão do usuário vendedor.

## 9. EXPLAIN ANALYZE

Foi utilizado `EXPLAIN ANALYZE` para analisar o desempenho de diferentes consultas.

Foram analisadas consultas envolvendo:

* busca de produtos por categoria;
* busca de pedidos por cliente;
* produtos filtrados e ordenados por preço;
* JOIN entre pedidos e clientes.

O `EXPLAIN ANALYZE` permite observar o plano de execução escolhido pelo PostgreSQL e o tempo utilizado para executar cada consulta.

A utilização de índices pode ajudar o PostgreSQL a encontrar os registros de forma mais eficiente, principalmente em tabelas com grande quantidade de dados.

## 10. Organização dos arquivos

O projeto está dividido da seguinte forma:

* `01_ddl.sql` — criação das tabelas e restrições.
* `02_inserts.sql` — inserção dos registros.
* `03_indices.sql` — criação dos índices.
* `04_consultas.sql` — consultas SQL.
* `05_transacoes.sql` — transações.
* `06_permissoes.sql` — usuários, GRANT e REVOKE.
* `07_explain.sql` — análise de desempenho com EXPLAIN ANALYZE.

## 11. Tecnologias

* PostgreSQL
* SQL
* DBeaver

## 12. Conclusão

O banco desenvolvido representa um sistema de e-commerce com estrutura normalizada, integridade referencial, controle de acesso, índices, consultas, transações e análise de desempenho.

A divisão do projeto em arquivos SQL facilita a organização, execução e manutenção do banco de dados.
