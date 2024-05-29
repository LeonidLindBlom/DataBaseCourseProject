--Показывает сотрудников по должности

create function "fShowByPost"(in post varchar(30))
returns table (
	"Surname" varchar(15)
  , "Name" varchar(30)
  , "Patronymic" varchar(25)
)
language plpgsql
as $$	
declare 
	id_post integer;
begin
select * into id_post from "fGetPostID"(post);
return query
select s."Surname"
	 , s."Name"
	 , s."Patronymic"
from "Staff" s
where "id_post" = s."PostID" ;
end;
$$


select * from "fShowByPost"('Аналитик')


