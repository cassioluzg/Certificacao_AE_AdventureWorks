with
    source_cartao_credito as (
        select * from {{ source('erp_adventureworks', 'sales_creditcard') }}
    ),

    cartao_credito as (
        select
            cast(creditcardid as int) as cartao_credito_id
            , cast(cardtype as string) as tipo_cartao
        from source_cartao_credito
    )

select * from cartao_credito