with source as (
      select * from {{ source('raw', 'cf_resenas') }}
),
renamed as (
    select
        {{ adapter.quote("FEEDBACK_ID") }},
        {{ adapter.quote("COURSE_ID") }},
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("RATING") }},
        {{ adapter.quote("COMMENT") }},
        {{ adapter.quote("CREATED_AT") }}

    from source
)
select * from renamed
  