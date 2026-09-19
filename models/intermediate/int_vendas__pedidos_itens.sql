WITH
    pedidos as (
        select * from {{ ref('stg_erp__pedidos')}}
    ),

    pedidos_detalhados as (
        select * from {{ ref('stg_erp__pedidos_detalhados')}}
    ),

    pedidos_itens as (
        select
            pd.pedido_detalhe_id
            , pd.pedido_id
            , pd.produto_id
            , pd.quantidade
            , pd.preco_unitario
            , pd.desconto_percentual
            , pd.codigo_rastreio
            , p.cliente_id
            , p.vendedor_id
            , p.territorio_id
            , p.status_pedido
            , p.data_pedido
        from pedidos_detalhados as pd
        left join pedidos as p
            on pd.pedido_id = p.pedido_id
    )
select * from pedidos_itens