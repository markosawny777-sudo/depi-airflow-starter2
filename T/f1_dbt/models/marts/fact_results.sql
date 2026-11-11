select
    race_url as race_key,
    driver_key,
    team_key,
    position,
    position_text,
    laps,
    time_retired,
    points
from {{ ref('stg_results') }}
