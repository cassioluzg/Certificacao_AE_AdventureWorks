with
    source as (
        select * from {{ source('erp_adventureworks', 'sales_salesreason') }}
    ),

    source_motivo_vendas as (
        select
            cast(salesorderid as int) as pedido_id
            , cast(revisionnumber as int) as numero_revisao
            , cast(orderdate as date) as data_pedido
            , cast(duedate as date) as data_vencimento
            , cast(shipdate as date) as data_envio
            , cast(status as int) as status
            , cast(customerid as int) as customer_id
            , cast(salespersonid as int) as salesperson_id
            , cast(territoryid as int) as territory_id
            , cast(creditcardid as int) as creditcard_id
            , cast(currencyrateid as int) as currencyrate_id
            , cast(subtotal as decimal(10,2)) as subtotal
            , cast(totaldue as decimal(10,2)) as totaldue
        from source
    )

select * from source_motivo_vendas