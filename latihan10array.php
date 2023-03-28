<?php

//array scalar(satu dimensi)
$ar_buah = ['pepaya','mangga','pisang','jambu'];

//memanggil key
foreach($ar_buah as $id => $buah){
    echo '<br>tampilkan key '.$id;
}

echo '<hr>';

//memanggil value
foreach($ar_buah as $buah){
    echo '<br>tampilkan data '.$buah;
}

echo '<hr>';

//pemanggilan id danvalue array 
foreach($ar_buah as $id => $buah){
    echo '<br>buah dengan id '.$id.' adalah buah '.$buah;
}

?>