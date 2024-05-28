-- Показывает сотрудников, находящихся в отпуске по уходу за ребенком
create view "vVacationMaternityNow" as
select s."Surname"
	 , s."Name"
	 , s."Patronymic"
	 , v."Start"
	 , v."End"
	 , v."Maternity"
from "Staff" s 
inner join "Vacations" v 
on v."StaffID" = s."ID" 
where now()> v."Start" and now()< v."End" and v."Maternity" similar to '^Да'


select * from "vVacationMaternityNow"
