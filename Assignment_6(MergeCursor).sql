
C:\Users\Shubham>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Tue Nov 15 01:17:47 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Tue Nov 15 2022 00:59:52 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table old_rollcall(roll_no int,name varchar(30),status varchar(30));

Table created.

SQL> create table new_rollcall(roll_no int,name varchar(30),status varchar(30));

Table created.

SQL> insert into old_rollcall values(1,'Krishna','Present');

1 row created.

SQL> insert into old_rollcall values(2,'Govind','Present');

1 row created.

SQL> insert into old_rollcall values(3,'Madhav','Absent');

1 row created.

SQL> insert into new_rollcall values(3,'Madhav','Absent');

1 row created.

SQL> insert into new_rollcall values(4,'Vasudev','Present');

1 row created.

SQL> insert into new_rollcall values(5,'Shyam','Absent');

1 row created.

SQL> select * from old_rollcall;

   ROLL_NO NAME                           STATUS
---------- ------------------------------ ------------------------------
         1 Krishna                        Present
         2 Govind                         Present
         3 Madhav                         Absent

SQL> select * from new_rollcall;

   ROLL_NO NAME                           STATUS
---------- ------------------------------ ------------------------------
         3 Madhav                         Absent
         4 Vasudev                        Present
         5 Shyam                          Absent

SQL> BEGIN
  2      merge into new_rollcall table1 using (select roll_no,name,status from old_rollcall) table2
  3      on (table1.roll_no=table2.roll_no)
  4      when not matched then
  5      insert values(table2.roll_no,table2.name,table2.status);
  6      if sql%rowcount >0 then
  7      dbms_output.put_line('Merged' || sql%rowcount || ' Rows Updated ');
  8      else
  9      dbms_output.put_line('No Rows Updated');
 10      end if;
 11      if sql%notfound then
 12      dbms_output.put_line('Not Merged');
 13      end if;
 14      END;
 15      /

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> BEGIN
  2      merge into new_rollcall table1 using (select roll_no,name,status from old_rollcall) table2
  3      on (table1.roll_no=table2.roll_no)
  4      when not matched then
  5      insert values(table2.roll_no,table2.name,table2.status);
  6      if sql%rowcount >0 then
  7      dbms_output.put_line('Merged' || sql%rowcount || ' Rows Updated ');
  8      else
  9      dbms_output.put_line('No Rows Updated');
 10      end if;
 11      if sql%notfound then
 12      dbms_output.put_line('Not Merged');
 13      end if;
 14      END;
 15      /
No Rows Updated
Not Merged

PL/SQL procedure successfully completed.

SQL> select * from old_rollcall;

   ROLL_NO NAME                           STATUS
---------- ------------------------------ ------------------------------
         1 Krishna                        Present
         2 Govind                         Present
         3 Madhav                         Absent

SQL> select * from new_rollcall;

   ROLL_NO NAME                           STATUS
---------- ------------------------------ ------------------------------
         3 Madhav                         Absent
         4 Vasudev                        Present
         5 Shyam                          Absent
         1 Krishna                        Present
         2 Govind                         Present

SQL> exit
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Users\Shubham>
