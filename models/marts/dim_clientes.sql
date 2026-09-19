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
            , p.nome_pessoa
            , p.tipo_pessoa
            , p.data_nascimento
            , p.sexo
            , p.email
            , p.telefone
        from source_clientes as c
        left join source_pessoas as p 
            on c.pessoa_id = p.pessoa_id
    )

select * from clientes