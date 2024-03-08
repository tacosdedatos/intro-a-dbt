with base as (
    select * from {{ ref("base_raw_cf_inscripciones")}}
)
select * from base 