-- Criar usuários
CREATE USER vendedor WITH PASSWORD 'vendedor123';
CREATE USER gerente WITH PASSWORD 'gerente123';

-- Permissões do vendedor
GRANT CONNECT ON DATABASE postgres TO vendedor;
GRANT USAGE ON SCHEMA public TO vendedor;

GRANT SELECT, INSERT, UPDATE
ON clientes, enderecos, pedidos, itens_pedido
TO vendedor;

-- Permissões do gerente
GRANT CONNECT ON DATABASE postgres TO gerente;
GRANT USAGE ON SCHEMA public TO gerente;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO gerente;

-- Permitir utilização das sequências
GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO vendedor;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO gerente;

-- Revogar exclusão do vendedor
REVOKE DELETE
ON clientes, enderecos, pedidos, itens_pedido
FROM vendedor;