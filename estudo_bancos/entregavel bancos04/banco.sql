CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_cadastro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    CHECK (length(cpf) = 11)
);

CREATE TABLE unidade (
    id_unidade SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    endereco TEXT NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE sala (
    id_sala SERIAL PRIMARY KEY,
    id_unidade INTEGER NOT NULL REFERENCES unidade(id_unidade),
    nome TEXT NOT NULL,
    capacidade INTEGER NOT NULL CHECK (capacidade > 0),
    valor_hora NUMERIC(10,2) NOT NULL CHECK (valor_hora >= 0),
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES cliente(id_cliente),
    id_sala INTEGER NOT NULL REFERENCES sala(id_sala),
    inicio TIMESTAMPTZ NOT NULL,
    fim TIMESTAMPTZ NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE',
    valor_total NUMERIC(10,2) NOT NULL CHECK (valor_total >= 0),
    CHECK (fim > inicio),
    CHECK (status IN ('PENDENTE','CONFIRMADA','CANCELADA','CONCLUIDA'))
);

CREATE TABLE pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_reserva INTEGER NOT NULL UNIQUE REFERENCES reserva(id_reserva),
    valor NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    data_pagamento TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    metodo VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE',
    CHECK (metodo IN ('PIX','CARTAO','BOLETO')),
    CHECK (status IN ('PENDENTE','APROVADO','CANCELADO'))
);


-- ÍNDICES

CREATE INDEX idx_sala_unidade ON sala(id_unidade);
CREATE INDEX idx_reserva_cliente ON reserva(id_cliente);
CREATE INDEX idx_reserva_sala ON reserva(id_sala);
CREATE INDEX idx_reserva_inicio ON reserva(inicio);
CREATE INDEX idx_reserva_sala_inicio ON reserva(id_sala, inicio);


-- DADOS

INSERT INTO cliente (nome, email, cpf)
VALUES
('João Silva','joao@email.com','12345678901'),
('Maria Silva','maria@email.com','12345678902');

INSERT INTO unidade (nome, endereco, cidade, estado, cep)
VALUES
('Unidade Centro','Rua A','São Luís','MA','65000000');

INSERT INTO sala (id_unidade, nome, capacidade, valor_hora)
VALUES
(1,'Sala 01',10,100.00);

INSERT INTO reserva
(id_cliente,id_sala,inicio,fim,status,valor_total)
VALUES
(1,1,CURRENT_TIMESTAMP + INTERVAL '1 day',
CURRENT_TIMESTAMP + INTERVAL '1 day 2 hours',
'CONFIRMADA',200.00);

INSERT INTO pagamento
(id_reserva,valor,metodo,status)
VALUES
(1,200.00,'PIX','APROVADO');


-- TRANSAÇÃO 1

BEGIN;

INSERT INTO cliente (nome,email,cpf)
VALUES ('Cliente 1','cliente1@email.com','12345678903')
RETURNING id_cliente;

INSERT INTO unidade (nome,endereco,cidade,estado,cep)
VALUES ('Unidade 1','Rua B','São Luís','MA','65000001')
RETURNING id_unidade;

COMMIT;


-- TRANSAÇÃO 2

BEGIN;

INSERT INTO cliente (nome,email,cpf)
VALUES ('Cliente 2','cliente2@email.com','12345678904')
RETURNING id_cliente;

SAVEPOINT ponto;

INSERT INTO unidade (nome,endereco,cidade,estado,cep)
VALUES ('Unidade 2','Rua C','São Luís','MA','65000002');

ROLLBACK TO SAVEPOINT ponto;

COMMIT;


-- ROLLBACK

BEGIN;

INSERT INTO cliente (nome,email,cpf)
VALUES ('Teste','teste@email.com','12345678905');

ROLLBACK;


-- EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT *
FROM reserva
WHERE id_cliente = 1;

EXPLAIN ANALYZE
SELECT *
FROM reserva
WHERE id_sala = 1
ORDER BY inicio;


-- SEGURANÇA

CREATE ROLE role_leitura;

GRANT USAGE ON SCHEMA public TO role_leitura;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO role_leitura;

CREATE USER usuario_leitura
WITH PASSWORD 'senha123';

GRANT role_leitura TO usuario_leitura;

CREATE USER usuario_operador
WITH PASSWORD 'senha456';

GRANT USAGE ON SCHEMA public TO usuario_operador;
GRANT SELECT, INSERT, UPDATE
ON ALL TABLES IN SCHEMA public TO usuario_operador;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public TO usuario_operador;

REVOKE DELETE
ON ALL TABLES IN SCHEMA public
FROM usuario_operador;