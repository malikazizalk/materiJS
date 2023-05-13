hari jumat 12 mei 2023

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show databases;
+--------------------+
| Database           |
+--------------------+
| db_penugasan       |
| dbtoko             |
| dbtoko2            |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
8 rows in set (0.049 sec)

MariaDB [dbtoko]> show tables;
+-------------------+
| Tables_in_dbtoko  |
+-------------------+
| detail_produk_vw  |
| jenis_produk      |
| kartu             |
| member            |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| pesanan_produk_vw |
| produk            |
| tampil_produk     |
| vendor            |
+-------------------+
13 rows in set (0.020 sec)

MariaDB [dbtoko]> select * from;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [dbtoko]> select * from member;
+----+----------+----------+--------------------------------+---------+-------------+
| id | fullname | username | password
              | role    | foto        |
+----+----------+----------+--------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0 | admin   | admin.jpg   |
|  2 | Siti     | siti     | b48d66e55c41b0abb8c540b518f2e2 | manager | manager.jpg |
|  3 | Staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3 | staff   | staff.jpg   |
+----+----------+----------+--------------------------------+---------+-------------+
3 rows in set (0.005 sec)

MariaDB [dbtoko]> select * from member where
    -> username = 'admin' and
    -> password = SHA1(MD5('mimin'));
ERROR 2006 (HY000): MySQL server has gone awayNo connection. Trying to reconnect...
Connection id:    26
Current database: dbtoko

Empty set (0.072 sec)

MariaDB [dbtoko]> select * from member where
    -> username = 'admin' and
    -> password = SHA1(MD5('mimin'));
Empty set (0.001 sec)

MariaDB [dbtoko]> select * from member where username = 'admin';
+----+----------+----------+--------------------------------+-------+-----------+
| id | fullname | username | password
              | role  | foto      |
+----+----------+----------+--------------------------------+-------+-----------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0 | admin | admin.jpg |
+----+----------+----------+--------------------------------+-------+-----------+
1 row in set (0.003 sec)

MariaDB [dbtoko]> desc member;
+----------+---------------------------------+------+-----+---------+----------------+
| Field    | Type                            | Null | Key | Default | Extra          |
+----------+---------------------------------+------+-----+---------+----------------+
| id       | int(11)                         | NO   | PRI | NULL    | auto_increment |
| fullname | varchar(30)                     | NO   |     | NULL    |                |
| username | varchar(30)                     | NO   | UNI | NULL    |                |
| password | varchar(30)                     | NO   |     | NULL    |                |
| role     | enum('admin','manager','staff') | NO   |     | NULL    |                |
| foto     | varchar(30)                     | YES  |     | NULL    |                |
+----------+---------------------------------+------+-----+---------+----------------+
6 rows in set (0.032 sec)

