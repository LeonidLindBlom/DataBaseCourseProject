create procedure "pMakeStaff"(
	in name varchar(15)
  , in surname varchar(25)
  , in patronymic varchar(25)
  , in birthday varchar (10)
  , in sex varchar(1)
  , in post varchar(20)
  , in disability_group integer
)
language plpgsql
as $$	
declare 
	id integer;
	id_disability integer;
	id_post integer;
begin 
	if name is null or name = ''
	then 
		raise exception 'Неправильное имя сотрудника';
	end if;

	if surname is null or surname = ''
		then 
			raise exception 'Неправильная фамилия сотрудника';
		end if;
	
	if patronymic is null or patronymic = ''
	then 
		raise exception 'Неправильное отчество сотрудника';
	end if;

	if post is null or post = ''
	then 
		raise exception 'Неправильная должность сотрудника';
	end if;

	if birthday not similar to '^(([0-2][0-9])|([3][0-1])).([0-1][0-9]).(([1][9]\d{2})|([2][0]\d{2}))$'
	then 
		raise exception 'Неправильный формат даты';
	end if;

	if sex not similar to '^((М)|(Ж))$'
	then 
		raise exception 'Неправильный формат пола';
	end if;

	if disability_group < 0 or disability_group > 3
	then 
		raise exception 'Неправильный формат группы инвалидности';
	end if;

	select * into id from public."fGetNextStaffID"();
	
	select * 
	into id_post from public."fGetPostID"(post);
	
	if id_post is null
	then 
		raise exception 'Не найдена должность %', post;
	end if;
	
	select * 
	into id_disability from public."fGetDisabilityID"(disability_group);

	insert into "Staff"("ID", "Name", "Surname", "Patronymic", "BirthDay", "DisabilityID", "PostID", "Sex")
	values (id, name, surname, patronymic, birthday, id_disability, id_post, sex);

	raise notice 'Добавлен новый сотрудник';
end;
$$

	

