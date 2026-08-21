-- 04_staff_schedule

create table staff_schedule_clean as
select *
from staff_schedule;

select *
from staff_schedule_clean
limit 20;

select sum(case when `week` is null then 1 else 0 end) as null_week,
sum(case when staff_id is null then 1 else 0 end) as null_staff_id,
sum(case when staff_name is null then 1 else 0 end) as null_staff_name,
sum(case when `role` is null then 1 else 0 end) as null_role,
sum(case when service is null then 1 else 0 end) as null_service,
sum(case when present is null then 1 else 0 end) as null_present
from staff_schedule_clean;

select distinct staff_id, staff_name, `role`, service
from staff_schedule_clean;