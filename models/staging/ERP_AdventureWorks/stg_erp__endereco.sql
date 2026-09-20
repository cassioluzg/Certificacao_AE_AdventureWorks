with
    source_endereco as (
        select * from {{ source('erp_adventureworks', 'person_address') }}
    ),

    endereco as (
        select
            cast(addressid as int) as endereco_id
            , cast(addressline1 as string) as endereco_linha1
            , cast(addressline2 as string) as endereco_linha2
            , cast(city as string) as cidade
            , cast(stateprovinceid as int) as estado_id
        from source_endereco
    )

select * from endereco