with base as (
    select * from {{ ref("base_raw_cf_resenas")}}
)
select * from base 