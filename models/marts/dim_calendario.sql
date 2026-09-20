{{ config(materialized='table') }}
    
with

datas_limites as (
    select
        min(data_pedido) as data_min
        , max(data_pedido) as data_max
    from {{ ref('stg_erp__pedidos') }}
),

calendario as (
    select
        explode(sequence(datas_limites.data_min, datas_limites.data_max, interval 1 day)) as data
    from datas_limites
)

select
    cast(data as date) as data_id
    , year(data) as ano
    , month(data) as mes
    , date_format(data, 'MMMM') as nome_mes
    , quarter(data) as trimestre
    , date_format(data, 'EEEE') as nome_dia_semana
    , date_format(data, 'yyyy-MM') as ano_mes
from calendario