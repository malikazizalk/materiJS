-- C:\Users\aziza>cd\xampp\mysql\bin

-- C:\xampp\mysql\bin>mysql -u root -p
-- Enter password:
-- ERROR 2002 (HY000): Can't connect to MySQL server on 'localhost' (10061)

-- C:\xampp\mysql\bin>mysql -u root -p
-- Enter password:
-- Welcome to the MariaDB monitor.  Commands end with ; or \g.
-- Your MariaDB connection id is 8
-- Server version: 10.4.27-MariaDB mariadb.org binary distribution

-- Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

-- Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> Show databases;
+--------------------+
| Database           |
+--------------------+
| dbtoko             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.051 sec)

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show tables;
+------------------+
| Tables_in_dbtoko |
+------------------+
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_items    |
| produk           |
| vendor           |
+------------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko]> desc pelanggan
    -> ;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.090 sec)

MariaDB [dbtoko]> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id) VALUES
    -> ('011102','Pandan Wangi','L','Yogyakarta','1997-08-07','pandan@gmail.com',2),
    -> ('011103','Sekar','P','Kediri','2001-09-06','sekar@gmail.com',1),
    -> ('011104','Suandi','L','Kediri','1997-09-08','suandi@gmail.com',1),
    -> ('011105','Pradana','L','Jakarta','2001-08-01','pradana@gmail.com',1),
    -> ('011106','Gayarti','P','Jakarta','2002-09-01','gayatri@gmail.com',2)
    -> ;
Query OK, 5 rows affected (0.008 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        1 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.027 sec)

MariaDB [dbtoko]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.050 sec)

MariaDB [dbtoko]> ALTER TABLE jenis_produk ADD ket varchar(50);
Query OK, 0 rows affected (0.062 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(50) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.011 sec)

-- MariaDB [dbtoko]> INSERT INTO jenis_produk (nama, ket) VALUES
--     -> ('elektronik','tersedia'),
--     -> ('makanan','tersedia),
--     '> ('minuman','tidak tersedia'),
--     '> ('furnitur','tersedia');
--     '> ;
--     '> Bye
-- Ctrl-C -- exit!

-- C:\xampp\mysql\bin>mysql -u root -p
-- Enter password:
-- Welcome to the MariaDB monitor.  Commands end with ; or \g.
-- Your MariaDB connection id is 9
-- Server version: 10.4.27-MariaDB mariadb.org binary distribution

-- Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

-- Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show tables;
+------------------+
| Tables_in_dbtoko |
+------------------+
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_items    |
| produk           |
| vendor           |
+------------------+
9 rows in set (0.028 sec)

MariaDB [dbtoko]> show tables;
+------------------+
| Tables_in_dbtoko |
+------------------+
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_items    |
| produk           |
| vendor           |
+------------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(50) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.047 sec)

MariaDB [dbtoko]> INSERT INTO jenis_produk (nama, ket) VALUES
    -> ('elektronik','tersedia'),
    -> ('makanan','tersedia'),
    -> ('minuman','tidak tersedia'),
    -> ('furnitur','tersedia')
    -> ;
Query OK, 4 rows affected (0.078 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(50) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.029 sec)

