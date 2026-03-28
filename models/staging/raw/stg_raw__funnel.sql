with 

source as (

    select * from {{ source('raw', 'funnel') }}

),

renamed as (

    select
        company,
        sector,
        date_lead,
        opportunity_date,
        date_customer,
        date_lost

    from source

)

select * from renamed