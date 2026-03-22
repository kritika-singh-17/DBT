with 

source as (

    select * from {{ source('raw', 'patients') }}

),

renamed as (

    select
        patient_id,
        INITCAP(first_name) AS first_name,
        INITCAP(last_name) as last_name,
        dob,
        DATEDIFF('year',dob,current_date) as age,
        UPPER(gender)  as gender,
        INITCAP(city) as city,
        blood_group,
        created_at

    from source

)

select * from renamed