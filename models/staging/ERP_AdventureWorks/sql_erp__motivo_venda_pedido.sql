with
    source as (
        select * from {{ source('erp_adventureworks', 'sales_salesorderheadersalesreason') }}
    ),
    
    source_motivo_venda_pedido as (
        select
            cast(salesorderid as int) as pedido_id
            , cast(salesorderdetailid as int) as detalhe_pedido_id
            , cast(orderqty as int) as quantidade_pedido
            , cast(productid as int) as produto_id
            , cast(specialofferid as int) as oferta_especial_id
            , cast(unitprice as decimal(10,2)) as preco_unitario
            , cast(unitpricediscount as decimal(10,2)) as desconto_preco_unitario
        from source
    )

select * from source_motivo_venda_pedido