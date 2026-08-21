-- 03_service_weekly

create table service_weekly_clean as
select *
from services_weekly;

select sum(case when `week` is null then 1 else 0 end) as null_week,
sum(case when `month` is null then 1 else 0 end) as null_month,
sum(case when service is null then 1 else 0 end) as null_service,
sum(case when available_beds is null then 1 else 0 end) as null_available_beds,
sum(case when patients_request is null then 1 else 0 end) as null_patients_request,
sum(case when patients_admitted is null then 1 else 0 end) as null_patients_admitted,
sum(case when patients_refused is null then 1 else 0 end) as null_patients_refused,
sum(case when `week` is null then 1 else 0 end) as null_week,
sum(case when `week` is null then 1 else 0 end) as null_week,
sum(case when `week` is null then 1 else 0 end) as null_event
from service_weekly_clean;


select `week`, `month`, service, available_beds, patients_request, patients_admitted, patients_refused, patient_satisfaction, staff_morale, `event`, count(*)
from service_weekly_clean
group by `week`, `month`, service, available_beds, patients_request, patients_admitted, patients_refused, patient_satisfaction, staff_morale, `event`
having count(*);

show tables;

select distinct service, `event`
from service_weekly_clean;








