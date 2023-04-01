<?php
require_once 'latihan28oopDosen.php';
require_once 'latihan29oopMahasiswa.php';
require_once 'latihan30oopStaff.php';

$d1 = new dosen('budi', 'L', '111', 'M.Kom');
$d2 = new dosen('lala', 'p', '112', 'M.Kom');
$m1 = new mahasiswa('ali', 'L', '3', 'Teknik Informatika');
$m2 = new mahasiswa('siti', 'p', '4', 'Sistem Informatika');
$s1 = new staff('dani', 'L', '221', 'tata usaha', '2000000');
$s2 = new staff('sari', 'p', '222', 'administrasi', '3000000');

$ar_data = [$d1, $d2, $m1, $m2, $s1, $s2];

foreach($ar_data as $data){
    $data->cetak();
}
?>