alter table "Vacations" 
add constraint "PK_Vacations"
primary key ("ID");

alter table "Vacations" 
alter column "StartDate"
set not null;

alter table "Vacations" 
alter column "EndDate"
set not null;

alter table "Vacations" 
add constraint "CH_StartDate"
check("StartDate" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "Vacations" 
add constraint "CH_EndDate"
check("EndDate" similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$');

alter table "Vacations" 
add constraint "CH_Vacations_ID"
check("ID">0);