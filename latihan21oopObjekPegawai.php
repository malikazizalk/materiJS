<?php
require 'latihan20oopPegawai.php';

$pegawai1 = new pegawai('01111', 'Andi', 'manager', 'islam', 'menikah');
$pegawai2 = new Pegawai('01112', 'Ameri', 'asisten manager', 'hindu', 'jomblo');
$pegawai3 = new Pegawai('01113', 'Alfred', 'kepala bagian', 'kristen', 'lajang');
$pegawai4 = new Pegawai('01114', 'Agus', 'staff', 'islam', 'menikah');
$pegawai5 = new Pegawai('01115', 'Ahfeng', 'staff', 'konghuchu', 'lajang');


$ar_pegawai = [$pegawai1, $pegawai2, $pegawai3, $pegawai4, $pegawai5];

foreach($ar_pegawai as $pegawai){
    $pegawai->cetak();
}

?>