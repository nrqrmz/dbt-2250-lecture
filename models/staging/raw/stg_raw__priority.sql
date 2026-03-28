with 

source as (

    select * from {{ source('raw', 'priority') }}

),

renamed as (

    select
        compny_name AS company,
        REPLACE(priority, 'loow', 'Low') AS priority

    from source

)

select * from renamed