WITH
    source as (
        select * from {{ source('erp_adventureworks', 'sales_salesorderheader') }}
    ),

    source_pedidos as (
        select
            cast(salesorderid as int) as pedido_id
            , cast(customerid as int) as cliente_id
            , cast(salespersonid as int) as vendedor_id
            , cast(territoryid as int) as territorio_id
            , cast(billtoaddressid as int) as endereco_cobranca_id
            , cast(shiptoaddressid as int) as endereco_entrega_id
            , cast(shipmethodid as int) as metodo_envio_id
            , cast(creditcardid as int) as cartao_credito_id
            , cast(status as int) as status_pedido
            , cast(onlineorderflag as boolean) as pedido_online
            , cast(subtotal as decimal(10,2)) as valor_subtotal
            , cast(taxamt as decimal(10,2)) as valor_imposto
            , cast(freight as decimal(10,2)) as valor_frete
            , cast(totaldue as decimal(10,2)) as valor_total_devido
            , cast(orderdate as date) as data_pedido
            , cast(duedate as date) as data_entrega
            , cast(shipdate as date) as data_envio
            , cast(revisionnumber as int) as numero_revisao
            , cast(purchaseordernumber as string) as numero_pedido_compra
        from source_pedidos
    )
    
select * from source_pedidos