alter table "Children" 
add constraint "PK_Children"
primary key ("ID");

alter table "Children" 
add column "Patronymic" varchar(20);

alter table "Children" 
alter column "Name"
set not null;

alter table "Children" 
alter column "Surname"
set not null;

alter table "Children" 
alter column "Patronymic"
set not null;

alter table "Children" 
alter column "BirthDay"
set not null;

alter table "Children"  
add constraint "CH_BirthDay"
check("BirthDay" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "Children"  
add constraint "CH_Children_ID"
check("ID">0);