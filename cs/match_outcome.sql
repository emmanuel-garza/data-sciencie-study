with tmp as (
	select 
		t1.map_id, 
		t1.date_human_utc,
		t1.team_name as t1_name, 
		t1.team_score as t1_score,
		t2.team_name as t2_name,
		t2.team_score as t2_score
	from 
		matches as t1 
		left join 
		matches as t2
		on t1.map_id = t2.map_id
	where t1.team_id <> t2.team_id
)

select distinct
	map_id,
	date_human_utc,
	case
		when t1_score > t2_score then t1_name
	else t2_name
	end as "Winner",
	case
		when t1_score > t2_score then t1_score
	else t2_score
	end as "Winner Score",
	case
		when t1_score > t2_score then t2_name
	else t1_name
	end as "Looser",
	case
		when t1_score > t2_score then t2_score
	else t1_score
	end as "Loser Score"
from tmp
order by date_human_utc desc