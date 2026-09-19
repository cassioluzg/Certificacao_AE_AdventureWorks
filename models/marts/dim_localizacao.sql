with
    source_enderecos as (
        select * from {{ ref('stg_erp__enderecos')}}
    ),

    source_estados as (
        select * from {{ ref('stg_erp__estados')}}
    ),

    source_paises as (
        select * from {{ ref('stg_erp__paises')}}
    ),

    localizacao as (
        select
            e.endereco_id
            , e.logradouro
            , e.numero
            , e.complemento
            , e.bairro
            , e.cidade
            , e.estado_id
            , es.nome_estado
            , es.sigla_estado
            , es.pais_id
            , p.nome_pais
        from source_enderecos as e
        left join source_estados as es 
            on e.estado_id = es.estado_id
        left join source_paises as p 
            on es.pais_id = p.pais_id
    )

select * from localizacao