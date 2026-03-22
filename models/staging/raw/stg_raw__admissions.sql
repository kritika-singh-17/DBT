with 

source as (

    select * from {{ source('raw', 'admissions') }}

),

renamed as (

    select
        admission_id,
        patient_id,
        doctor_id,
        admit_date,
        discharge_date,
        DATEDIFF('days',admit_date,coalesce(discharge_date,current_date)) as length_of_stay,
        INITCAP(department) as department,
        INITCAP(diagnosis) as diagnosis,
        charges,
        UPPER(status) as status,
        created_at

    from source

)

select * from renamed