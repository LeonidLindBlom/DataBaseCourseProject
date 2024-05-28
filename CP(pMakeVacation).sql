drop procedure "pMakeVacation"

create procedure "pMakeVacation"(
    in start_date date
  , in end_date date
  , in staff_surname varchar(25)
  , in staff_name varchar(15)
  , in staff_patronimic varchar(25)
  , in maternity varchar(3)
)
language plpgsql
as $$	
declare 
	id integer;
	id_staff integer;
begin 
	if maternity not similar to '^Да|Нет'
	then 
		raise exception 'Неправильный формат статуса отпуска по уходу за ребенком';
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

	select * into id from public."fGetNextVacationID"();
	
	select * 
	into id_staff from public."fGetStaffID"(staff_surname, staff_name, staff_patronimic);
	
	if id_staff is null
	then 
		raise exception 'Не найден сотрудник';
	end if;

	insert into "Vacations" ("ID", "Start", "End", "Maternity", "StaffID")
	values  (id, start_date, end_date, maternity, id_staff);

	raise notice 'Добавлены новые данные об отпуске';
end;
$$

call "pMakeVacation"('2024-05-28','2024-06-28', 'Иванов', 'Иван', 'Иванович', 'Нет' )

call "pMakeVacation"('2024-06-28','2024-07-28', 'Табуретка', 'Сергей', 'Петрович', 'Нет' )

select * from "Vacations" v 