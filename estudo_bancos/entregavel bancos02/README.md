# Desafio Sprint 2 — Mapa do Domínio

## Sistema de Reserva de Salas de Coworking

### 1. Descrição do cenário

O sistema tem como objetivo controlar a reserva de salas de coworking por clientes.

Uma empresa pode possuir diferentes unidades de coworking, e cada unidade possui várias salas disponíveis para reserva. Os clientes podem realizar reservas informando a sala, data, horário de início e horário de término.

Cada reserva possui um status e pode estar associada a um pagamento.

O sistema permite organizar as informações das unidades, salas, clientes, reservas e pagamentos.

---

# 2. Entidades

O modelo é composto pelas seguintes entidades:

- Cliente
- Unidade
- Sala
- Reserva
- Pagamento

---

# 3. Atributos das entidades

## Cliente

| Atributo | Tipo | Descrição |
|---|---|---|
| id_cliente | BIGSERIAL | Identificador único do cliente (PK) |
| nome | VARCHAR(100) | Nome completo do cliente |
| email | VARCHAR(150) | E-mail do cliente |
| telefone | VARCHAR(20) | Telefone do cliente |
| cpf | VARCHAR(14) | CPF do cliente |
| data_cadastro | TIMESTAMP | Data em que o cliente foi cadastrado |

**Chave primária:** `id_cliente`

---

## Unidade

| Atributo | Tipo | Descrição |
|---|---|---|
| id_unidade | BIGSERIAL | Identificador único da unidade (PK) |
| nome | VARCHAR(100) | Nome da unidade |
| endereco | VARCHAR(200) | Endereço da unidade |
| cidade | VARCHAR(100) | Cidade onde está localizada |
| estado | CHAR(2) | Estado da unidade |
| cep | VARCHAR(9) | CEP da unidade |

**Chave primária:** `id_unidade`

---

## Sala

| Atributo | Tipo | Descrição |
|---|---|---|
| id_sala | BIGSERIAL | Identificador único da sala (PK) |
| id_unidade | BIGINT | Unidade à qual a sala pertence (FK) |
| nome | VARCHAR(100) | Nome ou identificação da sala |
| capacidade | INTEGER | Quantidade máxima de pessoas |
| valor_hora | NUMERIC(10,2) | Valor da utilização da sala por hora |
| disponivel | BOOLEAN | Indica se a sala está disponível para reservas |

**Chave primária:** `id_sala`

**Chave estrangeira:** `id_unidade` referencia `Unidade(id_unidade)`

---

## Reserva

| Atributo | Tipo | Descrição |
|---|---|---|
| id_reserva | BIGSERIAL | Identificador único da reserva (PK) |
| id_cliente | BIGINT | Cliente responsável pela reserva (FK) |
| id_sala | BIGINT | Sala que será utilizada (FK) |
| inicio | TIMESTAMP | Data e horário de início |
| fim | TIMESTAMP | Data e horário de término |
| status | VARCHAR(20) | Situação atual da reserva |
| valor_total | NUMERIC(10,2) | Valor total da reserva |
| observacao | VARCHAR(300) | Observações adicionais |

**Chave primária:** `id_reserva`

**Chaves estrangeiras:**

- `id_cliente` referencia `Cliente(id_cliente)`
- `id_sala` referencia `Sala(id_sala)`

---

## Pagamento

| Atributo | Tipo | Descrição |
|---|---|---|
| id_pagamento | BIGSERIAL | Identificador único do pagamento (PK) |
| id_reserva | BIGINT | Reserva relacionada ao pagamento (FK) |
| valor | NUMERIC(10,2) | Valor pago |
| data_pagamento | TIMESTAMP | Data e horário do pagamento |
| metodo | VARCHAR(30) | Método utilizado no pagamento |
| status | VARCHAR(20) | Situação do pagamento |

**Chave primária:** `id_pagamento`

**Chave estrangeira:** `id_reserva` referencia `Reserva(id_reserva)`

---

# 4. Relacionamentos

## Unidade → Sala

Uma unidade pode possuir várias salas.

Uma sala pertence a apenas uma unidade.

**Cardinalidade:** 1:N

```text
Unidade 1 -------- N Sala