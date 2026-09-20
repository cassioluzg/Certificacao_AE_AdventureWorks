with
    source_produtos as (
        select * from {{ source('erp_adventureworks', 'production_product') }}
    ),

    produtos as (
        select
            cast(productid as int) as produto_id
            , cast(name as string) as produto_nome
            , cast(productnumber as string) as produto_numero
            , cast(standardcost as decimal(10,2)) as custo_padrao
            , cast(listprice as decimal(10,2)) as preco_lista
        from source_produtos
    )
select * from produtos