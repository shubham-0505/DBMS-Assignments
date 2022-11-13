
C:\Users\Shubham>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Wed Sep 28 23:37:01 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Wed Sep 28 2022 23:36:05 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE student_marks(student_name varchar2(255),total_marks number);

Table created.

SQL> CREATE TABLE student_result(student_id number,student_name varchar2(255),category varchar2(30));

Table created.

SQL> SET SERVEROUTPUT ON
SQL> CREATE OR REPLACE PROCEDURE categorization (student_id IN number, student_name IN varchar2,marks IN number) AS
        BEGIN
        IF (marks<=1500 and marks>=990) THEN
        dbms_output.put_line('Distinction !');
        INSERT INTO student_result VALUES (student_id,student_name,'Distinction !');
        ELSIF (marks<=989 and marks>=900) THEN
        dbms_output.put_line('First Class Category');
        INSERT INTO student_result VALUES (student_id,student_name,'First Class Category');
        ELSIF (marks<=899 and marks>825) THEN
        dbms_output.put_line('Higher Second Class Category');
        INSERT INTO student_result VALUES(student_id,student_name,'Higher Second Class Category');
        ELSIF (marks<=825 and marks>500) THEN
        dbms_output.put_line('Lower Second Class Category');
        INSERT INTO student_result VALUES(student_id,student_name,'Lower Second Class Category');
        ELSE
        dbms_output.put_line('Failed !');
        INSERT INTO student_result VALUES(student_id,student_name,'Failed !');
        END IF;
        INSERT INTO student_marks VALUES(student_name,marks);
        END categorization;
        /

Procedure created.

SQL> BEGIN
    categorization(01,'Krishna',1300);
    categorization(02,'Vasudev',970);
    categorization(03,'Govind',880);
    categorization(04,'Murlidhar',700);
    categorization(05,'Shyam',450);
    END;
    /
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

Shyam
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

         5
Shyam
Failed !


SQL> EXIT
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Users\Shubham>
