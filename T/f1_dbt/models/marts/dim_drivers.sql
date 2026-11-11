select distinct on (driver_key)
    driver_key, first_name, last_name, short_name, nationality, driver_url
from (
    select driver_key, first_name, last_name, short_name,
           nationality::text as nationality, driver_url::text as driver_url,
           1 as priority, year
    from {{ ref('stg_drivers') }}
    union all
    select driver_key, first_name, last_name, short_name,
           null::text, null::text, 2 as priority, null::int as year
    from {{ ref('stg_results') }}
) all_drivers
order by driver_key, priority, year desc nulls last
