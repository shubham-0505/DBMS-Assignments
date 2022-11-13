create table borrower(rollno int,name varchar(255),date_of_issue date,name_of_book varchar(255),status varchar(20));
create table fine(roll_no int,date_of_return date,fine_amount int);

insert into borrower values(1,'Virat','05-05-2022','The Alchemist','issued');
insert into borrower values(2,'Rohit','20-05-2022','Invisible Man','issued');
insert into borrower values(3,'Jasprit','15-06-2022','Don Quixote','issued');
insert into borrower values(4,'Hardik','25-07-2022','Paradise','issued');
insert into borrower values(5,'Krunal','10-08-2022','Rich dad Poor dad','issued');
insert into borrower values(6,'Bhuvi','20-09-2022','Wings of Fire','issued');

DECLARE
  roll_number number;
  name1 varchar(20);
  dateofissue date;
  System_date date;
  noofdays number(20);
  fine_amount number;
  BEGIN
  roll_number:=:roll_number;
  name1:=:name1;
  select Sysdate into System_date from dual;
  select date_of_issue into dateofissue from borrower where rollno=roll_number and name_of_book=name1;
  dbms_output.put_line(dateofissue);
  noofdays:=System_date - dateofissue;
  dbms_output.put_line(noofdays);
  if noofdays>15 and noofdays<30 then
  fine_amount :=noofdays*5;
  dbms_output.put_line('Fine : ' || fine_amount);
  elsif noofdays>30 then
  fine_amount:=noofdays*50;
  dbms_output.put_line('Fine : ' || fine_amount);
  else
  dbms_output.put_line('No Fine');
  end if;
  if noofdays>15 then
  insert into fine values(roll_number,Sysdate,fine_amount);
  update borrower set status='r' where rollno=roll_number;
  end if;
  exception
  when no_data_found then
  dbms_output.put_line(roll_number || 'Not Found');
  END;
  /
  select * from borrower;
  select * from fine;