MariaDB [dbtoko]> SELECT * FROM jenis_produk;
+----+------------+----------------+
| id | nama       | ket            |
+----+------------+----------------+
|  1 | elektronik | tersedia       |
|  2 | makanan    | tersedia       |
|  3 | minuman    | tidak tersedia |
|  4 | furnitur   | tersedia       |
+----+------------+----------------+
4 rows in set (0.002 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        1 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.031 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=2 WHERE kode='011105';
Query OK, 1 row affected (0.055 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=1 WHERE kode='011106';
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=2 WHERE kode='011102' OR jk='P' OR tgl_lahir='1998-08-07';
Query OK, 2 rows affected (0.011 sec)
Rows matched: 3  Changed: 2  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=2 WHERE kode='011102' OR jk='P' OR tgl_lahir='1998-08-07';
Query OK, 0 rows affected (0.001 sec)
Rows matched: 3  Changed: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET jk='L' WHERE kode='011101' OR tgl_lahir='1997-09-06';
Query OK, 0 rows affected (0.047 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-08-07 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET tgl_lahir='1997-09-06' WHERE kode='011101';
Query OK, 1 row affected (0.038 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | L    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-06 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET tgl_lahir='2001-09-08' WHERE kode='011103';
Query OK, 1 row affected (0.043 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pelanggan SET jk='P' WHERE kode='011102';
Query OK, 1 row affected (0.046 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=2 WHERE kode='011103';
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=1 WHERE kode='011103';
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET kartu_id=1 WHERE kode='011106';
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayarti        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM jenis_produk;
+----+------------+----------------+
| id | nama       | ket            |
+----+------------+----------------+
|  1 | elektronik | tersedia       |
|  2 | makanan    | tersedia       |
|  3 | minuman    | tidak tersedia |
|  4 | furnitur   | tersedia       |
+----+------------+----------------+
4 rows in set (0.043 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET nama_pelanggan='Gayatri Putri' WHERE id='6';
Query OK, 1 row affected (0.019 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE pelanggan SET tmp_lahir='Jakarta' WHERE nama_pelanggan='Suandi';
Query OK, 1 row affected (0.051 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> desc produk
    -> ;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id              | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode            | varchar(10) | YES  | UNI | NULL    |                |
| nama            | varchar(45) | YES  |     | NULL    |                |
| harga_beli      | double      | YES  |     | NULL    |                |
| harga_jual      | double      | YES  |     | NULL    |                |
| stok            | int(11)     | YES  |     | NULL    |                |
| min_stok        | int(11)     | YES  |     | NULL    |                |
| jenis_produk_id | int(11)     | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.049 sec)

MariaDB [dbtoko]> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
    -> ('1111','TV',3000000,4000000,3,2,1);
Query OK, 1 row affected (0.006 sec)

MariaDB [dbtoko]> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
    -> ('1112','TV 21 Inch',2000000,3000000,10,3,1),
    -> ('1113','Kulkas',4000000,5000000,10,3,1),
    -> ('1114','Meja Makan',1000000,2000000,4,2,4),
    -> ('1115','Taro',4000,5000,3,2,2);
Query OK, 4 rows affected (0.049 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | 1112 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | 1113 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | 1115 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.029 sec)

MariaDB [dbtoko]> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
    -> ('1116','Teh Kotak',3000,4000,2,10,3);
Query OK, 1 row affected (0.030 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | 1112 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | 1113 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | 1115 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | 1116 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> UPDATE produk SET kode = 'TV01' WHERE id = 1;
Query OK, 1 row affected (0.025 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'TV02' WHERE id = 2;
Query OK, 1 row affected (0.032 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'K001' WHERE id = 3;
Query OK, 1 row affected (0.047 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'M001' WHERE id = 4;
Query OK, 1 row affected (0.040 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'T001' WHERE id = 5;
Query OK, 1 row affected (0.034 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'TK01' WHERE id = 6;
Query OK, 1 row affected (0.039 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT kode, nama, tmp_lahir, tgl_lahir FROM pelanggan;
ERROR 1054 (42S22): Unknown column 'nama' in 'field list'
MariaDB [dbtoko]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1997-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE stok=4;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.038 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakaarta';
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir_ FROM pelanggan ORDER BY tgl_lahir DESC;
ERROR 1054 (42S22): Unknown column 'tgl_lahir_' in 'field list'
MariaDB [dbtoko]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1997-08-07 |
+--------+----------------+------------+------------+
6 rows in set (0.021 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE stok=3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.027 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.016 sec)

MariaDB [dbtoko]> SELECT * FROM produk kode LIKE 'K%' OR kode LIKE 'M%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'LIKE 'K%' OR kode LIKE 'M%'' at line 1
MariaDB [dbtoko]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.041 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan LIMIT 2 OFFSET 4;
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
2 rows in set (0.036 sec)

MariaDB [dbtoko]> SELECT * FROM produk ORDER BY haarga-beli DESC LIMIT 2;
ERROR 1054 (42S22): Unknown column 'haarga' in 'order clause'
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga-beli DESC LIMIT 2;
ERROR 1054 (42S22): Unknown column 'harga' in 'order clause'
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 3;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.001 sec)
