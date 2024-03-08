{{ config(
    materialized = 'incremental',
    unique_key = 'feedback_id'
) }}

WITH base AS (

    SELECT
        *
    FROM
        {{ ref("base_raw_cf_resenas") }}
)
SELECT
    *
FROM
    base

{% if is_incremental() %}
-- this filter will only be applied on an incremental run
-- (uses >= to include records arriving later on the same day as the last run of this model)
WHERE
    created_at >= (
        SELECT
            MAX(created_at)
        FROM
            {{ this }}
    )
{% endif %}
