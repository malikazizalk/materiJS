MariaDB [(none)]> SHOW DATABASES;
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
6 rows in set (0.038 sec)

MariaDB [(none)]> USE dbtoko;
Database changed
MariaDB [dbtoko]> SHOW TABLES;
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
9 rows in set (0.046 sec)

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
6 rows in set (0.092 sec)

MariaDB [dbtoko]> SELECT COUNT(*) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|          6 |
+------------+
1 row in set (0.038 sec)

MariaDB [dbtoko]> SELECT COUNT(*) AS harga_beli FROM produk WHERE harga_beli > 4000;
+------------+
| harga_beli |
+------------+
|          4 |
+------------+
1 row in set (0.034 sec)

MariaDB [dbtoko]> SELECT MAX(harga_beli) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|    4000000 |
+------------+
1 row in set (0.038 sec)

MariaDB [dbtoko]> SELECT MIN(harga_beli) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|       3000 |
+------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT AVG(harga_beli) AS harga_rata2 FROM produk;
+--------------------+
| harga_rata2        |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT SUM(harga_beli) AS jml_harga_beli FROM produk;
+----------------+
| jml_harga_beli |
+----------------+
|       10007000 |
+----------------+
1 row in set (0.020 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE stok = (SELECT MAX(stok) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.040 sec)

MariaDB [dbtoko]> SELECT DISTINCT stok FROM produk;
+------+
| stok |
+------+
|    3 |
|   10 |
|    4 |
|    2 |
+------+
4 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT kode, nama, stok,
    -> CASE
    -> WHEN stok >= 3 THEN 'cukup'
    -> ELSE 'kurang'
    -> END AS keterangan
    -> FROM produk;
+------+------------+------+------------+
| kode | nama       | stok | keterangan |
+------+------------+------+------------+
| TV01 | TV         |    3 | cukup      |
| TV02 | TV 21 Inch |   10 | cukup      |
| K001 | Kulkas     |   10 | cukup      |
| M001 | Meja Makan |    4 | cukup      |
| T001 | Taro       |    3 | cukup      |
| TK01 | Teh Kotak  |    2 | kurang     |
+------+------------+------+------------+
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
4 rows in set (0.038 sec)

MariaDB [dbtoko]> SELECT
    -> CASE
    -> WHEN jenis_produk_id =1 THEN 'elektronik'
    -> WHEN jenis_produk_id =2 THEN 'makanan'
    -> WHEN jenis_produk_id =3 THEN 'minuman'
    -> WHEN jenis_produk_id =4 THEN 'furnitur'
    -> END AS kategori, SUM(stok) AS jumlah FROM p
roduk GROUP BY jenis_produk_id;
+------------+--------+
| kategori   | jumlah |
+------------+--------+
| elektronik |     23 |
| makanan    |      3 |
| minuman    |      2 |
| furnitur   |      4 |
+------------+--------+
4 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT jenis_produk_id, SUM(stok) 
AS total_stok FROM produk GROUP BY jenis_produk_
id;
+-----------------+------------+
| jenis_produk_id | total_stok |
+-----------------+------------+
|               1 |         23 |
|               2 |          3 |
|               3 |          2 |
|               4 |          4 |
+-----------------+------------+
4 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT stok, SUM(stok) AS jml_stok FROM produk
    -> GROUP BY stok HAVING SUM(stok) > 2;
+------+----------+
| stok | jml_stok |
+------+----------+
|    3 |        6 |
|    4 |        4 |
|   10 |       20 |
+------+----------+
3 rows in set (0.031 sec)

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

MariaDB [dbtoko]> SELECT SUM(harga_beli * stok) AS total_aset FROM produk;
+------------+
| total_aset |
+------------+
|   73018000 |
+------------+
1 row in set (0.035 sec)

MariaDB [dbtoko]> SELECT SUM(stok - min_stok) AS selisih FROM produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+
1 row in set (0.032 sec)

MariaDB [dbtoko]> SELECT SUM(stok) AS total_jml_aset FROM produk;
+----------------+
| total_jml_aset |
+----------------+
|             32 |
+----------------+
1 row in set (0.001 sec)

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
6 rows in set (0.017 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan 
WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
3 rows in set (0.023 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan 
WHERE YEAR(tgl_lahir) = 1997;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com  |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
3 rows in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan 
WHERE MONTH(tgl_lahir) = 08;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 0000-00-00 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan 
WHERE YEAR(tgl_lahir) = 1998;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM produk 
WHERE harga_beli * stok > 2000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.032 sec)

MariaDB [dbtoko]> SELECT * FROM produk 
WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> SELECT nama_pelanggan, tmp_lahir, 
tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur
 FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.046 sec)

MariaDB [dbtoko]> SELECT nama_pelanggan, tmp_lahir, 
tgl_lahir, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.004 sec)

SELECT id_pelanggan, nama_pelanggan, tahun_lahir, 
TIMESTAMPDIFF(YEAR, tahun_lahir, CURDATE()) as umur FROM pelanggan 
WHERE TIMESTAMPDIFF(YEAR, tahun_lahir, CURDATE()) < 
(SELECT AVG(TIMESTAMPDIFF(YEAR, tahun_lahir, CURDATE())) FROM pelanggan);
