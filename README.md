# Atividade de Consolidação — Consultas SQL com MySQL | NexaShop

## Sobre o projeto

Este repositório foi desenvolvido para a **Atividade Prática de Consolidação — Consultas SQL com MySQL**, do curso de **Análise e Desenvolvimento de Sistemas — UNISENAI**.

A atividade utiliza o cenário fictício de e-commerce **NexaShop**, com o objetivo de aplicar e consolidar conhecimentos de SQL utilizando consultas em tabelas individuais.

Durante o desenvolvimento foram utilizados recursos como:

* `SELECT`
* `DISTINCT`
* `LIMIT`
* `WHERE`
* `LIKE`
* `IN`
* `BETWEEN`
* `IS NULL`
* `ORDER BY`
* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* `HAVING`
* `CASE`
* `TIMESTAMPDIFF`

---

## Integrantes

* **Pedro Henrique de Souza**
* **Emilly da Silva da Luz**

---

## Estrutura do repositório

```text
/
├── README.md
├── consultas_nexashop.sql
├── prints/
│   ├── 1.1.png
│   ├── 1.2.png
│   ├── 1.3.png
│   ├── ...
│   └── 6.1.png
└── Docs/
    └── relatorio_nexashop.pdf
```

## Base de dados

A atividade utiliza a base de dados:

```sql
ecommerce_nexashop
```

A estrutura da base é composta pelas tabelas:

* `clientes`
* `produtos`
* `pedidos`
* `avaliacoes`

Antes de iniciar as consultas, é necessário importar o arquivo `ecommerce_nexashop.sql` no **MySQL Workbench** ou **phpMyAdmin**.

---

## Organização da atividade

As consultas foram desenvolvidas seguindo os blocos propostos na atividade:

### Bloco 1 — Reconhecimento do banco

Consultas iniciais para conhecer a estrutura e os dados das tabelas, utilizando recursos como `SELECT`, alias, `DISTINCT` e `LIMIT`.

### Bloco 2 — Filtros, busca textual e ordenação

Consultas utilizando filtros e condições com `WHERE`, `LIKE`, `IN`, `BETWEEN`, `IS NULL` e `ORDER BY`.

### Bloco 3 — Indicadores agregados

Desenvolvimento de indicadores utilizando funções como:

* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* `HAVING`

### Bloco 4 — Classificação com CASE

Utilização do comando `CASE` para classificação de dados e criação de indicadores percentuais.

### Bloco 5 — Desafio integrador

Consultas combinando diferentes recursos SQL para responder perguntas de negócio relacionadas à NexaShop.

### Bloco 6 — Ponte para a próxima aula

Análise de uma pergunta de negócio que não pode ser respondida utilizando apenas uma tabela, preparando o entendimento para o uso de `JOIN`.

---

## Objetivo

O objetivo deste projeto é consolidar os conhecimentos em consultas SQL e demonstrar a capacidade de transformar dados em informações úteis para o negócio.

Além da construção das consultas, cada atividade inclui uma interpretação dos resultados obtidos, relacionando os dados com possíveis decisões para a NexaShop.

---

## Tecnologias e ferramentas utilizadas

* **MySQL**
* **MySQL Workbench e/ou phpMyAdmin**
* **SQL**
* **Git**
* **GitHub**

---

## Entrega

O repositório contém:

* Consultas SQL comentadas e organizadas;
* Evidências das consultas executadas;
* Relatório final em PDF;
* Documentação do projeto neste `README.md`.

---

## Contexto acadêmico

**Curso:** Análise e Desenvolvimento de Sistemas
**Instituição:** UNISENAI
**Disciplina/Atividade:** Atividade de Consolidação — Consultas SQL com MySQL

---
