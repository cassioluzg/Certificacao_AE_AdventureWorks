WITH
    pedidos as (
        select * from {{ ref('stg_erp__pedidos')}}
    ),

    pedidos_detalhados as (
        select * from {{ ref('stg_erp__pedidos_detalhados')}}
    ),

    pedidos_itens as (
        select
            p.pedido_id
            , p.cliente_id
            , p.vendedor_id
            , p.territorio_id
            , p.endereco_cobranca_id
            , p.endereco_entrega_id
            , p.metodo_envio_id
            , p.cartao_credito_id
            , p.status_pedido
            , p.pedido_online
            , p.valor_subtotal
            , p.valor_imposto
            , p.valor_frete
            , p.valor_total_devido
            , p.data_pedido
            , p.data_entrega
            , p.data_envio
            , p.numero_revisao
            , p.numero_pedido_compra
            , pd.pedido_detalhe_id
            , pd.produto_id
            , pd.oferta_especial_id
            , pd.quantidade
            , pd.preco_unitario
            , pd.desconto_percentual
            , pd.codigo_rastreio

        from pedidos_detalhados as pd
        left join pedidos as p
            on pd.pedido_id = p.pedido_id
    )
select * from pedidos_itens