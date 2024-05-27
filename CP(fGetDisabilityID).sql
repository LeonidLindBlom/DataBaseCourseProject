create function "fGetDisabilityID"("group" integer)
	returns integer as
	$$
		select d."ID"
		from "Disability" d
		where d."Group" = "group";
	$$ language sql;
	
drop function "fGetDisabilityID"