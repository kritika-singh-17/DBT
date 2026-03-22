with 

source as (

    select * from {{ source('raw', 'doctors') }}

),

renamed as (

    select
        doctor_id,
        INITCAP(doctor_name) as doctor_name,
        INITCAP(specialization) as specialization,
        INITCAP(department) as department
    from source

)

select * from renamed        
