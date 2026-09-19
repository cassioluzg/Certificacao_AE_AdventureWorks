with
    pedidos_itens as (
        select * from {{ ref('int_vendas__pedidos_itens') }}
    ),

    produtos as (
        select * from {{ ref('dim_produto') }}
    ),

    fato_vendas as (
        select

            pi.pedido_id
            , pi.cliente_id
            , pi.vendedor_id
            , pi.territorio_id
            , pi.endereco_cobranca_id
            , pi.endereco_entrega_id
            , pi.metodo_envio_id
            , pi.cartao_credito_id
            , pi.status_pedido
            , pi.pedido_online
            , pi.valor_subtotal
            , pi.valor_imposto
            , pi.valor_frete
            , pi.valor_total_devido
            , pi.data_pedido
            , pi.data_entrega
            , pi.data_envio
            , pi.numero_revisao
            , pi.numero_pedido_compra
            , pi.pedido_detalhe_id
            , pi.produto_id
            , pi.oferta_especial_id
            , p1.quantidade
            , p1.preco_unitario
            , p1.desconto_percentual
            , p1.codigo_rastreio
            , p.nome_produto

        from pedidos_itens as pi
        left join produtos as p
        on pi.produto_id = p.produto_id
    )

select * from fato_vendas