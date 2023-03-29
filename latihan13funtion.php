<?php
//contoh function void yang tidak mengembalikan nilai
function salam(){
    echo 'selamat pagi<br>';
}

function sayHello($nama, $umur){
    echo "hello $nama, dan umur $umur tahun <br>"; 
}

//funtion return
function tambah($a, $b){
    $c = $a + $b;
    return $c;
}

//function bilangan prima
function prima($bilangan){
    $prima = true;
    for($i=2; $i<$bilangan; $i++){
        if($bilangan % $i == 0){
            $prima = false;
            break;
        }
    }
    return $prima;
}

//deklarasi
salam();

sayHello("aziz", 23);
sayHello("andi", 32);
sayHello("ali", 46);

$x = 10;
$y = 20;
echo "hasil 50 + 30 = ".tambah(50, 30);
echo "<br>hasil 60 + 40 = ".tambah(60, 40);
echo "<br>hasil $x + $y = ".tambah($x, $y);

$z = 7;
if(prima($z)){
    echo "<br>$z adalah bilangan prima ";
} else{
    echo "<br>$z bukan bilangan prima";
}
?>