with
    source_motivos_venda as (
        select * from {{ ref('stg_erp__motivos_venda')}}
    ),

    motivos_venda as (
        select
            motivo_venda_id
            , descricao as motivo_venda_descricao
        from source_motivos_venda
    )

select * from motivos_venda