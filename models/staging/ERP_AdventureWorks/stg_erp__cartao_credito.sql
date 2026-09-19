with
    source as (
        select * from {{ source('erp_adventureworks', 'sales_creditcard') }}
    ),

    source_cartao_credito as (
        select
            cast(creditcardid as int) as cartao_credito_id
            , cast(cardtype as string) as tipo_cartao
            , cast(cardnumber as string) as numero_cartao
            , cast(expmonth as int) as mes_validade
            , cast(expyear as int) as ano_validade
        from source
    )

select * from source_cartao_credito