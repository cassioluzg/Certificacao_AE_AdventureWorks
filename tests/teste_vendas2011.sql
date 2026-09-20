/*
    Valida o pedido do Carlos: o valor bruto de vendas em 2011, calculado pela fct_vendas, 
    deve bater com o valor auditado pela contabilidade: $12.646.112,16.
*/

with
    consulta as (
        select
            round(sum(valor_total_bruto), 2) as soma_vendas2011
        from {{ ref('fct_vendas') }}
        where year(data_pedido) = '2011'
    )

select
    soma_vendas2011 as soma_vendas2011
    , 12646112.16 as valor_referencia
from consulta
where round(soma_vendas2011, 2) != 12646112.16