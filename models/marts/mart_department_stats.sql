select 
department,
count(admission_id) as total_admissions,
count(case when status='admitted' then 1 end) as currently_admitted,
count(case when status='discharged' then 1 end) as total_discharged,
round(avg(length_of_stay),1) as avg_length_of_stay,
sum(charges) as total_revenue,
round(avg(charges),0) as avg_charges_per_admission
from {{ ref('stg_raw__admissions') }}
group by department
order by total_revenue desc