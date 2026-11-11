select
    d.first_name || ' ' || d.last_name as driver,
    count(*) as wins
from {{ ref('fact_results') }} f
join {{ ref('dim_drivers') }} d using (driver_key)
where f.position = 1
group by 1
order by wins desc
