select year, driver, team_name, points
from (
    select
        s.year,
        d.first_name || ' ' || d.last_name as driver,
        t.team_name,
        s.points,
        row_number() over (partition by s.year order by s.points desc) as rn
    from {{ ref('fact_driver_season') }} s
    join {{ ref('dim_drivers') }} d using (driver_key)
    join {{ ref('dim_teams') }} t using (team_key)
) x
where rn = 1
order by year
