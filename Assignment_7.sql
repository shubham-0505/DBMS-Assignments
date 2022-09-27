
C:\Users\Shubham>sqlplus

SQL*Plus: Release 21.0.0.0.0 - Production on Tue Sep 27 21:43:30 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Tue Sep 27 2022 21:42:23 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE library(book_name varchar2(255),book_status varchar2(255));

Table created.

SQL> CREATE TABLE logs(modification_date DATE,book_name varchar(255),old_status varchar(20),new_status varchar(20),action_performed varchar(20));

Table created.

SQL> INSERT INTO library VALUES('The Alchemist','Available');

1 row created.

SQL> INSERT INTO library VALUES('Rich dad Poor dad','Unavailable');

1 row created.

SQL> INSERT INTO library VALUES('Don Quixote','Unavailable');

1 row created.

SQL> INSERT INTO library VALUES('Nancy Drew','Unavailable');

1 row created.

SQL> INSERT INTO library VALUES('Lincoln in the Bardo','Available');

1 row created.

SQL> INSERT INTO library VALUES('Lord of the Rings','Available');

1 row created.

SQL> select * from library;

BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
The Alchemist
Available

Rich dad Poor dad
Unavailable

Don Quixote
Unavailable


BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
Nancy Drew
Unavailable

Lincoln in the Bardo
Available

Lord of the Rings
Available


6 rows selected.

SQL> CREATE OR REPLACE TRIGGER audits AFTER INSERT OR UPDATE OR DELETE ON library FOR EACH ROW
  2      BEGIN
  3      IF UPDATING THEN
  4      dbms_output.put_line(:OLD.book_status);
  5      INSERT INTO logs VALUES(SYSDATE,:OLD.book_name,:OLD.book_status,:NEW.book_status,'UPDATE ACTION');
  6      ELSIF INSERTING THEN
  7      dbms_output.put_line('Inserting' || rpad(' ',2,' ') || :NEW.book_name);
  8      INSERT INTO logs VALUES(SYSDATE,:NEW.book_name,NULL,:NEW.book_status,'INSERT ACTION');
  9      ELSIF DELETING THEN
 10      dbms_output.put_line('Deleting' || rpad(' ',2,' ') || :OLD.book_name);
 11      INSERT INTO logs VALUES(SYSDATE,:OLD.book_name,:OLD.book_status,NULL,'DELETE ACTION');
 12      END IF;
 13      END;
 14      /

Trigger created.

SQL> UPDATE library SET book_status='Available' WHERE book_name='Nancy Drew';

1 row updated.

SQL> select * from library;

BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
The Alchemist
Available

Rich dad Poor dad
Unavailable

Don Quixote
Unavailable


BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
Nancy Drew
Available

Lincoln in the Bardo
Available

Lord of the Rings
Available


6 rows selected.

SQL> select * from logs;

MODIFICAT
---------
BOOK_NAME
--------------------------------------------------------------------------------
OLD_STATUS           NEW_STATUS           ACTION_PERFORMED
-------------------- -------------------- --------------------
27-SEP-22
Nancy Drew
Unavailable          Available            UPDATE ACTION


SQL> DELETE FROM library WHERE book_name='Lincoln in the Bardo';

1 row deleted.

SQL> select * from library;

BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
The Alchemist
Available

Rich dad Poor dad
Unavailable

Don Quixote
Unavailable


BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
Nancy Drew
Available

Lord of the Rings
Available


SQL> select * from logs;

MODIFICAT
---------
BOOK_NAME
--------------------------------------------------------------------------------
OLD_STATUS           NEW_STATUS           ACTION_PERFORMED
-------------------- -------------------- --------------------
27-SEP-22
Nancy Drew
Unavailable          Available            UPDATE ACTION

27-SEP-22
Lincoln in the Bardo
Available                                 DELETE ACTION

MODIFICAT
---------
BOOK_NAME
--------------------------------------------------------------------------------
OLD_STATUS           NEW_STATUS           ACTION_PERFORMED
-------------------- -------------------- --------------------


SQL> INSERT INTO library VALUES('Wings of Fire','Available');

1 row created.

SQL> select * from library;

BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
The Alchemist
Available

Rich dad Poor dad
Unavailable

Don Quixote
Unavailable


BOOK_NAME
--------------------------------------------------------------------------------
BOOK_STATUS
--------------------------------------------------------------------------------
Nancy Drew
Available

Lord of the Rings
Available

Wings of Fire
Available


6 rows selected.

SQL> select * from logs;

MODIFICAT
---------
BOOK_NAME
--------------------------------------------------------------------------------
OLD_STATUS           NEW_STATUS           ACTION_PERFORMED
-------------------- -------------------- --------------------
27-SEP-22
Nancy Drew
Unavailable          Available            UPDATE ACTION

27-SEP-22
Lincoln in the Bardo
Available                                 DELETE ACTION

MODIFICAT
---------
BOOK_NAME
--------------------------------------------------------------------------------
OLD_STATUS           NEW_STATUS           ACTION_PERFORMED
-------------------- -------------------- --------------------

27-SEP-22
Wings of Fire
                     Available            INSERT ACTION


SQL> EXIT
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

C:\Users\Shubham>
