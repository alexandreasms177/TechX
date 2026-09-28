
-- 1. Análise de busca de produtos por categoria
EXPLAIN ANALYZE
SELECT
    p.nome,
    p.preco
FROM produtos p
WHERE p.id_categoria = 1;


-- 2. Análise de pedidos por cliente
EXPLAIN ANALYZE
SELECT
    p.id_pedido,
    p.data_pedido,
    p.status
FROM pedidos p
WHERE p.id_cliente = 1;


-- 3. Análise de produtos ordenados por preço
EXPLAIN ANALYZE
SELECT
    nome,
    preco
FROM produtos
WHERE preco > 500
ORDER BY preco DESC;


-- 4. Análise de JOIN entre pedidos e clientes
EXPLAIN ANALYZE
SELECT
    p.id_pedido,
    c.nome,
    p.status
FROM pedidos p
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente
WHERE p.status = 'PAGO';