select year, driver_key, team_key, points
from {{ ref('stg_drivers') }}