MariaDB [dbtoko]> ALTER TABLE member MODIFY password varchar(50) NOT NULL;
Query OK, 0 rows affected (0.041 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> INSERT INTO member (fullname, username, password, role) VALUES
    -> ('Admin1','admin1',SHA1(MD5(SHA1('admin'))),'admin'),
    -> ('Manager','manager',SHA1(MD5(SHA1('manager'))),'manager'),
    -> ('Staff','staff1',SHA1(MD5(SHA1('staff'))),'staff');
Query OK, 3 rows affected (0.050 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> select * from member;
+----+----------+----------+------------------------------------------+---------+-------------+
| id | fullname | username | password
                        | role    | foto        |
+----+----------+----------+------------------------------------------+---------+-------------+
|  1 | Admin    | UPDATE  member  SET fullname = staff   WHERE   id = 3;
ERROR 1054 (42S22): Unknown column 'staff' in 'field list'aru Berkembang   WHERE   nama = Juna|
MariaDB [dbtoko]> Byeff    | 6a91eb6ae9cc8e3a67d32b286c56c3           | staff   | staff.jpg   |
Ctrl-C -- exit! | admin1   | af7e0928fcba501d8ed0385c794e690fe151bf16 | admin   | NULL        |
|  5 | Manager  | manager  | 54dd75eddaa72e610b060ae82548b2430a4dfbdc | manager | NULL        |
C:\xampp\mysql\bin>taff1   | ae186d20e1a1b46737a98ef69fc0896ba7cca385 | staff   | NULL        |
C:\xampp\mysql\bin>--------+------------------------------------------+---------+-------------+
C:\xampp\mysql\bin>0 sec)
C:\xampp\mysql\bin>
C:\xampp\mysql\bin>
C:\xampp\mysql\bin>
C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 27
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show tables;
+-------------------+
| Tables_in_dbtoko  |
+-------------------+
| detail_produk_vw  |
| jenis_produk      |
| kartu             |
| member            |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| pesanan_produk_vw |
| produk            |
| tampil_produk     |
| vendor            |
+-------------------+
13 rows in set (0.023 sec)

MariaDB [dbtoko]> select * from;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [dbtoko]> select * from member;
+----+----------+----------+------------------------------------------+---------+-------------+
| id | fullname | username | password                                 | role    | foto        |
+----+----------+----------+------------------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0           | admin   | admin.jpg   |
|  2 | Siti     | siti     | b48d66e55c41b0abb8c540b518f2e2           | manager | manager.jpg |
|  3 | Staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3           | staff   | staff.jpg   |
|  4 | Admin1   | admin1   | af7e0928fcba501d8ed0385c794e690fe151bf16 | admin   | NULL        |
|  5 | Manager  | manager  | 54dd75eddaa72e610b060ae82548b2430a4dfbdc | manager | NULL        |
|  6 | Staff    | staff1   | ae186d20e1a1b46737a98ef69fc0896ba7cca385 | staff   | NULL        |
+----+----------+----------+------------------------------------------+---------+-------------+
6 rows in set (0.039 sec)

MariaDB [dbtoko]> select * from member where
    -> username = 'admin' and
    -> password = SHA1(MD5('mimin'));
Empty set (0.001 sec)

MariaDB [dbtoko]> select * from member where
    -> username = 'admin' and
    -> password = SHA1(MD5('mimin'));
Empty set (0.001 sec)

MariaDB [dbtoko]> select * from member where username = 'admin';
+----+----------+----------+--------------------------------+-------+-----------+
| id | fullname | username | password                       | role  | foto      |
+----+----------+----------+--------------------------------+-------+-----------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0 | admin | admin.jpg |
+----+----------+----------+--------------------------------+-------+-----------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> desc member;
+----------+---------------------------------+------+-----+---------+----------------+
| Field    | Type                            | Null | Key | Default | Extra          |
+----------+---------------------------------+------+-----+---------+----------------+
| id       | int(11)                         | NO   | PRI | NULL    | auto_increment |
| fullname | varchar(30)                     | NO   |     | NULL    |                |
| username | varchar(30)                     | NO   | UNI | NULL    |                |
| password | varchar(50)                     | NO   |     | NULL    |                |
| role     | enum('admin','manager','staff') | NO   |     | NULL    |                |
| foto     | varchar(30)                     | YES  |     | NULL    |                |
+----------+---------------------------------+------+-----+---------+----------------+
6 rows in set (0.054 sec)

MariaDB [dbtoko]> ALTER TABLE member MODIFY password varchar(50) NOT NULL;
Query OK, 0 rows affected (0.035 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ('Admin1','admin1',SHA1(MD5(SHA1('admin'))),'admin'),
    -> ('Manager','manager',SHA1(MD5(SHA1('manager'))),'manager');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''Admin1','admin1',SHA1(MD5(SHA1('admin'))),'admin'),
('Manager','manager',SHA...' at line 1
MariaDB [dbtoko]> ALTER TABLE member MODIFY password varchar(50) NOT NULL;
Query OK, 0 rows affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> INSERT INTO member (fullname, username, password, role) VALUES
    -> ('Admin1','admin1',SHA1(MD5(SHA1('admin'))),'admin'),
    -> ('Manager','manager',SHA1(MD5(SHA1('manager'))),'manager'),
    -> ('Staff','staff1',SHA1(MD5(SHA1('staff'))),'staff'),
    -> '
    '> '
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''
'' at line 5
MariaDB [dbtoko]> UPDATE  member  SET fullname = staff   WHERE   id = 3;
ERROR 1054 (42S22): Unknown column 'staff' in 'field list'
MariaDB [dbtoko]> UPDATE  member  SET fullname = 'staff'   WHERE   id = 3;
Query OK, 1 row affected (0.046 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> select * from member;
+----+----------+----------+------------------------------------------+---------+-------------+
| id | fullname | username | password                                 | role    | foto        |
+----+----------+----------+------------------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0           | admin   | admin.jpg   |
|  2 | Siti     | siti     | b48d66e55c41b0abb8c540b518f2e2           | manager | manager.jpg |
|  3 | staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3           | staff   | staff.jpg   |
|  4 | Admin1   | admin1   | af7e0928fcba501d8ed0385c794e690fe151bf16 | admin   | NULL        |
|  5 | Manager  | manager  | 54dd75eddaa72e610b060ae82548b2430a4dfbdc | manager | NULL        |
|  6 | Staff    | staff1   | ae186d20e1a1b46737a98ef69fc0896ba7cca385 | staff   | NULL        |
+----+----------+----------+------------------------------------------+---------+-------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE  member  SET fullname = 'Staff1'   WHERE   id = 6;
Query OK, 1 row affected (0.012 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> select * from member;
+----+----------+----------+------------------------------------------+---------+-------------+
| id | fullname | username | password
                        | role    | foto        |
+----+----------+----------+------------------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0           | admin   | admin.jpg   |
|  2 | Siti     | siti     | b48d66e55c41b0abb8c540b518f2e2           | manager | manager.jpg |
|  3 | staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3           | staff   | staff.jpg   |
|  4 | Admin1   | admin1   | af7e0928fcba501d8ed0385c794e690fe151bf16 | admin   | NULL        |
|  5 | Manager  | manager  | 54dd75eddaa72e610b060ae82548b2430a4dfbdc | manager | NULL        |
|  6 | Staff1   | staff1   | ae186d20e1a1b46737a98ef69fc0896ba7cca385 | staff   | NULL        |
+----+----------+----------+------------------------------------------+---------+-------------+
6 rows in set (0.025 sec)
