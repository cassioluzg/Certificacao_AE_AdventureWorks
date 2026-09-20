with
    enderecos as (
        select * from {{ ref('stg_erp__endereco')}}
    ),

    estados as (
        select * from {{ ref('stg_erp__estado')}}
    ),

    paises as (
        select * from {{ ref('stg_erp__pais')}}
    ),

    localizacao as (
        select
            ed.endereco_id
            , ed.endereco_linha1 || " " || ed.endereco_linha2 as logradouro
            , ed.cidade
            , es.estado_nome
            , es.uf_estado
            , p.pais_nome
        from enderecos as ed
        left join estados as es
            on ed.estado_id = es.estado_id
        left join paises as p
            on es.pais_codigo = p.pais_codigo
    )

select * from localizacao