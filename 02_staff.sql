-- 02_staff_cleaning--

create table staff_clean as
select *
from staff;

describe staff_clean;
select *
from staff_clean
limit 20;

select sum(case when staff_id is null then 1 else 0 end) as null_staff_id,
sum(case when staff_name is null then 1 else 0 end) as null_staff_name,
sum(case when `role` is null then 1 else 0 end) as null_role,
sum(case when service is null then 1 else 0 end) as null_service
from staff_clean;

select staff_id, count(*)
from staff_clean
group by staff_id
having count(*);

select distinct service, role
from staff_clean
order by 1,2;


