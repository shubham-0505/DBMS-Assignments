Assignment_1

ubuntu@ubuntu-virtual-machine:~$ sudo mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bank               |
| company            |
| dogs               |
| hospital           |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

/* creating a database */
mysql> create database institute;
Query OK, 1 row affected (0.04 sec)

mysql> use institute;
Database changed

/* creating table */
mysql> create table employee(emp_id int,
    -> first_name varchar(20),
    -> last_name varchar(20),
    -> emp_age int,
    -> emp_salary int);
Query OK, 0 rows affected (0.01 sec)

/* inserting values in table */
mysql> insert into employee values(1,"Tom","Hardy",26,45000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
+--------+------------+-----------+---------+------------+
1 row in set (0.00 sec)

mysql> insert into employee values(2,"Sam","Curran",32,60000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
+--------+------------+-----------+---------+------------+
2 rows in set (0.00 sec)

/* inserting multiple values simultaneously */
mysql> insert into employee values(3,"Joe","Root",28,50000),
    -> (4,"John","Bairstow",35,65000),
    -> (5,"Ben","Stokes",33,70000),
    -> (6,"Tim","David",37,55000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
|      3 | Joe        | Root      |      28 |      50000 |
|      4 | John       | Bairstow  |      35 |      65000 |
|      5 | Ben        | Stokes    |      33 |      70000 |
|      6 | Tim        | David     |      37 |      55000 |
+--------+------------+-----------+---------+------------+
6 rows in set (0.00 sec)

mysql> insert into employee(emp_id,first_name,last_name)values(7,"Mitchell","Starc");
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
|      3 | Joe        | Root      |      28 |      50000 |
|      4 | John       | Bairstow  |      35 |      65000 |
|      5 | Ben        | Stokes    |      33 |      70000 |
|      6 | Tim        | David     |      37 |      55000 |
|      7 | Mitchell   | Starc     |    NULL |       NULL |
+--------+------------+-----------+---------+------------+
7 rows in set (0.00 sec)

/* select statement */
mysql> select emp_id,first_name,last_name from employee;
+--------+------------+-----------+
| emp_id | first_name | last_name |
+--------+------------+-----------+
|      1 | Tom        | Hardy     |
|      2 | Sam        | Curran    |
|      3 | Joe        | Root      |
|      4 | John       | Bairstow  |
|      5 | Ben        | Stokes    |
|      6 | Tim        | David     |
|      7 | Mitchell   | Starc     |
+--------+------------+-----------+
7 rows in set (0.00 sec)

mysql> select first_name,last_name,emp_age,emp_salary from employee where emp_id=1;
+------------+-----------+---------+------------+
| first_name | last_name | emp_age | emp_salary |
+------------+-----------+---------+------------+
| Tom        | Hardy     |      26 |      45000 |
+------------+-----------+---------+------------+
1 row in set (0.00 sec)

mysql> select first_name,emp_salary from employee where emp_salary=70000;
+------------+------------+
| first_name | emp_salary |
+------------+------------+
| Ben        |      70000 |
+------------+------------+
1 row in set (0.00 sec)

mysql> select first_name,last_name,emp_salary from employee where emp_age=32;
+------------+-----------+------------+
| first_name | last_name | emp_salary |
+------------+-----------+------------+
| Sam        | Curran    |      60000 |
+------------+-----------+------------+
1 row in set (0.00 sec)

mysql> select * from employee where emp_salary>20000 AND emp_salary<70000;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
|      3 | Joe        | Root      |      28 |      50000 |
|      4 | John       | Bairstow  |      35 |      65000 |
|      6 | Tim        | David     |      37 |      55000 |
+--------+------------+-----------+---------+------------+
5 rows in set (0.00 sec)

/* alter statement */
mysql> alter table employee add column emp_city varchar(20);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+----------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_city |
+--------+------------+-----------+---------+------------+----------+
|      1 | Tom        | Hardy     |      26 |      45000 | NULL     |
|      2 | Sam        | Curran    |      32 |      60000 | NULL     |
|      3 | Joe        | Root      |      28 |      50000 | NULL     |
|      4 | John       | Bairstow  |      35 |      65000 | NULL     |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL     |
|      6 | Tim        | David     |      37 |      55000 | NULL     |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL     |
+--------+------------+-----------+---------+------------+----------+
7 rows in set (0.00 sec)

mysql> alter table employee add column middle_name varchar(25);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+----------+-------------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_city | middle_name |
+--------+------------+-----------+---------+------------+----------+-------------+
|      1 | Tom        | Hardy     |      26 |      45000 | NULL     | NULL        |
|      2 | Sam        | Curran    |      32 |      60000 | NULL     | NULL        |
|      3 | Joe        | Root      |      28 |      50000 | NULL     | NULL        |
|      4 | John       | Bairstow  |      35 |      65000 | NULL     | NULL        |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL     | NULL        |
|      6 | Tim        | David     |      37 |      55000 | NULL     | NULL        |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL     | NULL        |
+--------+------------+-----------+---------+------------+----------+-------------+
7 rows in set (0.00 sec)

mysql> alter table employee drop column middle_name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+----------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_city |
+--------+------------+-----------+---------+------------+----------+
|      1 | Tom        | Hardy     |      26 |      45000 | NULL     |
|      2 | Sam        | Curran    |      32 |      60000 | NULL     |
|      3 | Joe        | Root      |      28 |      50000 | NULL     |
|      4 | John       | Bairstow  |      35 |      65000 | NULL     |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL     |
|      6 | Tim        | David     |      37 |      55000 | NULL     |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL     |
+--------+------------+-----------+---------+------------+----------+
7 rows in set (0.00 sec)

mysql> alter table employee modify column emp_city varchar(15);
Query OK, 7 rows affected (0.05 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> alter table employee rename column emp_city to emp_country;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+-------------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_country |
+--------+------------+-----------+---------+------------+-------------+
|      1 | Tom        | Hardy     |      26 |      45000 | NULL        |
|      2 | Sam        | Curran    |      32 |      60000 | NULL        |
|      3 | Joe        | Root      |      28 |      50000 | NULL        |
|      4 | John       | Bairstow  |      35 |      65000 | NULL        |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL        |
|      6 | Tim        | David     |      37 |      55000 | NULL        |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL        |
+--------+------------+-----------+---------+------------+-------------+
7 rows in set (0.00 sec)

/* update statement */
mysql> update employee set emp_country="England" where emp_age=26;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+-------------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_country |
+--------+------------+-----------+---------+------------+-------------+
|      1 | Tom        | Hardy     |      26 |      45000 | England     |
|      2 | Sam        | Curran    |      32 |      60000 | NULL        |
|      3 | Joe        | Root      |      28 |      50000 | NULL        |
|      4 | John       | Bairstow  |      35 |      65000 | NULL        |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL        |
|      6 | Tim        | David     |      37 |      55000 | NULL        |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL        |
+--------+------------+-----------+---------+------------+-------------+
7 rows in set (0.00 sec)

mysql> update employee set emp_country="USA" where emp_id=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+-------------+
| emp_id | first_name | last_name | emp_age | emp_salary | emp_country |
+--------+------------+-----------+---------+------------+-------------+
|      1 | Tom        | Hardy     |      26 |      45000 | USA         |
|      2 | Sam        | Curran    |      32 |      60000 | NULL        |
|      3 | Joe        | Root      |      28 |      50000 | NULL        |
|      4 | John       | Bairstow  |      35 |      65000 | NULL        |
|      5 | Ben        | Stokes    |      33 |      70000 | NULL        |
|      6 | Tim        | David     |      37 |      55000 | NULL        |
|      7 | Mitchell   | Starc     |    NULL |       NULL | NULL        |
+--------+------------+-----------+---------+------------+-------------+
7 rows in set (0.00 sec)


mysql> alter table employee drop column emp_country;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
|      3 | Joe        | Root      |      28 |      50000 |
|      4 | John       | Bairstow  |      35 |      65000 |
|      5 | Ben        | Stokes    |      33 |      70000 |
|      6 | Tim        | David     |      37 |      55000 |
|      7 | Mitchell   | Starc     |    NULL |       NULL |
+--------+------------+-----------+---------+------------+
7 rows in set (0.00 sec)

/* delete statement */
mysql> delete from employee where emp_id=7;
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+--------+------------+-----------+---------+------------+
| emp_id | first_name | last_name | emp_age | emp_salary |
+--------+------------+-----------+---------+------------+
|      1 | Tom        | Hardy     |      26 |      45000 |
|      2 | Sam        | Curran    |      32 |      60000 |
|      3 | Joe        | Root      |      28 |      50000 |
|      4 | John       | Bairstow  |      35 |      65000 |
|      5 | Ben        | Stokes    |      33 |      70000 |
|      6 | Tim        | David     |      37 |      55000 |
+--------+------------+-----------+---------+------------+
6 rows in set (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_institute |
+---------------------+
| employee            |
+---------------------+
1 row in set (0.00 sec)

mysql> desc employee;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| emp_id     | int         | YES  |     | NULL    |       |
| first_name | varchar(20) | YES  |     | NULL    |       |
| last_name  | varchar(20) | YES  |     | NULL    |       |
| emp_age    | int         | YES  |     | NULL    |       |
| emp_salary | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> delete from employee;
Query OK, 6 rows affected (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_institute |
+---------------------+
| employee            |
+---------------------+
1 row in set (0.01 sec)

mysql> select * from employee;
Empty set (0.00 sec)

mysql> 
