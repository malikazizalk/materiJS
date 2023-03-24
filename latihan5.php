<?php 

    //deklarasi
    $nama = "aziz";
    $nilai = 80;

    if($nilai >= 85 && $nilai <= 100) $grade = "A";
    else if($nilai >= 75 && $nilai <= 84 ) $grade = "B";
    else if($nilai >= 60 && $nilai <= 74 ) $grade = "C";
    else if($nilai >= 30 && $nilai <= 59 ) $grade = "D";
    else if($nilai >= 0 && $nilai <= 29 ) $grade = "E";
    else $grade = "";

    switch ($grade){
        case "A" : $predikat = "memuaskan"; break;
        case "B" : $predikat = "bagus"; break;
        case "C" : $predikat = "cukup"; break;
        case "D" : $predikat = "kurang"; break;
        case "E" : $predikat = "buruk"; break;
        default : $predikat ="";
        
    }

?>


nama : <?= $nama ?>
<br> nilai : <?= $nilai ?>
<br> grade : <?= $grade ?>
<br> predikat : <?= $predikat ?>