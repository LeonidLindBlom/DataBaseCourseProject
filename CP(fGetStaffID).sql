create function "fGetStaffID"(
	"name" varchar(15)
  , "surname" varchar(20)
  , "patronymic" varchar(20)
	)
	returns integer as
	$$
		select s."ID"
		from "Staff" s 
		where s."Name" = "name" 
			and s."Surname" = "surname"
			and s."Patronymic" = "patronymic";
	$$ language sql;