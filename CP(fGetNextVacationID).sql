create function "fGetNextVacationID"()
returns integer 
language plpgsql
as $$ 
declare
	id integer;
BEGIN
	select max(v."ID")
	into id
	from "Vacations" v;
	
	if id is null
	then
		id = 1;
	else
		id = id + 1;
	end if;

	return id;
end;
$$