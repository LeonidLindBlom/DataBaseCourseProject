-- Показывает сотрудников имеющийх детей
create view "vHaveChild" as
select s."Surname"
	 , s."Name"
	 , s."Patronymic"
	 , c."Surname" as "ChildSurname"
	 , c."Name" as "ChildName"
	 , c."Patronymic" as "ChildPatronymic"
from "Staff" s 
inner join "Children" c 
on c."StaffID" = s."ID" 


select * from "vHaveChild"
