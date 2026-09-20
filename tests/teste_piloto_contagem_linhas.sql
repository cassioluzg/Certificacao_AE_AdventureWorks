/*
    Query para avaliar a contagem de linhas entre a tabela fato e a tabela de origem.
    A contagem deve ser igual, caso contrário, o teste falha.
    Teste aplicado ao projeto piloto, criado para validar a conexão e pipeline de dados
    entre o banco de origem e o modelo de dados.
*/

with
    contagem_fato as (
        select count(*) as total_fato
        from {{ ref('fct_vendas') }}
    ),

    contagem_origem as (
        select count(*) as total_origem
        from {{ source('erp_adventureworks', 'sales_salesorderdetail') }}
    )

select
    contagem_fato.total_fato
    , contagem_origem.total_origem
from contagem_fato
cross join contagem_origem
where contagem_fato.total_fato != contagem_origem.total_origem