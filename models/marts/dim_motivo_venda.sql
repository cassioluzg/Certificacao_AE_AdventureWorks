with
    source_motivo_venda as (
        select * from {{ ref('stg_erp__motivo_venda')}}
    ),

    motivo_venda as (
        select
            motivo_venda_id
            , motivo_venda_descricao
            , motivo_venda_tipo
        from source_motivo_venda
    )

select * from motivo_venda