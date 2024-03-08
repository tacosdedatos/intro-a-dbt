with base as (
    select * from {{ ref("base_raw_cf_cursos")}}
)
select * from base 