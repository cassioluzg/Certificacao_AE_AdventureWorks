with
    source_pedidos_detalhados as (
        select * from {{ source('erp_adventureworks', 'sales_salesorderdetail') }}
    ),

    pedidos_detalhados as (
        select
            cast(salesorderid as int) as pedido_id
            , cast(salesorderdetailid as int) as pedido_detalhe_id
            , cast(productid as int) as produto_id
            , cast(orderqty as int) as quantidade
            , cast(unitprice as decimal(19,4)) as preco_unitario
            , cast(unitpricediscount as decimal(19,4)) as desconto_percentual
            , cast(specialofferid as int) as oferta_especial_id
        from source_pedidos_detalhados
    )

select * from pedidos_detalhados