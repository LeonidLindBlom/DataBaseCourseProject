create function "fGetPostID"("name" varchar(15))
	returns integer as
	$$
		select p."ID"
		from "Posts" p
		where p."Name" = "name";
	$$ language sql;