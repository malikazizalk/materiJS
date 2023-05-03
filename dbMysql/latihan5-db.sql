-- latihan tgl 3 mei 2023

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| db_penugasan       |
| dbtoko             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.075 sec)

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.nama as jenis FROM jenis_produk INNER JOIN produk
    -> ON produk.jenis_produk_id = jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
5 rows in set (0.126 sec)

MariaDB [dbtoko]> SHOW tables;
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
9 rows in set (0.036 sec)

MariaDB [dbtoko]> desc produk;
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
8 rows in set (0.059 sec)

MariaDB [dbtoko]> SELECT p.*, j.nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
5 rows in set (0.002 sec)

MariaDB [dbtoko]> SELECT p.*, j. nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko]> CREATE VIEW detail_produk_vw AS
    -> SELECT p.*, j. nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;
Query OK, 0 rows affected (0.032 sec)

MariaDB [dbtoko]> SELECT * FROM detail_produk_vw;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
5 rows in set (0.005 sec)

MariaDB [dbtoko]> CREATE VIEW tampil_produk AS SELECT nama FROM produk;
Query OK, 0 rows affected (0.022 sec)

MariaDB [dbtoko]> SELECT * FROM tampil_produk;
+------------+
| nama       |
+------------+
| TV         |
| TV 21 Inch |
| Kulkas     |
| Meja Makan |
| Taro       |
+------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko]> SHOW FULL TABLES;
+------------------+------------+
| Tables_in_dbtoko | Table_type |
+------------------+------------+
| detail_produk_vw | VIEW       |
| jenis_produk     | BASE TABLE |
| kartu            | BASE TABLE |
| pelanggan        | BASE TABLE |
| pembayaran       | BASE TABLE |
| pembelian        | BASE TABLE |
| pesanan          | BASE TABLE |
| pesanan_items    | BASE TABLE |
| produk           | BASE TABLE |
| tampil_produk    | VIEW       |
| vendor           | BASE TABLE |
+------------------+------------+
11 rows in set (0.096 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
Empty set (0.042 sec)

MariaDB [dbtoko]> START TRANSACTION;
Query OK, 0 rows affected (0.046 sec)

MariaDB [dbtoko]> INSERT INTO pesanan(tanggal, total,
pelanggan_id) VALUES
    -> (01-02-2023, 200000, 1);
Query OK, 1 row affected, 1 warning (0.049 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> COMMIT;
Query OK, 0 rows affected (0.032 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> DELETE FROM pesanan;
Query OK, 1 row affected (0.028 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
Empty set (0.001 sec)

MariaDB [dbtoko]> ROLLBACK;
Query OK, 0 rows affected (0.041 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> SAVEPOINT update_tanggal;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> UPDATE pesanan SET tanggal='2023-03-03' WHERE id = 1;
Query OK, 1 row affected (0.030 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> COMMIT;
Query OK, 0 rows affected (0.031 sec)


-- membuat fungsi show
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM produk;
    -> $$
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.001 sec)


MariaDB [dbtoko]> CREATE PROCEDURE showProduks()
    -> BEGIN
    -> SELECT nama, harga_beli, harga_jual FROM produk;
    -> END
    -> $$
Query OK, 0 rows affected (0.065 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL showProduks();
+------------+------------+------------+
| nama       | harga_beli | harga_jual |
+------------+------------+------------+
| TV         |    3000000 |    4000000 |
| TV 21 Inch |    2000000 |    3000000 |
| Kulkas     |    4000000 |    5000000 |
| Meja Makan |    1000000 |    2000000 |
| Taro       |       4000 |       5000 |
+------------+------------+------------+
5 rows in set (0.033 secd\c)

Query OK, 0 rows affected (0.037 sec)


-- membuat fungsi input
MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE addPesanan(tanggal
date, total double, pelanggan_id int)
    -> BEGIN
    -> INSERT INTO pesanan (tanggal, total, pelanggan_id) VALUES (tanggal, total, pelanggan_id);
    -> END$$
Query OK, 0 rows affected (0.035 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL addPesanan('2022-02-02',30000,1);
Query OK, 1 row affected (0.041 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko]> SHOW PROCEDURE STATUS;
+--------+-------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db     | Name        | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+--------+-------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| dbtoko | addPesanan  | PROCEDURE | root@localhost | 2023-05-03 11:26:10 | 2023-05-03 11:26:10 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_general_ci |
| dbtoko | showProduks | PROCEDURE | root@localhost | 2023-05-03 11:16:34 | 2023-05-03 11:16:34 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_general_ci |
+--------+-------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
2 rows in set (0.042 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE addJneis_produk(nama varchar(20), ket varchar(50))
    -> BEGIN
    -> INSERT INTO jenis_produk(nama, ket) VALUES (nama, ket);
    -> END$$
Query OK, 0 rows affected (0.051 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE addJenis_produk(nam
a varchar(20), ket varchar(50))
    -> BEGIN
    -> INSERT INTO jenis_produk(nama, ket) VALUES (nama, ket);
    -> END$$
Query OK, 0 rows affected (0.057 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL addJenis_produk('alat kebersihan','tersedia');
Query OK, 1 row affected (0.042 sec)

MariaDB [dbtoko]> SELECT * FROM jenis_produk;
+----+-----------------+----------------+
| id | nama            | ket            |
+----+-----------------+----------------+
|  1 | elektronik      | tersedia       |
|  2 | makanan         | tersedia       |
|  3 | minuman         | tidak tersedia |
|  4 | furnitur        | tersedia       |
|  5 | alat kebersihan | tersedia       |
+----+-----------------+----------------+
5 rows in set (0.000 sec)

