
-- This test FAILS if any charges are zero or negative
-- dbt expects 0 rows returned = test passes
SELECT
    admission_id,
    charges
FROM {{ ref('stg_raw__admissions') }}
WHERE charges <= 0