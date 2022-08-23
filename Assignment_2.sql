Assignment_2

ubuntu@ubuntu-virtual-machine:~$ sudo mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
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
| book_shop          |
| company            |
| dogs               |
| hospital           |
| information_schema |
| joins              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
10 rows in set (0.01 sec)

mysql> use joins;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table orders(order_id int,cust_id int,order_name varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into orders(order_id,cust_id,order_name)values
    -> (1,1001,"shoes"),
    -> (2,1002,"smartwatch"),
    -> (3,1003,"backpack"),
    -> (4,1004,"earphones"),
    -> (5,1005,"waterbottle");
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> create table customers(cust_id int,cust_name varchar(30),cust_city varchar(10));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into customers(cust_id,cust_name,cust_city)values
    -> (1001,"Steve Smith","Sydney"),
    -> (1003,"David Warner","London"),
    -> (1005,"Ricky Ponting","Tokyo"),
    -> (1007,"Mitchell Starc","California"),
    -> (1009,"Pat Cummins","Perth");
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+---------+-------------+
| order_id | cust_id | order_name  |
+----------+---------+-------------+
|        1 |    1001 | shoes       |
|        2 |    1002 | smartwatch  |
|        3 |    1003 | backpack    |
|        4 |    1004 | earphones   |
|        5 |    1005 | waterbottle |
+----------+---------+-------------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+---------+----------------+------------+
| cust_id | cust_name      | cust_city  |
+---------+----------------+------------+
|    1001 | Steve Smith    | Sydney     |
|    1003 | David Warner   | London     |
|    1005 | Ricky Ponting  | Tokyo      |
|    1007 | Mitchell Starc | California |
|    1009 | Pat Cummins    | Perth      |
+---------+----------------+------------+
5 rows in set (0.00 sec)

mysql> select orders.order_id,orders.order_name,customers.cust_name,customers.cust_city
    -> from orders INNER JOIN customers on orders.cust_id=customers.cust_id;
+----------+-------------+---------------+-----------+
| order_id | order_name  | cust_name     | cust_city |
+----------+-------------+---------------+-----------+
|        1 | shoes       | Steve Smith   | Sydney    |
|        3 | backpack    | David Warner  | London    |
|        5 | waterbottle | Ricky Ponting | Tokyo     |
+----------+-------------+---------------+-----------+
3 rows in set (0.00 sec)

mysql> select orders.order_id,orders.order_name,customers.cust_name,customers.cust_city
    -> from orders LEFT JOIN customers on orders.cust_id=customers.cust_id;
+----------+-------------+---------------+-----------+
| order_id | order_name  | cust_name     | cust_city |
+----------+-------------+---------------+-----------+
|        1 | shoes       | Steve Smith   | Sydney    |
|        2 | smartwatch  | NULL          | NULL      |
|        3 | backpack    | David Warner  | London    |
|        4 | earphones   | NULL          | NULL      |
|        5 | waterbottle | Ricky Ponting | Tokyo     |
+----------+-------------+---------------+-----------+
5 rows in set (0.00 sec)

mysql> select orders.order_id,orders.order_name,customers.cust_name,customers.cust_city 
    -> from orders RIGHT JOIN customers on orders.cust_id=customers.cust_id;
+----------+-------------+----------------+------------+
| order_id | order_name  | cust_name      | cust_city  |
+----------+-------------+----------------+------------+
|        1 | shoes       | Steve Smith    | Sydney     |
|        3 | backpack    | David Warner   | London     |
|        5 | waterbottle | Ricky Ponting  | Tokyo      |
|     NULL | NULL        | Mitchell Starc | California |
|     NULL | NULL        | Pat Cummins    | Perth      |
+----------+-------------+----------------+------------+
5 rows in set (0.00 sec)

mysql> select orders.order_id,orders.order_name,customers.cust_name,customers.cust_city
    -> from orders CROSS JOIN customers;
+----------+-------------+----------------+------------+
| order_id | order_name  | cust_name      | cust_city  |
+----------+-------------+----------------+------------+
|        5 | waterbottle | Steve Smith    | Sydney     |
|        4 | earphones   | Steve Smith    | Sydney     |
|        3 | backpack    | Steve Smith    | Sydney     |
|        2 | smartwatch  | Steve Smith    | Sydney     |
|        1 | shoes       | Steve Smith    | Sydney     |
|        5 | waterbottle | David Warner   | London     |
|        4 | earphones   | David Warner   | London     |
|        3 | backpack    | David Warner   | London     |
|        2 | smartwatch  | David Warner   | London     |
|        1 | shoes       | David Warner   | London     |
|        5 | waterbottle | Ricky Ponting  | Tokyo      |
|        4 | earphones   | Ricky Ponting  | Tokyo      |
|        3 | backpack    | Ricky Ponting  | Tokyo      |
|        2 | smartwatch  | Ricky Ponting  | Tokyo      |
|        1 | shoes       | Ricky Ponting  | Tokyo      |
|        5 | waterbottle | Mitchell Starc | California |
|        4 | earphones   | Mitchell Starc | California |
|        3 | backpack    | Mitchell Starc | California |
|        2 | smartwatch  | Mitchell Starc | California |
|        1 | shoes       | Mitchell Starc | California |
|        5 | waterbottle | Pat Cummins    | Perth      |
|        4 | earphones   | Pat Cummins    | Perth      |
|        3 | backpack    | Pat Cummins    | Perth      |
|        2 | smartwatch  | Pat Cummins    | Perth      |
|        1 | shoes       | Pat Cummins    | Perth      |
+----------+-------------+----------------+------------+
25 rows in set (0.01 sec)

mysql> create database school;
Query OK, 1 row affected (0.00 sec)

mysql> use school;
Database changed
mysql> create table student_info(id int ,name varchar(20),age int,grade varchar(1),city varchar(15));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into student_info(id,name,age,grade,city)values
    -> (1,"Joe",12,"A","New York"),
    -> (2,"Ben",14,"B","Beijing"),
    -> (3,"James",14,"D","Moscow"),
    -> (4,"Stuart",16,"C","Mexico"),
    -> (5,"Sam",13,"B","Paris"),
    -> (6,"Jonny",11,"A","Madrid");
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> desc student_info;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
| grade | varchar(1)  | YES  |     | NULL    |       |
| city  | varchar(15) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from student_info;
+------+--------+------+-------+----------+
| id   | name   | age  | grade | city     |
+------+--------+------+-------+----------+
|    1 | Joe    |   12 | A     | New York |
|    2 | Ben    |   14 | B     | Beijing  |
|    3 | James  |   14 | D     | Moscow   |
|    4 | Stuart |   16 | C     | Mexico   |
|    5 | Sam    |   13 | B     | Paris    |
|    6 | Jonny  |   11 | A     | Madrid   |
+------+--------+------+-------+----------+
6 rows in set (0.00 sec)

mysql> select * from student_info where age > (select age from student_info where id=5);
+------+--------+------+-------+---------+
| id   | name   | age  | grade | city    |
+------+--------+------+-------+---------+
|    2 | Ben    |   14 | B     | Beijing |
|    3 | James  |   14 | D     | Moscow  |
|    4 | Stuart |   16 | C     | Mexico  |
+------+--------+------+-------+---------+
3 rows in set (0.00 sec)

mysql> select * from student_info where id IN (2,6);
+------+-------+------+-------+---------+
| id   | name  | age  | grade | city    |
+------+-------+------+-------+---------+
|    2 | Ben   |   14 | B     | Beijing |
|    6 | Jonny |   11 | A     | Madrid  |
+------+-------+------+-------+---------+
2 rows in set (0.00 sec)

mysql> select * from student_info where id BETWEEN 2 AND 6;
+------+--------+------+-------+---------+
| id   | name   | age  | grade | city    |
+------+--------+------+-------+---------+
|    2 | Ben    |   14 | B     | Beijing |
|    3 | James  |   14 | D     | Moscow  |
|    4 | Stuart |   16 | C     | Mexico  |
|    5 | Sam    |   13 | B     | Paris   |
|    6 | Jonny  |   11 | A     | Madrid  |
+------+--------+------+-------+---------+
5 rows in set (0.00 sec)

mysql> create view view1 as select name,age,city from student_info;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from view1;
+--------+------+----------+
| name   | age  | city     |
+--------+------+----------+
| Joe    |   12 | New York |
| Ben    |   14 | Beijing  |
| James  |   14 | Moscow   |
| Stuart |   16 | Mexico   |
| Sam    |   13 | Paris    |
| Jonny  |   11 | Madrid   |
+--------+------+----------+
6 rows in set (0.00 sec)

mysql> alter view view1 as select name,age,city from student_info where age=14;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from view1;
+-------+------+---------+
| name  | age  | city    |
+-------+------+---------+
| Ben   |   14 | Beijing |
| James |   14 | Moscow  |
+-------+------+---------+
2 rows in set (0.00 sec)

mysql> rename table view1 to student_view;
Query OK, 0 rows affected (0.01 sec)

mysql> desc view1;
ERROR 1146 (42S02): Table 'school.view1' doesn't exist
mysql> desc student_view;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
| city  | varchar(15) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> 
