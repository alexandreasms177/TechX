# estudo_bandos

## Sistema de Cursos

## Requisitos

* Cadastrar alunos com seus dados básicos;
* Cadastrar os cursos oferecidos pela instituição;
* Realizar a matrícula de um aluno em um curso;
* Consultar os alunos cadastrados;
* Consultar os cursos disponíveis;
* Ver quais alunos estão matriculados em determinado curso;
* Ver em quais cursos um determinado aluno está matriculado;
* Registrar a data e a situação de cada matrícula.

## Entidades

### 1. Aluno

| Atributo          | Descrição              | Chave  |
| ----------------- | ---------------------- | ------ |
| `id_aluno`        | Identificação do aluno | **PK** |
| `nome`            | Nome completo          |        |
| `email`           | E-mail                 |        |
| `data_nascimento` | Data de nascimento     |        |

### 2. Curso

| Atributo        | Descrição              | Chave  |
| --------------- | ---------------------- | ------ |
| `id_curso`      | Identificação do curso | **PK** |
| `nome`          | Nome do curso          |        |
| `descricao`     | Descrição do curso     |        |
| `carga_horaria` | Carga horária          |        |

### 3. Matrícula

| Atributo         | Descrição                  | Chave  |
| ---------------- | -------------------------- | ------ |
| `id_matricula`   | Identificação da matrícula | **PK** |
| `id_aluno`       | Aluno matriculado          | **FK** |
| `id_curso`       | Curso escolhido            | **FK** |
| `data_matricula` | Data da matrícula          |        |
| `status`         | Situação da matrícula      |        |

## Relacionamentos

### Aluno e Matrícula

Um aluno pode realizar várias matrículas, mas cada matrícula pertence a apenas um aluno.

**Cardinalidade: 1:N**

```text
Aluno 1 ───────── N Matrícula
```

### Curso e Matrícula

Um curso pode ter vários alunos matriculados, mas cada matrícula está relacionada a apenas um curso.

**Cardinalidade: 1:N**

```text
Curso 1 ───────── N Matrícula
```

### Aluno e Curso



Um aluno pode fazer vários cursos e um curso pode ter vários alunos.

**Cardinalidade: N:N**

```text
Aluno N ──── Matrícula ───── N Curso
```

## Estrutura

```text
┌──────────────┐
│    ALUNO     │
├──────────────┤
│ PK id_aluno  │
│ nome         │
│ email        │
│ nascimento   │
└──────┬───────┘
       │ 1
       │
       │ N
┌──────▼─────────────┐
│     MATRÍCULA      │
├────────────────────┤
│ PK id_matricula    │
│ FK id_aluno        │
│ FK id_curso        │
│ data_matricula     │
│ status             │
└──────┬─────────────┘
       │ N
       │
       │ 1
┌──────▼────────────┐
│      CURSO        │
├───────────────────┤
│ PK id_curso       │
│ nome              │
│ descricao         │
│ carga_horaria     │
└───────────────────┘
```
