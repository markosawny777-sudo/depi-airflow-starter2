select distinct on (url)
    year,
    grand_prix,
    url as race_url,
    date as race_date_text,
    md5(winner_driver_first_name || '-' || winner_driver_last_name) as winner_driver_key,
    md5(winner_team) as winner_team_key,
    winner_laps,
    winner_time
from {{ source('raw', 'raw_races') }}
order by url
