with
    source as(
        select * from {{ source('erp_adventureworks', 'person_countryregion') }}
    ),

    source_pais as (
        select
            cast(countryregionid as string) as pais_codigo
            , cast(name as string) as pais_nome
            , cast(modifieddate as date) as data_modificacao
        from source
    )

select * from source_pais