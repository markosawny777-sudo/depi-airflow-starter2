select
    race_url as race_key,
    year,
    grand_prix,
    race_date_text,
    winner_driver_key,
    winner_team_key,
    winner_laps,
    winner_time
from {{ ref('stg_races') }}
