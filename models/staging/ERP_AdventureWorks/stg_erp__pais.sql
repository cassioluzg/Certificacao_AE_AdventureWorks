with
    source_pais as(
        select * from {{ source('erp_adventureworks', 'person_countryregion') }}
    ),

    pais as (
        select
            cast(countryregioncode as string) as pais_codigo
            , cast(name as string) as pais_nome
        from source_pais
    )

select * from pais  