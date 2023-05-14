-- //tugas mandiri
-- //1. buat table produk
MariaDB [dbtoko]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int NOT NULL REFERENCES jenis_prod
uk(id))
    -> ;

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


-- //2. buat table pesanan_items
MariaDB [dbtoko]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int,
    -> harga double)
    -> ;

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


-- //3. buat table vendor
MariaDB [dbtoko]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30))
    -> ;

MariaDB [dbtoko]> DESC vendor;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| nomor  | varchar(4)  | YES  |     | NULL    |                |
| nama   | varchar(40) | YES  |     | NULL    |                |
| kota   | varchar(30) | YES  |     | NULL    |                |
| kontak | varchar(30) | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+


-- //4. buat table pembelian
MariaDB [dbtoko]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10),
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int NOT NULL REFERENCES vendor(id))
    -> ;

MariaDB [dbtoko]> DESC pembelian;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| tanggal   | varchar(45) | YES  |     | NULL    |                |
| nomor     | varchar(10) | YES  |     | NULL    |                |
| produk_id | int(11)     | NO   |     | NULL    |                |
| jumlah    | int(11)     | YES  |     | NULL    |                |
| harga     | double      | YES  |     | NULL    |                |
| vendor_id | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


-- //tampilan awal data table pelanggan
MariaDB [dbtoko]> DESC pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |                |
| nama      | varchar(45) | YES  |     | NULL    |                |
| jk        | char(1)     | YES  |     | NULL    |                |
| tmp_lahir | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir | date        | YES  |     | NULL    |                |
| email     | varchar(30) | YES  |     | NULL    |                |
| kartu_id  | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


-- //5. Tambahkan kolom alamat pada pelanggan dengan tipe data varchar(40)
MariaDB [dbtoko]> ALTER TABLE pelanggan ADD alamat varchar(40);

MariaDB [dbtoko]> DESC pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |                |
| nama      | varchar(45) | YES  |     | NULL    |                |
| jk        | char(1)     | YES  |     | NULL    |                |
| tmp_lahir | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir | date        | YES  |     | NULL    |                |
| email     | varchar(30) | YES  |     | NULL    |                |
| kartu_id  | int(11)     | NO   |     | NULL    |                |
| alamat    | varchar(40) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


-- //6. Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko]> ALTER TABLE pelanggan CHANGE nama nama_pelanggan varchar(45);

MariaDB [dbtoko]> DESC pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(45) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


-- //7. edit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko]> ALTER TABLE pelanggan MODIFY nama_pelanggan varchar(50
);

MariaDB [dbtoko]> DESC pelanggan;
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