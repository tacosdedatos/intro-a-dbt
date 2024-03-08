with source as (
      select * from {{ source('raw', 'cf_cursos') }}
),
renamed as (
    select
        {{ adapter.quote("COURSE_ID") }},
        {{ adapter.quote("TITLE") }},
        {{ adapter.quote("DIFFICULTY") }},
        {{ adapter.quote("RELEASE_DATE") }}

    from source
)
select * from renamed
  