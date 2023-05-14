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
9 rows in set (0.027 sec)

MariaDB [dbtoko]> DESC produk;
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
8 rows in set (0.054 sec)

MariaDB [dbtoko]> DESC jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(50) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.034 sec)

MariaDB [dbtoko]> Select produk.*, jenis_produk.* FROM produk INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+----+------------+----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | id | nama       | ket            |
+----+------+------------+------------+------------+------+----------+-----------------+----+------------+----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |  1 | elektronik | tersedia       |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |  1 | elektronik | tersedia       |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |  1 | elektronik | tersedia       |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |  4 | furnitur   | tersedia       |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |  2 | makanan    | tersedia       |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |  3 | minuman    | tidak tersedia |
+----+------+------------+------------+------------+------+----------+-----------------+----+------------+----------------+
6 rows in set (0.034 sec)

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]>  SELECT * FROM jenis_produk;
+----+------------+----------------+
| id | nama       | ket            |
+----+------------+----------------+
|  1 | elektronik | tersedia       |
|  2 | makanan    | tersedia       |
|  3 | minuman    | tidak tersedia |
|  4 | furnitur   | tersedia       |
+----+------------+----------------+
4 rows in set (0.001 sec)

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
6 rows in set (0.002 sec)

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk LEFT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.030 sec)

ERROR: No query specified

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk LEFT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman    |
+----+------+------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk RIGHT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+------+------+------------+------------+------------+------+----------+-----------------+------------+
| id   | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+------+------+------------+------------+------------+------+----------+-----------------+------------+
|    1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|    2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|    3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|    4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|    5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
|    6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman    |
+------+------+------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.053 sec)

MariaDB [dbtoko]> DELETE FROM produk WHERE id=6;
Query OK, 1 row affected (0.040 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
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

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk RIGHT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+------+------+------------+------------+------------+------+----------+-----------------+------------+
| id   | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+------+------+------------+------------+------------+------+----------+-----------------+------------+
|    1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronik |
|    2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronik |
|    3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronik |
|    4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 | furnitur   |
|    5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan    |
| NULL | NULL | NULL       |       NULL |       NULL | NULL |     NULL |            NULL | minuman    |
+------+------+------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> Select produk.*, jenis_produk.nama AS jenis FROM produk LEFT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
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

MariaDB [dbtoko]> SELECT jenis_produk.nama AS kategori, SUM(produk.stok) AS total_stok FROM jenis_produk
    -> LEFT JOIN produk ON jenis_produk.id = produk.jenis_prodk_id;
ERROR 1054 (42S22): Unknown column 'produk.jenis_prodk_id' in 'on clause'
MariaDB [dbtoko]> LEFT JOIN produk ON jenis_produk.id = produk.jenis_produk_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'LEFT JOIN produk ON jenis_produk.id = produk.jenis_produk_id' at line 1
MariaDB [dbtoko]> SELECT jenis_produk.nama AS kategori, SUM(produk.stok) AS total_stok FROM jenis_produk
    -> LEFT JOIN produk ON jenis_produk.id = produk.jenis_produk_id;
+------------+------------+
| kategori   | total_stok |
+------------+------------+
| elektronik |         30 |
+------------+------------+
1 row in set (0.025 sec)

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
9 rows in set (0.003 sec)

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
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
Empty set (0.001 sec)

MariaDB [dbtoko]> DESC pesanan;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra
 |
+--------------+---------+------+-----+---------+----------------+
| id           | int(11) | NO   | PRI | NULL    | auto_increment |
| tanggal      | date    | YES  |     | NULL    |                |
| total        | double  | YES  |     | NULL    |                |
| pelanggan_id | int(11) | NO   |     | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.067 sec)

MariaDB [dbtoko]> SELECT pesanan.*, pelanggan.kartu_id AS kartu FROM pesanan LEFT JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT pesanan.*, pelanggan.kartu_id AS kartu FROM pesanan RIGHT JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
+------+---------+-------+--------------+-------+
| id   | tanggal | total | pelanggan_id | kartu |
+------+---------+-------+--------------+-------+
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     2 |
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     2 |
| NULL | NULL    |  NULL |         NULL |     1 |
+------+---------+-------+--------------+-------+
6 rows in set (0.001 sec)