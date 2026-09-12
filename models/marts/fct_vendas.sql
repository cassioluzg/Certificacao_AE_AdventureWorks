with
    pedidos_itens as (
        select * from {{ ref('int_vendas__pedidos_itens') }}
    ),

    produtos as (
        select * from {{ ref('dim_produto') }}
    ),

    fato_vendas as (
        select
            pedidos_itens.pk_vendas
            , pedidos_itens.pedido_id
            , pedidos_itens.pedido_detalhe_id
            , pedidos_itens.produto_id
            , pedidos_itens.cliente_id
            , pedidos_itens.vendedor_id
            , pedidos_itens.territorio_id
            , pedidos_itens.status_pedido
            , pedidos_itens.data_pedido
            , pedidos_itens.quantidade
            , pedidos_itens.preco_unitario
            , pedidos_itens.desconto_percentual
            , cast(pedidos_itens.preco_unitario * pedidos_itens.quantidade as decimal(12,2)) as valor_total_bruto
            , cast(
                pedidos_itens.preco_unitario * pedidos_itens.quantidade * (1 - pedidos_itens.desconto_percentual)
                as decimal(12,2)
            ) as valor_total_liquido
        from pedidos_itens
        left join produtos
            on pedidos_itens.produto_id = produtos.produto_id
    )

select * from fato_vendas