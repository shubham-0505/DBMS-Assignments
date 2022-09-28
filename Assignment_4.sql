
C:\Users\Shubham>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Mon Sep 19 15:24:49 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Mon Sep 19 2022 15:24:29 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table circle_area(radius int,area number);

Table created.

SQL> DECLARE
    r int;
    a number;
    BEGIN
    FOR r in 5..9 LOOP
    a:= 3.14 * r * r;
    INSERT INTO circle_area VALUES(r,a);
    dbms_output.Put_line('Area of circle is  = ' || a);
    END LOOP;
    END;
    /

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
    r int;
    a number;
    BEGIN
    FOR r in 5..9 LOOP
    a:= 3.14 * r * r;
    INSERT INTO circle_area VALUES(r,a);
    dbms_output.Put_line('Area of circle is  = ' || a);
    END LOOP;
    END;
    /
Area of circle is  = 78.5
Area of circle is  = 113.04
Area of circle is  = 153.86
Area of circle is  = 200.96
Area of circle is  = 254.34

PL/SQL procedure successfully completed.

SQL> EXIT
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Users\Shubham>
