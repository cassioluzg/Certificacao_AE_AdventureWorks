with
    source_clientes as (
        select * from {{ ref('stg_erp__clientes')}}
    ),

    source_pessoas as (
        select * from {{ ref('stg_erp__pessoas')}}
    ),

    clientes as (
        select
            c.cliente_id
            , c.pessoa_id
            , c.loja_id
            , c.territorio_id
            , p.pessoa_titulo
            , p.pessoa_nome
            , p.pessoa_sobrenome
        from source_clientes as c
        left join source_pessoas as p 
            on c.pessoa_id = p.pessoa_id
    )

select * from clientes