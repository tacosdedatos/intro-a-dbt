with source as (
      select * from {{ source('raw', 'cf_inscripciones') }}
),
renamed as (
    select
        {{ adapter.quote("ENROLLMENT_ID") }},
        {{ adapter.quote("COURSE_ID") }},
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("ENROLLMENT_DATE") }}

    from source
)
select * from renamed
  