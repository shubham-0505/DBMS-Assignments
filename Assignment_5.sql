
C:\Users\Shubham>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Wed Sep 28 23:24:44 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Wed Sep 28 2022 22:38:40 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE student_marks(student_name varchar2(255),total_marks number);

Table created.

SQL> CREATE TABLE student_result(student_id number,student_name varchar2(255),category varchar2(30));

Table created.

SQL> SET SERVEROUTPUT ON
SQL> CREATE OR REPLACE PROCEDURE categorization (student_id IN number, student_name IN varchar2,marks IN number) AS
  2      BEGIN
  3      IF (marks<=1500 and marks>=990) THEN
  4      dbms_output.put_line('Distinction !');
  5      INSERT INTO student_result VALUES (student_id,student_name,'Distinction !');
  6      ELSIF (marks<=989 and marks>=900) THEN
  7      dbms_output.put_line('First Class Category');
  8      INSERT INTO student_result VALUES (student_id,student_name,'First Class Category');
  9      ELSIF (marks<=899 and marks>825) THEN
 10      dbms_output.put_line('Higher Second Class Category');
 11      INSERT INTO student_result VALUES(student_id,student_name,'Higher Second Class Category');
 12      ELSIF (marks<=825 and marks>500) THEN
 13      dbms_output.put_line('Lower Second Class Category');
 14      INSERT INTO student_result VALUES(student_id,student_name,'Lower Second Class Category');
 15      ELSE
 16      dbms_output.put_line('Failed !');
 17      INSERT INTO student_result VALUES(student_id,student_name,'Failed !');
 18      END IF;
 19      INSERT INTO student_marks VALUES(student_name,marks);
 20      END categorization;
 21      /

Procedure created.

SQL> BEGIN
  2  categorization(01,'Krishna',1300);
  3  categorization(02,'Vasudev',970);
  4  categorization(03,'Govind',880);
  5  categorization(04,'Murlidhar',700);
  6  categorization(04,'Murlidhar',450);
  7  END;
  8  /
Distinction !
First Class Category
Higher Second Class Category
Lower Second Class Category
Failed !

PL/SQL procedure successfully completed.

SQL> SELECT * FROM student_marks;

STUDENT_NAME
--------------------------------------------------------------------------------
TOTAL_MARKS
-----------
Krishna
       1300

Vasudev
        970

Govind
        880


STUDENT_NAME
--------------------------------------------------------------------------------
TOTAL_MARKS
-----------
Murlidhar
        700

Murlidhar
        450


SQL> SELECT * FROM student_result;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------
         1
Krishna
Distinction !

         2
Vasudev
First Class Category

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------

         3
Govind
Higher Second Class Category

         4
Murlidhar

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------
Lower Second Class Category

         4
Murlidhar
Failed !


SQL> EXIT
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Users\Shubham>
