create function "fGetNextPreviousWorkID"()
returns integer 
language plpgsql
as $$ 
declare
	id integer;
BEGIN
	select max(pw."ID")
	into id
	from "PreviousWorks" pw;
	
	if id is null
	then
		id = 1;
	else
		id = id + 1;
	end if;

	return id;
end;
$$