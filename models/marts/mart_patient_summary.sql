with patients as (
select * from {{ ref('stg_raw__patients') }}
),
admissions as(
    select * from {{ ref('stg_raw__admissions') }}
),
patient_stats as(
    select 
    patient_id,
    count(admission_id) as total_admissions,
    sum(charges) as total_charges,
    avg(length_of_stay) as avg_stay_days,
    max(admit_date) as last_admission_date
    from admissions
    group by patient_id
)
select 
p.patient_id,
p.first_name||' '||p.last_name as full_name,
p.age,
p.gender,
p.city,
p.blood_group,
coalesce(ps.total_admissions,0) as total_admissions,
coalesce(ps.total_charges,0) as total_charges,
coalesce(ps.avg_stay_days,0) as avg_stay_days,
ps.last_admission_date
from patients p
left join patient_stats ps using(patient_id)

