alter table "Disability" 
add constraint "PK_Disability"
primary key ("ID");

alter table "Disability"  
add constraint "CH_Disability_ID"
check("ID">0);