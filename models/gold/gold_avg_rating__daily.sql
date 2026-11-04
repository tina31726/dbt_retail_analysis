with reviews as (
    SELECT * FROM {{ ref('bronze_reviews') }} 
),
products as (
    SELECT
    id,
    created_at,
    product_name,
    category,
    ean,
    vendor,
    price
    FROM
    {{ ref('silver_products') }}
)

SELECT
    date(date_format(r.created_at, 'yyyy-MM-dd')) as review_date,
    r.product_id,
    p.product_name,
    avg(r.rating) as avg_rating
FROM reviews r 
LEFT JOIN products p 
ON r.product_id = p.id
group by all