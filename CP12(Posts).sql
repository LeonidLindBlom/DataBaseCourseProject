alter table "Posts" 
add constraint "PK_Posts"
primary key ("ID");

alter table "Posts"
alter column "Name"
set not null;

alter table "Posts"
alter column "Salary"
set not null;

alter table "Posts"
add constraint "CH_Posts_ID"
check("ID">0);

alter table "Posts"
add constraint "CH_Posts_Salary"
check("Salary">0);
