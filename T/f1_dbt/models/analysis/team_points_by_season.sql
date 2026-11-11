select t.team_name, s.year, sum(s.points) as team_points
from {{ ref('fact_driver_season') }} s
join {{ ref('dim_teams') }} t using (team_key)
group by 1, 2
order by s.year, team_points desc
