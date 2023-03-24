<?php 

    //deklarasi
    $nama = "aziz";
    $totalBelanja = 300000;
    $keterangan = "";

    //penggunaan perkondisian if
    if($totalBelanja > 100000){
        $keterangan =  "selamat $nama anda mendapatkan hadiah";
    } else{
        $keterangan = "terimakasih $nama sudah berbelanja disini";
    }

?>

nama pelanggan : <?= $nama ?>
<br> total belanja : <?= $totalBelanja ?>
<br> keterangan : <?= $keterangan ?>