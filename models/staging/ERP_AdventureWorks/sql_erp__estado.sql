with 
    source as (
        select * from {{ source('erp_adventureworks', 'person_stateprovince') }}
    ),
    
    source_estado as (
        select
            cast(stateprovinceid as int) as estado_id
            , cast(stateprovincecode as string) as uf_estado
            , cast(name as string) as estado_nome
            , cast(countryregioncode as string) as pais_codigo
            , cast(territoryid as int) as territorio_id
        from source
    )

select * from source_estado