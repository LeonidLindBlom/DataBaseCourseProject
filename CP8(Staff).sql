alter table "Staff"
add constraint "PK_Staff"
primary key ("ID");

alter table "Staff"
add constraint "FK_Vacations_Staff"
foreign key("VacationID")
references "Vacations"("ID");

alter table "Staff"
add constraint "FK_Children_Staff"
foreign key("ChildID")
references "Children"("ID");

alter table "Staff"
add constraint "FK_Disability_Staff"
foreign key("DisabilityID")
references "Disability"("ID");

alter table "Staff"
add constraint "FK_Posts_Staff"
foreign key("PostID")
references "Posts"("ID");

alter table "Staff"
add constraint "FK_PreviousWorks_Staff"
foreign key("PreviousWorkID")
references "PreviousWorks"("ID");

alter table "Staff" 
alter column "Name"
set not null;

alter table "Staff" 
alter column "Surname"
set not null;

alter table "Staff" 
alter column "Patronymic"
set not null;

alter table "Staff" 
add constraint "CH_BirthDay"
check("BirthDay" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "Staff" 
alter column "BirthDay"
set not null;

alter table "Staff" 
add constraint "CH_Staff_ID"
check("ID">0);

alter table "Staff" 
add column "Sex" varchar(1);

alter table "Staff" 
alter column "Sex"
set not null

alter table "Staff" 
drop constraint "FK_Vacations_Staff";

alter table "Staff" 
drop column "VacationID";

alter table "Staff" 
drop constraint "FK_Children_Staff";

alter table "Staff" 
drop column "ChildID";

alter table "Staff" 
drop constraint "FK_PreviousWorks_Staff";

alter table "Staff" 
drop column "PreviousWorkID";

alter table "Staff" 
drop constraint "CH_BirthDay";

alter table "Staff" 
drop column "BirthDay"

alter table "Staff" 
add column "BirthDay" date