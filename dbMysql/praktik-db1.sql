//masuk ke dalam mariaDB dengan cmd prompt xampp
C:\xampp\mysql\bin>mysql -u root -p
//untuk melihat seluruh database
MariaDB [(none)]> show databases;
//membuat database baru, query bisa juga dipanggil dengan huruf kecil contoh create databases
MariaDB [(none)]> CREATE DATABASE dbtoko;
//memakai databases
MariaDB [(none)]> USE dbtoko;
//membuat table dan nama table serta tipe data yang dipakai di tiap kolom
MariaDB [dbtoko]> CREATE TABLE kartu(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) NOT NULL,
    -> diskon double default 0,
    -> iuran double default 0)
    -> ;
//melihat table
MariaDB [dbtoko]> show tables;
//melihat isi dari table
MariaDB [dbtoko]> DESC kartu;
