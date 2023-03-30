<?php
require 'latihan16oopBank.php';

//membuat objek
$n1 = new bank('001','aziz',30000000);
$n2 = new bank('002','ari',40000000);
$n3 = new bank('003','andi',50000000);
$n4 = new bank('004','aji',60000000);
$n5 = new bank('005','putri',70000000);
$n6 = new bank('005','budi',80000000);

//harus di atas cetak biar terbaca
//coba setor dan ambil
$n1->ambil(20000000);
$n1->setor(30000000);
$n2->ambil(20000000);

//jika dibuat dalam looping
//buat objek jadi array dulu
$dataNasabah = array($n1, $n2, $n3);

foreach($dataNasabah as $data){
    $data->cetak();
}

//cetak biasa
echo '<hr><hr>';

$n1->cetak();
$n2->cetak();
$n3->cetak();
$n4->cetak();
$n5->cetak();


echo '<br>jumlah nasabah '.bank::$jml.' orang';

?>