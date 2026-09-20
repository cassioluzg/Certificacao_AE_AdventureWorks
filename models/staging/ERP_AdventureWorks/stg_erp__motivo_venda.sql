with
    source_motivo_venda as (
        select * from {{ source('erp_adventureworks', 'sales_salesreason') }}
    ),

    motivo_venda as (
        select
            cast(salesreasonid as int) as motivo_venda_id
            , cast(name as string) as motivo_venda_descricao
            , cast(reasontype as string) as motivo_venda_tipo
        from source_motivo_venda
    )

select * from motivo_venda