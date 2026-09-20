with
    motivos_venda as (
        select * from {{ ref('stg_erp__motivo_venda')}}
    ),

    motivo_venda_pedidos as(
        select * from {{ ref('stg_erp__motivo_venda_pedido')}}
    ),

    pedidos_motivos as (
        select
            mvp.pedido_id
            , mvp.motivo_venda_id
            , mv.motivo_venda_descricao as motivo_venda_descricao
            , mv.motivo_venda_tipo as motivo_venda_tipo
        from motivo_venda_pedidos as mvp
        left join motivos_venda as mv
            on mvp.motivo_venda_id = mv.motivo_venda_id
    )
select * from pedidos_motivos