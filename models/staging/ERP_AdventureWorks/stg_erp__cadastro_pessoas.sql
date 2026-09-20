with 
    source_pessoas as (
        select * from {{ source('erp_adventureworks', 'person_person') }}
    ),

    pessoas as (
        select
            cast(businessentityid as int) as pessoa_id
            , cast(title as string) as pessoa_titulo
            , cast(firstname as string) as pessoa_nome
            , cast(lastname as string) as pessoa_sobrenome
        from source_pessoas
    )

select * from pessoas