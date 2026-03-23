-- One-off analysis: do older patients stay longer?
SELECT
    CASE
        WHEN age < 30  THEN 'Under 30'
        WHEN age < 50  THEN '30-50'
        WHEN age < 70  THEN '50-70'
        ELSE                'Above 70'
    END                         AS age_group,
    COUNT(a.admission_id)       AS total_admissions,
    ROUND(AVG(a.length_of_stay), 1) AS avg_stay_days,
    ROUND(AVG(a.charges), 0)    AS avg_charges
FROM {{ ref('stg_raw__patients') }} p
LEFT JOIN {{ ref('stg_raw__admissions') }} a USING (patient_id)
GROUP BY age_group
ORDER BY avg_stay_days DESC