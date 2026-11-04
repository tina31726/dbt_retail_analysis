select
    id,
    created_at,
    title as product_name,
    category,
    ean,
    vendor,
    price
from
{{ref('product_snapshot')}}
where dbt_valid_to is null