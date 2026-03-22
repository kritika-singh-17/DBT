with admissions as (
    select * from {{ ref('stg_raw__admissions') }}
),
doctors as(
    select * from {{ ref('stg_raw__doctors') }}
)
select
d.doctor_id,
d.doctor_name,
d.specialization,
count(a.admission_id) as total_patients_handled,
round(avg(a.length_of_stay),1) as avg_patient_stay,
sum(a.charges) as total_revenue_generated,
count(case when a.status='admitted' then 1 end) as active_patients
from doctors d
left join admissions a using(doctor_id)
group by d.doctor_id,d.doctor_name,d.specialization
order by total_revenue_generated desc


