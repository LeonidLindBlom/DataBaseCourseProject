create procedure "pMakeChildren"(
	in name varchar(15)
  , in surname varchar(25)
  , in patronymic varchar(25)
  , in birthday varchar (10)
  , in parent_name varchar(15)
  , in parent_surname varchar(25)
  , in parent_patronimic varchar(25)
)
language plpgsql
as $$	
declare 
	id integer;
	id_staff integer;
begin 
	if name is null or name = ''
	then 
		raise exception 'Неправильное имя ребенка';
	end if;

	if surname is null or surname = ''
		then 
			raise exception 'Неправильная фамилия ребенка';
		end if;
	
	if patronymic is null or patronymic = ''
	then 
		raise exception 'Неправильное отчество ребенка';
	end if;

	if birthday not similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$'
	then 
		raise exception 'Неправильный формат даты';
	end if;

	if parent_name is null or parent_name = ''
	then 
		raise exception 'Неправильное имя сотрудника';
	end if;

	if parent_surname is null or parent_surname = ''
		then 
			raise exception 'Неправильная фамилия сотрудника';
		end if;
	
	if parent_patronymic is null or parent_patronymic = ''
	then 
		raise exception 'Неправильное отчество сотрудника';
	end if;

	select * into id from public."fGetNextChildrenID"();
	
	select * 
	into id_staff from public."fGetStaffID"(parent_name, parent_surname, parent_patronymic);
	
	if id_staff is null
	then 
		raise exception 'Не найден сотрудник %', staff;
	end if;

	insert into "Children"("ID", "Name", "Surname", "BirthDay", "Patronymic","StaffID")
	values  (id, name, surname, birthday, patronymic, id_staff );

	raise notice 'Добавлен новый ребенок';
end;
$$