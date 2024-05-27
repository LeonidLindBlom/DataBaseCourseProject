create procedure "pPreviousWork"(
	in org_name varchar(30)
  , in start_date varchar(10)
  , in end_date varchar(10)
  , in staff_name varchar(15)
  , in staff_surname varchar(25)
  , in staff_patronimic varchar(25)
  , in post varchar(30)
)
language plpgsql
as $$	
declare 
	id integer;
	id_staff integer;
begin 
	if start_date not similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$'
	then 
		raise exception 'Неправильный формат даты';
	end if;

	if end_date not similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$'
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
	
	if staff_patronymic is null or staff_patronymic = ''
	then 
		raise exception 'Неправильное отчество сотрудника';
	end if;

	if post is null or post = ''
	then 
		raise exception 'Неправильное название должности';
	end if;

	select * into id from public."fGetNextPreviousWorkID"();
	
	select * 
	into id_staff from public."fGetStaffID"(staff_name, staff_surname, staff_patronymic);
	
	if id_staff is null
	then 
		raise exception 'Не найден сотрудник %', staff;
	end if;

	insert into "PreviousWorks"  ("ID", "OrganizationName","Start", "End", "Post", "StaffID")
	values  (id, org_name, start_date, end_date, post, id_staff);

	raise notice 'Добавлены новые данные о предыдущем месте работы сотрудника';
end;
$$