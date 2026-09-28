# Desafio Sprint 3 — Do Conceito à Tabela

# Sistema de Reserva de Salas de Coworking

## Objetivo

Transformar o modelo conceitual da Sprint 2 em um modelo lógico estruturado e normalizado até a 3FN.

---

# Modelo Lógico

## CLIENTE

- id_cliente (PK)
- nome
- email
- telefone
- cpf
- data_cadastro

## UNIDADE

- id_unidade (PK)
- nome
- endereco
- cidade
- estado
- cep

## SALA

- id_sala (PK)
- id_unidade (FK)
- nome
- capacidade
- valor_hora
- disponivel

## RESERVA

- id_reserva (PK)
- id_cliente (FK)
- id_sala (FK)
- inicio
- fim
- status
- valor_total

## PAGAMENTO

- id_pagamento (PK)
- id_reserva (FK)
- valor
- data_pagamento
- metodo
- status

---

# Diagrama do Modelo Lógico

```mermaid
erDiagram

    CLIENTE {
        BIGSERIAL id_cliente PK
        VARCHAR nome
        VARCHAR email
        VARCHAR telefone
        VARCHAR cpf
        TIMESTAMP data_cadastro
    }

    UNIDADE {
        BIGSERIAL id_unidade PK
        VARCHAR nome
        VARCHAR endereco
        VARCHAR cidade
        CHAR estado
        VARCHAR cep
    }

    SALA {
        BIGSERIAL id_sala PK
        BIGINT id_unidade FK
        VARCHAR nome
        INTEGER capacidade
        NUMERIC valor_hora
        BOOLEAN disponivel
    }

    RESERVA {
        BIGSERIAL id_reserva PK
        BIGINT id_cliente FK
        BIGINT id_sala FK
        TIMESTAMP inicio
        TIMESTAMP fim
        VARCHAR status
        NUMERIC valor_total
    }

    PAGAMENTO {
        BIGSERIAL id_pagamento PK
        BIGINT id_reserva FK
        NUMERIC valor
        TIMESTAMP data_pagamento
        VARCHAR metodo
        VARCHAR status
    }

    CLIENTE ||--o{ RESERVA : realiza
    UNIDADE ||--o{ SALA : possui
    SALA ||--o{ RESERVA : recebe
    RESERVA ||--o| PAGAMENTO : possui