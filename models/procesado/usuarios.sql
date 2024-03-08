with base as (
    select * from {{ ref("base_raw_cf_usuarios")}}
)
select * from base 