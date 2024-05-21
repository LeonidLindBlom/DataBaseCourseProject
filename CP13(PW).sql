alter table "PreviousWorks" 
add constraint "PK_PreviousWorks"
primary key ("ID");

alter table "PreviousWorks" 
alter column "OrganizationName"
set not null;

alter table "PreviousWorks" 
alter column "Start"
set not null;

alter table "PreviousWorks" 
alter column "End"
set not null;

alter table "PreviousWorks" 
alter column "Post"
set not null;

alter table "PreviousWorks" 
add constraint "CH PreviousWork_ID"
check("ID">0);

alter table "PreviousWorks"  
add constraint "CH_Start"
check("Start" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "PreviousWorks"  
add constraint "CH_End"
check("End" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "PreviousWorks" 
add column "StaffID" int;

alter table "PreviousWorks" 
add constraint "FK_Staff_PreviousWorks"
foreign key("StaffID")
references "Staff"("ID");
