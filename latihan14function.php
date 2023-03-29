<?php
function hitung($a1, $a2, $tombol){
    if($tombol == '+') $hasil = $a1 + $a2;
    else if($tombol == '-') $hasil = $a1 - $a2;
    else if($tombol == '*') $hasil = $a1 * $a2;
    else if($tombol == '/') $hasil = $a1 / $a2;
    else $hasil = 0;
    return $hasil;
} 
?>

<h1>kalkulator</h1>
<form action="" method="post">
    <div class="input">
        <label for="a1">
            angka 1 <input type="text" id="a1" name="a1">
            <br>
        </label>
        <label for="a2">
            angka 2 <input type="text" id="a2" name="a2">
            <br>
        </label>
    </div>
</form>