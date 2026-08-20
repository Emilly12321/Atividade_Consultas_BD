-- QUERIES SQL CONSOLIDADAS - PROJETO NEXASHOP
use ecommerce_nexashop;

-- Tarefa 1.1 → Primeiro contato com os dados (SELECT * com LIMIT 10 nas 4 tabelas)
-- Pedro Henrique
-- select na tabela clientes
SELECT * FROM ecommerce_nexashop.clientes
limit 10;
 
-- select na tabela produtos
SELECT * FROM ecommerce_nexashop.produtos
limit 10;
 
-- select na tabela pedidos
SELECT * FROM ecommerce_nexashop.pedidos
limit 10;
 
-- select na tabela avaliações
SELECT * FROM ecommerce_nexashop.avaliacoes
limit 10;

-- Tarefa 1.2 → Catálogo de produtos para o marketing
-- Pedro Henrique
SELECT nome, categoria, marca, preco as "Valor (R$)", estoque
from produtos;


-- Tarefa 1.3 → Quantas categorias a loja realmente vende
-- Emilly da Luz
Select Distinct categoria from produtos order by categoria asc;


-- Tarefa 1.4.1 → Liste, sem repetição, todas as formas de pagamento e,
-- em outra consulta, todos os canais de venda registrados nos pedidos
-- Emilly da Luz
Select Distinct forma_pagamento as canais from pedidos;
Select Distinct canal_venda as canais from pedidos;


-- Tarefa 2.1 → Clientes ativos da região Sul
-- Pedro Henrique
use ecommerce_nexashop;
select nome, cidade, estado, status
from clientes
where status = 'Ativo'
and estado in ('SC','PR','RS')
order by estado, nome;


-- Tarefa 2.2 → Busca de cliente por nome (tela de atendimento)
-- Pedro Henrique
use ecommerce_nexashop;
select nome
from clientes
where nome like '%Monteiro%';


-- Tarefa 2.3 → Clientes sem telefone cadastrado
-- Pedro Henrique
use ecommerce_nexashop;
select *
from clientes
where telefone is null;


-- Tarefa 2.4 → Liste os pedidos aprovados com valor_total entre R$100
-- e R$500, ordenados do maior para o menor valor
-- Emilly da Luz
Select Distinct * from pedidos
where status = 'Aprovado'
And valor_total between 100 and 500 order by valor_total desc;


-- Tarefa 2.5 → Liste nome, categoria e estoque dos produtos ativos com
-- estoque menor que 10, ordenados do menor estoque para o maior
-- Emilly da Luz
Select nome,categoria,estoque from produtos where ativo = 1 and estoque
< 10 order by estoque asc;


-- Tarefa 2.6 → Liste id, valor_total e cupom_desconto dos pedidos que
-- tiveram cupom aplicado (não nulo)
-- Emilly da Luz
Select id, valor_total,cupom_desconto from pedidos where cupom_desconto
is not null;


-- Tarefa 3.1 → Radar de ticket médio (pedidos aprovados)
-- Pedro Henrique
use ecommerce_nexashop;
select count(*) as pedidos_aprovados,
round (avg(valor_total),2) as ticket_medio,
min(valor_total) as menor_valor,
max(valor_total) as maior_valor
from pedidos
where status = 'Aprovado';


-- Tarefa 3.2 → Faturamento por forma de pagamento
-- Pedro Henrique
use ecommerce_nexashop;
select forma_pagamento, sum(valor_total) as Faturamento_total
from pedidos
where status = 'Aprovado'
group by forma_pagamento
order by Faturamento_total desc;


-- Tarefa 3.3 → Onde estão os clientes da NexaShop (quantidade por estado)
-- Pedro Henrique
use ecommerce_nexashop;
select count(id) as total_clientes, estado
from clientes
group by estado
order by total_clientes desc;


-- Tarefa 3.4 → Estados com mais de 200 clientes cadastrados
-- Emilly da Luz
Select estado, count(*) from clientes
group by estado having count(estado) > 200;


-- Tarefa 3.5 → Média de idade dos clientes por segmento
-- Emilly da Luz
Select segmento,
ROUND(AVG(timestampdiff(YEAR, data_nascimento, CURDATE()))) as 'Média Idade'
From clientes
Group by segmento;


-- Tarefa 3.6 → Valor de estoque por categoria (produtos ativos)
-- Emilly da Luz
Select categoria,
SUM(preco*estoque) as valor_estoque
From produtos
Where ativo = 1
Group by categoria order by valor_estoque desc;


-- Tarefa 4.1 → Classificando avaliações (Excelente/Boa/Regular/Insatisfatória)
-- Pedro Henrique
use ecommerce_nexashop;
select nota,
case
when nota >=5 then 'Excelente'
when nota >=4 then 'Boa'
when nota >=3 then 'Regular'
else 'Insatisfatória'
end as Avaliação
from avaliacoes;


