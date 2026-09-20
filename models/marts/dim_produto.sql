with
    produtos as (
        select * from {{ ref('stg_erp__produtos') }}
    )

select
    produto_id
    , produto_nome
    , produto_numero
    , custo_padrao
    , preco_lista
from produtos