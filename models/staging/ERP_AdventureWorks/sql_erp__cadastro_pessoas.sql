with 
    source as (
        select * from {{ source('erp_adventureworks', 'person_person') }}
    ),

    source_pessoas as (
        select
            cast(businessentityid as int) as pessoa_id
            , cast(title as string) as titulo
            , cast(firstname as string) as nome
            , cast(lastname as string) as sobrenome
        from source
    )

select * from source_pessoas