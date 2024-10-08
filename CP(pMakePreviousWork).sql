drop procedure "pMakePreviousWork"

create procedure "pMakePreviousWork"(
	in org_name varchar(30)
  , in start_date date
  , in end_date date
  , in staff_surname varchar(25)
  , in staff_name varchar(15)
  , in staff_patronimic varchar(25)
  , in post varchar(30)
)
language plpgsql
as $$	
declare 
	id integer;
	id_staff integer;
begin 
	if start_date = now()
	then 
		raise exception 'Неправильный формат даты';
	end if;

	if end_date = now()
	then 
		raise exception 'Неправильный формат даты';
	end if;

	if staff_name is null or staff_name = ''
	then 
		raise exception 'Неправильное имя сотрудника';
	end if;

	if staff_surname is null or staff_surname = ''
		then 
			raise exception 'Неправильная фамилия сотрудника';
		end if;
	
	if staff_patronimic is null or staff_patronimic = ''
	then 
		raise exception 'Неправильное отчество сотрудника';
	end if;

	if post is null or post = ''
	then 
		raise exception 'Неправильное название должности';
	end if;

	select * into id from public."fGetNextPreviousWorkID"();
	
	select * 
	into id_staff from public."fGetStaffID"(staff_surname, staff_name, staff_patronimic);
	
	if id_staff is null
	then 
		raise exception 'Не найден сотрудник';
	end if;

	insert into "PreviousWorks"  ("ID", "OrganizationName","Start", "End", "Post", "StaffID")
	values  (id, org_name, start_date, end_date, post, id_staff);

	raise notice 'Добавлены новые данные о предыдущем месте работы сотрудника';
end;
$$

call "pMakePreviousWork"('ОАО"РЖД"', '2015-01-10', '2020-12-14', 'Бибкина', 'Анна', 'Федоровна', 'Аналитик')

select * from "PreviousWorks" pw 