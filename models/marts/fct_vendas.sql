with

    source_int_pedidos_itens as (
        select * from {{ ref('int_vendas__pedidos_itens') }}
    ),

    source_int_pedidos_motivos as (
        select
            pedido_id
            , array_join(collect_set(motivo_venda_descricao), ', ') as motivos_venda
        from {{ ref('int_vendas__pedidos_motivos') }}
        group by pedido_id
    ),

    fato_vendas as (
        select
            pi.pk_vendas
            , pi.pedido_id
            , pi.pedido_detalhe_id
            , pi.produto_id
            , pi.cliente_id
            , pi.cartao_credito_id
            , pi.endereco_entrega_id
            , pi.status_pedido
            , pi.data_pedido
            , pi.quantidade
            , pi.preco_unitario
            , pi.desconto_percentual
            , cast(pi.preco_unitario * pi.quantidade as decimal(12,2)) as valor_total_bruto
            , cast(
                pi.preco_unitario * pi.quantidade * (1 - pi.desconto_percentual)
                as decimal(12,2)
            ) as valor_total_liquido
            , pm.motivos_venda
        from source_int_pedidos_itens as pi
        left join source_int_pedidos_motivos as pm
            on pi.pedido_id = pm.pedido_id
    )

select * from fato_vendas