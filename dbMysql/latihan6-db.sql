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
7 rows in set (0.071 sec)

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show tables;
+-------------------+
| Tables_in_dbtoko  |
+-------------------+
| detail_produk_vw  |
| jenis_produk      |
| kartu             |
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
12 rows in set (0.021 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.114 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
|  3 | 2021-01-01 | 150000 |            2 |
+----+------------+--------+--------------+
3 rows in set (0.033 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan_items;
Empty set (0.057 sec)

MariaDB [dbtoko]> DESC pesanan_items;
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| id         | int(11) | NO   | PRI | NULL    | auto_increment |
| produk_id  | int(11) | NO   |     | NULL    |                |
| pesanan_id | int(11) | NO   |     | NULL    |                |
| qty        | int(11) | YES  |     | NULL    |                |
| harga      | double  | YES  |     | NULL    |                |
+------------+---------+------+-----+---------+----------------+
5 rows in set (0.057 sec)

MariaDB [dbtoko]> INSERT INTO pesanan_items VALUES
    -> ('',1,1,2,30000),
    -> ('',2,2,2,30000);
Query OK, 2 rows affected, 2 warnings (0.022 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+-------+
| id | produk_id | pesanan_id | qty  | harga |
+----+-----------+------------+------+-------+
|  1 |         1 |          1 |    2 | 30000 |
|  2 |         2 |          2 |    2 | 30000 |
+----+-----------+------------+------+-------+
2 rows in set (0.000 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER keranjang_pesanan_items BEFORE INSERT ON pesanan_items
    -> FOR EACH ROW
    -> BEGIN
    -> SET @stok = (SELECT stok FROM produk WHERE id =  NEW.produk_id);
    -> SET @sisa = @stok - NEW.qty;
    -> IF @sisa < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
    -> END IF;
    -> UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
    -> END
    -> $$
Query OK, 0 rows affected (0.077 sec)

MariaDB [dbtoko]> show triggers;
    -> $$
+-------------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                 | Event  | Table         | Statement
| Timing 
| Created                
| sql_mode
| Definer        
| character_set_client 
| collation_connection    | Database Collation |
+-------------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| keranjang_pesanan_items | INSERT 
| pesanan_items           | BEGIN
SET @stok = (SELECT stok FROM produk WHERE id =  NEW.produk_id);
SET @sisa = @stok - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
END | BEFORE | 2023-05-04 10:01:18.45 
| NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION | root@localhost 
| cp850                
| cp850_general_ci     
| utf8mb4_general_ci |
+-------------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
1 row in set (0.076 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+-------+
| id | produk_id | pesanan_id | qty  | harga |
+----+-----------+------------+------+-------+
|  1 |         1 |          1 |    2 | 30000 |
|  2 |         2 |          2 |    2 | 30000 |
+----+-----------+------------+------+-------+
2 rows in set (0.067 sec)

MariaDB [dbtoko]> INSERT INTO pesanan_items (produk_id, pesanan_id, qty, harga) VALUES
    -> (3, 2, 3, 5000000);
Query OK, 1 row affected (0.018 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    2 |   30000 |
|  2 |         2 |          2 |    2 |   30000 |
|  3 |         3 |          2 |    3 | 5000000 |
+----+-----------+------------+------+---------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |    7 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.033 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    2 |   30000 |
|  2 |         2 |          2 |    2 |   30000 |
|  3 |         3 |          2 |    3 | 5000000 |
+----+-----------+------------+------+---------+
3 rows in set (0.051 sec)

MariaDB [dbtoko]> UPDATE pesanan_items SET qty
= 1 WHERE id = 3;
Query OK, 1 row affected (0.033 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER transaksi_update_before BEFORE UPDATE ON pesanan_items
    -> FOR EACH ROW
    -> BEGIN
    -> IF OLD.id = NEW.produk_id THEN
    -> SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
    -> SET @sisa = (@stok + OLD.qty) - NEW.qty;
    -> IF @sisa < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
    -> END IF;
    -> UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
    -> ELSE
    -> SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
    -> SET @sisa_lama = (@stok_lama + OLD.qty);
    -> UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
    -> SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
    -> SET @sisa_baru = @stok_baru - NEW.qty;
    -> IF @sisa_baru < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak tersedia';
    -> END IF;
    -> UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.058 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
    -> $$
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |    7 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    2 |   30000 |
|  2 |         2 |          2 |    2 |   30000 |
|  3 |         3 |          2 |    1 | 5000000 |
+----+-----------+------------+------+---------+
3 rows in set (0.040 sec)

MariaDB [dbtoko]> UPDATE pesanan_items SET qty
= 2 WHERE id = 3;
Query OK, 1 row affected (0.029 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |    6 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    2 |   30000 |
|  2 |         2 |          2 |    2 |   30000 |
|  3 |         3 |          2 |    2 | 5000000 |
+----+-----------+------------+------+---------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> UPDATE pesanan_items SET qty = 1 WHERE id = 3;
Query OK, 1 row affected (0.054 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    2 |   30000 |
|  2 |         2 |          2 |    2 |   30000 |
|  3 |         3 |          2 |    1 | 5000000 |
+----+-----------+------------+------+---------+
3 rows in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |    7 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]>









