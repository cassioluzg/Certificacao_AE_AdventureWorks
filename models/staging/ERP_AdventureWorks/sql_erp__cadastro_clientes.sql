with
    source as (
        select * from {{ source('erp_adventureworks', 'sales_customer') }}
    ),

    source_clientes as (
        select
            cast(customerid as int) as cliente_id
            , cast(personid as int) as pessoa_id
            , cast(storeid as int) as loja_id
            , cast(territoryid as int) as territorio_id
        from source
    )

select * from source_clientes