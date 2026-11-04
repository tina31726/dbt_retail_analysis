select
    id,
    created_at,
    name,
    city,
    state,
    year(birth_date) as birth_date,
    source as sales_channel
from
{{ref('bronze_users')}}