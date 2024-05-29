-- Показывает сотрудников, находящихся в отпуске
create view "vVacationNow" as
select s."Surname"
	 , s."Name"
	 , s."Patronymic"
	 , v."Start"
	 , v."End"
from "Staff" s 
inner join "Vacations" v 
on v."StaffID" = s."ID" 
where now()> v."Start" and now()< v."End" ;	


select * from "vVacationNow"