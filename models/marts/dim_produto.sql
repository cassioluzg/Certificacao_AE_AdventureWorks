with
    produtos as (
        select * from {{ ref('stg_erp__produtos') }}
    )

select
    produto_id
    , nome_produto
    , codigo_produto
    , cor_produto
    , tamanho_produto
    , peso_produto
    , linha_produto
    , classe_produto
    , estilo_produto
    , subcategoria_produto_id
    , modelo_produto_id
    , custo_padrao
    , preco_lista
    , data_inicio_venda
    , data_fim_venda
from produtos