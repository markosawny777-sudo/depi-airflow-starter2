select
    year,
    md5(driver_first_name || '-' || driver_last_name) as driver_key,
    driver_first_name as first_name,
    driver_last_name as last_name,
    driver_short_name as short_name,
    driver_url,
    driver_nationality as nationality,
    md5(team) as team_key,
    team as team_name,
    team_url,
    case when pts ~ '^[0-9.]+$' then pts::numeric else 0 end as points
from {{ source('raw', 'raw_drivers') }}
