WITH stg_funnel AS (
    SELECT * FROM {{ ref("stg_raw__funnel") }}
), stg_priority AS (
    SELECT * FROM {{ ref("stg_raw__priority") }}
)

SELECT
company,
sector,
priority,
date_lead,
opportunity_date,
date_customer,
date_lost,
CASE
    WHEN date_lost IS NOT NULL THEN '4 - Lost'
    WHEN date_customer IS NOT NULL THEN '3 - Customer'
    WHEN opportunity_date IS NOT NULL THEN '2 - Opportunity'
    WHEN date_lead IS NOT NULL THEN '1 - Lead'
    ELSE NULL
END AS deal_stage
FROM stg_funnel
LEFT JOIN stg_priority
USING(company)