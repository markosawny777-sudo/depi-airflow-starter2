select distinct on (team_key) team_key, team_name, team_url
from {{ ref('stg_drivers') }}
order by team_key, year desc
