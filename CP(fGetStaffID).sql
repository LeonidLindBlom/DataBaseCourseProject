create function "fGetStaffID"(
	"surname" varchar(20)
  , "name" varchar(15)
  , "patronymic" varchar(20)
	)
	returns integer as
	$$
		select s."ID"
		from "Staff" s 
		where s."Surname" = "surname"
			and s."Name" = "name"
			and s."Patronymic" = "patronymic";
	$$ language sql;

drop function "fGetStaffID"