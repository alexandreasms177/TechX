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
    capacidade INTEGER NOT NULL,
    valor_hora NUMERIC(10,2) NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_sala_unidade
        FOREIGN KEY (id_unidade)
        REFERENCES unidade(id_unidade),

    CONSTRAINT chk_sala_capacidade
        CHECK (capacidade > 0),

    CONSTRAINT chk_sala_valor
        CHECK (valor_hora >= 0)
);


CREATE TABLE reserva (
    id_reserva BIGSERIAL PRIMARY KEY,
    id_cliente BIGINT NOT NULL,
    id_sala BIGINT NOT NULL,
    inicio TIMESTAMP NOT NULL,
    fim TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    valor_total NUMERIC(10,2) NOT NULL,
    observacao VARCHAR(300),

    CONSTRAINT fk_reserva_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_reserva_sala
        FOREIGN KEY (id_sala)
        REFERENCES sala(id_sala),

    CONSTRAINT chk_reserva_horario
        CHECK (fim > inicio),

    CONSTRAINT chk_reserva_valor
        CHECK (valor_total >= 0),

    CONSTRAINT chk_reserva_status
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
    valor NUMERIC(10,2) NOT NULL,
    data_pagamento TIMESTAMP,
    metodo VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',

    CONSTRAINT fk_pagamento_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva),

    CONSTRAINT chk_pagamento_valor
        CHECK (valor >= 0),

    CONSTRAINT chk_pagamento_metodo
        CHECK (
            metodo IN (
                'PIX',
                'CARTAO',
                'BOLETO'
            )
        ),

    CONSTRAINT chk_pagamento_status
        CHECK (
            status IN (
                'PENDENTE',
                'PAGO',
                'CANCELADO'
            )
        )
);