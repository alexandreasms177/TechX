-- 1. Listar todos os produtos com suas categorias
SELECT
    p.nome AS produto,
    c.nome AS categoria,
    p.preco
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria;


-- 2. Listar produtos e seus fornecedores
SELECT
    p.nome AS produto,
    f.nome AS fornecedor
FROM produtos p
INNER JOIN fornecedores f
ON p.id_fornecedor = f.id_fornecedor;


-- 3. Listar pedidos com nome do cliente
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status
FROM pedidos pe
INNER JOIN clientes c
ON pe.id_cliente = c.id_cliente;


-- 4. Valor total de cada pedido
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS total
FROM pedidos pe
INNER JOIN clientes c
ON pe.id_cliente = c.id_cliente
INNER JOIN itens_pedido ip
ON pe.id_pedido = ip.id_pedido
GROUP BY pe.id_pedido, c.nome
ORDER BY total DESC;


-- 5. Quantidade de produtos por categoria
SELECT
    c.nome AS categoria,
    COUNT(p.id_produto) AS quantidade_produtos
FROM categorias c
LEFT JOIN produtos p
ON c.id_categoria = p.id_categoria
GROUP BY c.nome
ORDER BY quantidade_produtos DESC;


-- 6. Média das avaliações por produto
SELECT
    p.nome,
    AVG(a.nota) AS media_avaliacao
FROM produtos p
INNER JOIN avaliacoes a
ON p.id_produto = a.id_produto
GROUP BY p.nome
ORDER BY media_avaliacao DESC;


-- 7. Produtos acima do preço médio
SELECT
    nome,
    preco
FROM produtos
WHERE preco > (
    SELECT AVG(preco)
    FROM produtos
);


-- 8. Clientes que possuem pedidos
SELECT
    nome,
    email
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM pedidos
);


-- 9. Produtos com estoque abaixo da média
SELECT
    nome,
    estoque
FROM produtos
WHERE estoque < (
    SELECT AVG(estoque)
    FROM produtos
);


-- 10. Total vendido por produto
SELECT
    p.nome,
    SUM(ip.quantidade) AS quantidade_vendida,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produtos p
INNER JOIN itens_pedido ip
ON p.id_produto = ip.id_produto
GROUP BY p.nome
ORDER BY faturamento DESC;


-- 11. Pedidos pagos
SELECT
    pe.id_pedido,
    c.nome,
    pg.metodo,
    pg.valor
FROM pedidos pe
INNER JOIN clientes c
ON pe.id_cliente = c.id_cliente
INNER JOIN pagamentos pg
ON pe.id_pedido = pg.id_pedido
WHERE pg.status = 'APROVADO';


-- 12. Clientes que gastaram acima de R$ 1.000
SELECT
    c.nome,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido ip
ON p.id_pedido = ip.id_pedido
GROUP BY c.nome
HAVING SUM(ip.quantidade * ip.preco_unitario) > 1000;


-- 13. Produto mais caro
SELECT
    nome,
    preco
FROM produtos
WHERE preco = (
    SELECT MAX(preco)
    FROM produtos
);


-- 14. Quantidade de pedidos por status
SELECT
    status,
    COUNT(*) AS quantidade
FROM pedidos
GROUP BY status
ORDER BY quantidade DESC;


-- 15. Clientes e seus endereços
SELECT
    c.nome,
    e.rua,
    e.numero,
    e.cidade,
    e.estado,
    e.cep
FROM clientes c
INNER JOIN enderecos e
ON c.id_cliente = e.id_cliente;