CREATE TABLE cliente (
    id_cliente BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE unidade (
    id_unidade BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL
);

CREATE TABLE sala (
    id_sala BIGSERIAL PRIMARY KEY,
    id_unidade BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL CHECK (capacidade > 0),
    valor_hora NUMERIC(10,2) NOT NULL CHECK (valor_hora >= 0),
    disponivel BOOLEAN NOT NULL DEFAULT TRUE,

    FOREIGN KEY (id_unidade)
        REFERENCES unidade(id_unidade)
);

CREATE TABLE reserva (
    id_reserva BIGSERIAL PRIMARY KEY,
    id_cliente BIGINT NOT NULL,
    id_sala BIGINT NOT NULL,
    inicio TIMESTAMP NOT NULL,
    fim TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    valor_total NUMERIC(10,2) NOT NULL CHECK (valor_total >= 0),

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    FOREIGN KEY (id_sala)
        REFERENCES sala(id_sala),

    CHECK (fim > inicio),

    CHECK (
        status IN (
            'PENDENTE',
            'CONFIRMADA',
            'CANCELADA',
            'CONCLUIDA'
        )
    )
);

CREATE TABLE pagamento (
    id_pagamento BIGSERIAL PRIMARY KEY,
    id_reserva BIGINT NOT NULL UNIQUE,
    valor NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    data_pagamento TIMESTAMP,
    metodo VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',

    FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva),

    CHECK (metodo IN ('PIX', 'CARTAO', 'BOLETO')),
    CHECK (status IN ('PENDENTE', 'PAGO', 'CANCELADO'))
);


INSERT INTO cliente (nome, email, telefone, cpf)
VALUES
('João Silva', 'joao@email.com', '98999990001', '123.456.789-01'),
('Maria Oliveira', 'maria@email.com', '98999990002', '234.567.890-02'),
('Carlos Santos', 'carlos@email.com', '98999990003', '345.678.901-03');


INSERT INTO unidade (nome, endereco, cidade, estado, cep)
VALUES
('Coworking Centro', 'Rua Grande, 100', 'São Luís', 'MA', '65000-000'),
('Coworking Renascença', 'Av. dos Holandeses, 200', 'São Luís', 'MA', '65075-000'),
('Coworking Cohama', 'Rua Principal, 300', 'São Luís', 'MA', '65070-000');


INSERT INTO sala (id_unidade, nome, capacidade, valor_hora)
VALUES
(1, 'Sala Executiva', 10, 50.00),
(2, 'Sala Reunião', 20, 80.00),
(3, 'Sala Treinamento', 30, 120.00);


INSERT INTO reserva (
    id_cliente,
    id_sala,
    inicio,
    fim,
    status,
    valor_total
)
VALUES
(1, 1, '2026-09-01 08:00:00', '2026-09-01 10:00:00', 'CONFIRMADA', 100.00),
(2, 2, '2026-09-02 14:00:00', '2026-09-02 17:00:00', 'CONFIRMADA', 240.00),
(3, 3, '2026-09-03 09:00:00', '2026-09-03 12:00:00', 'PENDENTE', 360.00);


INSERT INTO pagamento (
    id_reserva,
    valor,
    data_pagamento,
    metodo,
    status
)
VALUES
(1, 100.00, '2026-08-30 10:00:00', 'PIX', 'PAGO'),
(2, 240.00, '2026-08-31 15:00:00', 'CARTAO', 'PAGO'),
(3, 360.00, NULL, 'BOLETO', 'PENDENTE');


SELECT
    reserva.id_reserva,
    cliente.nome AS cliente,
    sala.nome AS sala,
    reserva.inicio,
    reserva.fim,
    reserva.status
FROM reserva
INNER JOIN cliente
    ON reserva.id_cliente = cliente.id_cliente
INNER JOIN sala
    ON reserva.id_sala = sala.id_sala;


SELECT
    cliente.nome AS cliente,
    sala.nome AS sala,
    unidade.nome AS unidade,
    reserva.valor_total,
    pagamento.metodo,
    pagamento.status
FROM reserva
INNER JOIN cliente
    ON reserva.id_cliente = cliente.id_cliente
INNER JOIN sala
    ON reserva.id_sala = sala.id_sala
INNER JOIN unidade
    ON sala.id_unidade = unidade.id_unidade
LEFT JOIN pagamento
    ON reserva.id_reserva = pagamento.id_reserva;