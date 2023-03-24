<?php

echo 'dokumen php saya ada di '.$_SERVER['DOCUMENT_ROOT'];
echo '<br> nama file '.$_SERVER['SCRIPT_FILENAME'];

//ini pemanggilan php
echo '<hr>Hello World';

//pembuatan variable
$nama_siswa = "aziz";
$umur = 23;
$berat_badan = 55.5;
$_pekerjaan = "mahasiswa";
$tes ="coba";

echo '<hr> ';
echo 'nama siswa : '.$nama_siswa;
echo '<br> umur : '.$umur;
echo '<br> berat badan : '.$berat_badan;
echo '<br> pekerjaan : '.$_pekerjaan;
?>

<!-- ini adalah pemanggilan menggunakan document html -->
<hr>
nama siswa : <?= $nama_siswa ?>
<br> umur : <?= $umur ?>
<br> berat badan : <?= $berat_badan ?>
<br> pekerjaan : <?= $_pekerjaan ?>