with
    source_pedidos_detalhados as (
        select
            cast(salesorderdetailid as int) as pedido_detalhe_id
            , cast(salesorderid as int) as pedido_id
            , cast(productid as int) as produto_id
            , cast(specialofferid as int) as oferta_especial_id
            , cast(orderqty as int) as quantidade
            , cast(unitprice as decimal(10,2)) as preco_unitario
            , cast(unitpricediscount as decimal(10,4)) as desconto_percentual
            , cast(carriertrackingnumber as string) as codigo_rastreio
        from {{ source('ERP_AdventureWorks', 'sales_salesorderdetail') }}
    )
select * from source_pedidos_detalhados