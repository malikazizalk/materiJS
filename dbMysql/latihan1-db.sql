-- //masuk ke dalam mariaDB dengan cmd prompt xampp
-- C:\xampp\mysql\bin>mysql -u root -p
-- //untuk melihat seluruh database
-- MariaDB [(none)]> show databases;
-- //membuat database baru, query bisa juga dipanggil dengan huruf kecil contoh create databases
-- MariaDB [(none)]> CREATE DATABASE dbtoko;
-- //memakai databases
-- MariaDB [(none)]> USE dbtoko;
-- //membuat table dan nama table serta tipe data yang dipakai di tiap kolom
-- MariaDB [dbtoko]> CREATE TABLE kartu(
--     -> id int NOT NULL auto_increment primary key,
--     -> kode varchar(10) unique,
--     -> nama varchar(30) NOT NULL,
--     -> diskon double default 0,
--     -> iuran double default 0)
--     -> ;
-- //melihat table
-- MariaDB [dbtoko]> show tables;
-- //melihat isi dari table
-- MariaDB [dbtoko]> DESC kartu;


-- senin 10 april

MariaDB [(none)]> show databases;
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
6 rows in set (0.041 sec)

MariaDB [(none)]> use dbtoko
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
9 rows in set (0.011 sec)

MariaDB [dbtoko]> desc kartu;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode   | varchar(10) | YES  | UNI | NULL    |                |
| nama   | varchar(30) | NO   |     | NULL    |                |
| diskon | double      | YES  |     | 0       |                |
| iuran  | double      | YES  |     | 0       |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.071 sec)

MariaDB [dbtoko]> INSERT INTO kartu Values
    -> ('','10111','Gold',20000,2000),
    -> ('','10112','Silver',15000,1500)
    -> ;
Query OK, 2 rows affected, 2 warnings (0.131 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [dbtoko]> select * from kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 10112 | Silver |  15000 |  1500 |
+----+-------+--------+--------+-------+
2 rows in set (0.019 sec)

MariaDB [dbtoko]> INSERT INTO kartu (kode,nama,diskon,iuran) VALUES
    -> ('10113','Bronze',10000,1000)
    -> ;
Query OK, 1 row affected (0.030 sec)

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 10112 | Silver |  15000 |  1500 |
|  3 | 10113 | Bronze |  10000 |  1000 |
+----+-------+--------+--------+-------+
3 rows in set (0.015 sec)

MariaDB [dbtoko]> SELECT nama FROM kartu;
+--------+
| nama   |
+--------+
| Gold   |
| Silver |
| Bronze |
+--------+
3 rows in set (0.031 sec)

MariaDB [dbtoko]> UPDATE kartu SET
    -> nama='Platinum'
    -> WHERE id = 3
    -> ;
Query OK, 1 row affected (0.061 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+----------+--------+-------+
| id | kode  | nama     | diskon | iuran |
+----+-------+----------+--------+-------+
|  1 | 10111 | Gold     |  20000 |  2000 |
|  2 | 10112 | Silver   |  15000 |  1500 |
|  3 | 10113 | Platinum |  10000 |  1000 |
+----+-------+----------+--------+-------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> DELETE FROM kartu WHERE id = 3;
Query OK, 1 row affected (0.031 sec)

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 10112 | Silver |  15000 |  1500 |
+----+-------+--------+--------+-------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO kartu (kode,nama,diskon,iuran) VALUES
    -> ('10113','Bronze',10000,1000)
    -> ;
Query OK, 1 row affected (0.041 sec)

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 10112 | Silver |  15000 |  1500 |
|  4 | 10113 | Bronze |  10000 |  1000 |
+----+-------+--------+--------+-------+
3 rows in set (0.001 sec)