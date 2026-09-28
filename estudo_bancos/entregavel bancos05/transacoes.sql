-- TRANSAÇÃO 1
-- Compra de um produto

BEGIN;

UPDATE produtos
SET estoque = estoque - 1
WHERE id_produto = 1
AND estoque > 0;

INSERT INTO pedidos (id_cliente, id_endereco, status)
VALUES (1, 1, 'PAGO');

COMMIT;


-- TRANSAÇÃO 2
-- Exemplo de operação cancelada

BEGIN;

UPDATE produtos
SET estoque = estoque - 5
WHERE id_produto = 2
AND estoque >= 5;

INSERT INTO pedidos (id_cliente, id_endereco, status)
VALUES (2, 2, 'PENDENTE');

ROLLBACK;