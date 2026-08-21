drop table staff_schedule;

create table staff_schedule(
week int,
staff_id varchar(20),
staff_name varchar(100),
`role` varchar(50),
service varchar(50),
present int
);

load data local infile 'C:/Users/VALCITYDIGITAL/Desktop/Hospital datasets/staff_schedule.csv'
into table staff_schedule
fields terminated by ','
enclosed by ""
ignore 1 rows;
show global variables like 'local_infile';

SELECT count(*)
from staff_schedule;
show warnings;


select *
from patients
limit 20;

select sum(case when patient_id is null then 1 else 0 end) as null_patient_id,
sum(case when name is null then 1 else 0 end) as null_name,
sum(case when age is null then 1 else 0 end) as null_age,
sum(case when arrival_date is null then 1 else 0 end) as null_arrival_date,
sum(case when departure_date is null then 1 else 0 end) as null_departure_date,
sum(case when service is null then 1 else 0 end) as null_service,
sum(case when satisfaction is null then 1 else 0 end) as null_satisfaction
from patients;

select patient_id
from patients 
group by patient_id
having count(*) > 1;

select age
from patients
where age < 1 or age >= 100;

select age, service, count(*)
from patients
where age = 0
group by age, service;

create table patient_clean as
select *
from patients
;
alter table patient_clean 
add column age_flag varchar(30);
update patient_clean
set age_flag = 'suspicious_age'
where age = 0;

select age_flag
from patient_clean
where age_flag = 'suspicious_age';

select *
from patient_clean
where arrival_date > departure_date;

select distinct service
from patient_clean;

select min(satisfaction), max(satisfaction)
from patient_clean;

