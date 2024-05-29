create function "fGetNextChildrenID"()
returns integer 
language plpgsql
as $$ 
declare
	id integer;
BEGIN
	select max(c."ID")
	into id
	from "Children" c;
	
	if id is null
	then
		id = 1;
	else
		id = id + 1;
	end if;

	return id;
end;
$$