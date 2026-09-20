with
    source_motivo_venda_pedido as (
        select * from {{ source('erp_adventureworks', 'sales_salesorderheadersalesreason') }}
    ),
    
    motivo_venda_pedido as (
        select
            salesorderid as pedido_id
            , salesreasonid as motivo_venda_id
        from source_motivo_venda_pedido
    )

select * from motivo_venda_pedido