<?php
require_once 'latihan23oopHewan1.php';
include 'latihan24oopHewan2.php';
include 'latihan25oopHewan3.php';

$h1 = new kucing();
$h2 = new kambing();
$h3 = new anjing();

$ar_hewan = [$h1,$h2,$h3];
foreach($ar_hewan as $hewan){
    echo '<br>'.$hewan->bersuara();
}

?>