with
    source as (
        select * from {{ source('erp_adventureworks', 'production_product') }}
    ),

    source_produtos as (
        select
            cast(productid as int) as produto_id
            , cast(name as string) as nome_produto
            , cast(productnumber as string) as codigo_produto
            , cast(standardcost as decimal(10,2)) as custo_padrao
            , cast(listprice as decimal(10,2)) as preco_lista
        from source
    )
select * from source_produtos