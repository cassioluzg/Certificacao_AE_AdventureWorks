with
    cartoes as (
        select * from {{ ref('stg_erp__cartao_credito')}}
    )

select
    cartao_credito_id
    , tipo_cartao
from cartoes