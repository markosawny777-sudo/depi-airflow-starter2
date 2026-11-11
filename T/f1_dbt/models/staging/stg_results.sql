select distinct
    url as race_url,
    pos as position_text,
    case when pos ~ '^[0-9]+$' then pos::int end as position,
    no as car_number,
    md5(driver_first_name || '-' || driver_last_name) as driver_key,
    driver_first_name as first_name,
    driver_last_name as last_name,
    driver_short_name as short_name,
    md5(team) as team_key,
    team as team_name,
    laps,
    time_retired,
    case when pts ~ '^[0-9.]+$' then pts::numeric else 0 end as points
from {{ source('raw', 'raw_results') }}
