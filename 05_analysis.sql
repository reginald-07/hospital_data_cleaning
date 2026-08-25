-- Data Analysis

with staff_present as (
select week, service, sum(present) as total_present
from staff_schedule_clean
group by week, service
),
combined as (select s.week, s.service, s.available_beds, sp.total_present,
s.patient_satisfaction, s.staff_morale
from service_weekly_clean as s
join staff_present as sp
	on s.week = sp.week and s.service = sp.service
)
select 
case when total_present = 0 then 'no_staff' else 'staffed' end as staffing_status,
avg(patient_satisfaction) as avg_satisfaction,
avg(staff_morale) as avg_morale
from combined
group by staffing_status;

