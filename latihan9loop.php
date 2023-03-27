<?php
//looping 
//for
echo 'bilangan 1';
echo '<br>bilangan 2';
echo '<hr>';

for($x=1; $x <= 10; $x++){
    echo '<br> bilangan '.$x;
}

echo '<hr>';

//looping decrement
for($y=10; $y >= 1; $y--){
    echo '<br> angka '.$y;
}

echo '<hr>';

//while
echo 'looping mengunakan while';

$xz=1;
while($xz <= 5){
    echo '<br> bilangan '.$xz;
    $xz++;
}

 echo '<hr>';

$yz=5;
while($yz >= 1){
    echo '<br> bilangan '.$yz;
    $yz--;
}

echo '<hr>';

//do while
$d=1;
do{
    echo '<br>'.$d;
    $d++;
}
while($d<=10);
?>