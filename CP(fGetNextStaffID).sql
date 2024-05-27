create function "fGetNextStaffID"()
returns integer 
language plpgsql
as $$ 
declare
	id integer;
BEGIN
	select max(s."ID")
	into id
	from "Staff" s;
	
	if id is null
	then
		id = 1;
	else
		id = id + 1;
	end if;

	return id;
end;
$$