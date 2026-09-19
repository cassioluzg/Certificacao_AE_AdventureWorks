with
    cartoes as (
        select * from {{ ref('stg_erp__cartao_credito')}}
    )

select
    cartao_id
    , numero_cartao
    , nome_titular
    , data_validade
    , codigo_seguranca
from cartoes