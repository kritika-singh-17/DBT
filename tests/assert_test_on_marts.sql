SELECT
    patient_id,
    total_charges
FROM {{ ref('mart_patient_summary') }}
WHERE total_charges <= 0