with source as (
      select * from {{ source('raw', 'cf_usuarios') }}
),
renamed as (
    select
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("FIRST_NAME") }},
        {{ adapter.quote("LAST_NAME") }},
        {{ adapter.quote("EMAIL") }},
        {{ adapter.quote("SIGNUP_DATE") }},
        {{ adapter.quote("USERNAME") }},
        {{ adapter.quote("SUBSCRIPTION_TYPE") }}

    from source
)
select * from renamed
  