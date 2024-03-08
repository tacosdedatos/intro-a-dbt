WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'cf_resenas'
        ) }}
),
renamed AS (
    SELECT
        {{ adapter.quote("FEEDBACK_ID") }},
        {{ adapter.quote("COURSE_ID") }},
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("RATING") }},
        {{ adapter.quote("COMMENT") }},
        {{ adapter.quote("CREATED_AT") }}
    FROM
        source
)
SELECT
    *
FROM
    renamed
WHERE
    rating >= 1
    AND rating <= 5
    AND created_at IS NOT NULL