-- Tarefa 4.2 → Quantas avaliações caem em cada faixa
-- Pedro Henrique
use ecommerce_nexashop;
select count(id) as total_avaliacoes,
case
when nota >=5 then 'Excelente'
when nota >=4 then 'Boa'
when nota >=3 then 'Regular'
else 'Insatisfatória'
end as Avaliação
from avaliacoes
group by Avaliação
order by total_avaliacoes desc;


-- Tarefa 4.3 → Percentual de aprovação dos pedidos
-- Emilly da Luz
Select Round(AVG(CASE
WHEN status = 'Aprovado'
THEN 1
ELSE 0
END) *100 ) as 'Percentual de Aprovação'
From pedidos;


-- Tarefa 4.4 → Classificação de clientes por tempo de cadastro (Novo/Fiel/Veterano)
-- Emilly da Luz
Select
CASE
WHEN TIMESTAMPDIFF(YEAR, data_cadastro, CURDATE()) < 1
THEN 'Novo'
WHEN TIMESTAMPDIFF(YEAR, data_cadastro, CURDATE()) BETWEEN 1 and 3
THEN 'Fiel'
ELSE 'Veterano'
END as perfis,
Count(*) as 'Quantidade de Clientes'
From clientes
GROUP BY perfis;


-- Tarefa 5.1 → Ranking de Canal de Venda e Forma de Pagamento
-- (combinações com pelo menos 200 pedidos, top 5)

-- Emilly da Luz
SELECT canal_venda,
forma_pagamento,
SUM(valor_total) as faturamento
FROM pedidos
WHERE status = 'Aprovado'
Group by canal_venda, forma_pagamento
HAVING count(canal_venda) > 200
ORDER BY faturamento ASC LIMIT 5;

-- Pedro Henrique
use ecommerce_nexashop;
select canal_venda, forma_pagamento, sum(valor_total) as Faturamento_total
from pedidos
where status = "Aprovado"
group by forma_pagamento, canal_venda
having count(canal_venda) > 200
order by Faturamento_total desc
limit 5;


-- Tarefa 5.2 → Categorias "premium" do catálogo (preço médio > R$300)

-- Emilly da Luz
USE ecommerce_nexashop;
SELECT categoria,
ROUND(AVG(preco),2) as media
FROM produtos
WHERE ativo = 1
GROUP BY categoria
HAVING media >= 300
ORDER BY media desc;

-- Pedro Henrique
use ecommerce_nexashop;
select categoria, round (avg(preco), 2) as media_preco
from produtos
where ativo = '1'
group by categoria
having media_preco > 300
order by media_preco desc
limit 5;

 
-- Tarefa 5.3 → Investigação: o boleto cancela mais que os outros meios de pagamento?

-- Emilly da Luz
use ecommerce_nexashop;
SELECT forma_pagamento,
ROUND(AVG(CASE WHEN status = 'CANCELADO'
THEN 1
ELSE 0
END)*100) as percentual_cancelamento
FROM pedidos
GROUP BY forma_pagamento
ORDER BY percentual_cancelamento DESC;

-- Pedro Henrique
use ecommerce_nexashop;
select forma_pagamento,
avg(
case
when pedidos.status = 'Cancelado'
then 1
else 0
end
) * 100 as taxa_cancelamento
from pedidos
group by forma_pagamento
order by taxa_cancelamento desc;


-- Tarefa 6.1 → Uma pergunta que ainda não conseguimos responder

-- Pedro Henrique
-- 6.1.1: Faturamento por cidade
use ecommerce_nexashop;
SELECT clientes.cidade, SUM(pedidos.valor_total) AS faturamento
FROM clientes
JOIN pedidos ON clientes.id = pedidos.cliente_id /*pega somente os IDs que forem iguais entre as duas tabelas*/
GROUP BY clientes.cidade
ORDER BY faturamento DESC;

-- 6.1.2: Produtos mais vendidos
use ecommerce_nexashop;
SELECT
produtos.nome,
SUM(pedidos.quantidade) AS quantidade_vendida
FROM produtos
JOIN pedidos ON produtos.id = pedidos.produto_id
WHERE pedidos.status = 'Aprovado'
GROUP BY produtos.id, produtos.nome
ORDER BY quantidade_vendida DESC;

-- 6.1.3: Faturamento por produto
use ecommerce_nexashop;
SELECT
produtos.nome,
SUM(pedidos.valor_total) AS faturamento
FROM produtos
JOIN pedidos
ON produtos.id = pedidos.produto_id
GROUP BY produtos.id, produtos.nome
ORDER BY faturamento DESC;