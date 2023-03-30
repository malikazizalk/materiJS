<?php
require 'latihan18oopGempa.php';
$g1 = new gempa('lombok',0.1);
$g2 = new gempa('aceh',3.5);
$g3 = new gempa('palembang',5.1);
$g4 = new gempa('jakarta',7.1);

$ar_data = [$g1, $g2, $g3, $g4];

foreach($ar_data as $d){
    $d->cetak();
}

?>