with
    source_produtos as (
        select
            cast(productid as int) as produto_id
            , cast(name as string) as nome_produto
            , cast(productnumber as string) as codigo_produto
            , cast(color as string) as cor_produto
            , cast(standardcost as decimal(10,2)) as custo_padrao
            , cast(listprice as decimal(10,2)) as preco_lista
            , cast(size as string) as tamanho_produto
            , cast(weight as decimal(10,2)) as peso_produto
            , cast(productline as string) as linha_produto
            , cast(class as string) as classe_produto
            , cast(style as string) as estilo_produto
            , cast(productsubcategoryid as int) as subcategoria_produto_id
            , cast(productmodelid as int) as modelo_produto_id
            , cast(sellstartdate as date) as data_inicio_venda
            , cast(sellenddate as date) as data_fim_venda
        from {{ source('ERP_AdventureWorks', 'production_product') }}
    )
select * from source_produtos
    