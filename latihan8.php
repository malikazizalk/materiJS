<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>latihan pemrosesan form</title>
</head>
<body>
    
<form action="" method="POST">

    <p>form input nilai</p>
    <label for="">nama</label>
    <br>
    <input type="text" name="nama" placeholder="masukkan nama">
    <br>
    <label for="">mata kuliah</label>
    <br>

    <select name="mk" id="">
    <option value="">----- pilih mata kuliah -----</option>
    <option value="html">html dan css</option>
    <option value="js">java script</option>
    <option value="ui">ui/ux</option>
    <option value="php">php</option>
    </select>
    <br>

    <label for="">nilai</label>
    <br>
    <input type="text" name="nilai" placeholder="masukkan nilai">
    <br>
    <br>
    <button name="proses" type="submit">simpan</button>

</form>

<?php
$nama = $_POST['nama'];
$matakuliah =$_POST['mk'];
$nilai = $_POST['nilai'];
$tombol =$_POST['proses'];

$ket = ($nilai >= 60) ? "lulus" : "gagal";
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

if(isset($tombol)){
?>

nama mahasiswa : <?= $nama ?>
<br> matakuliah : <?= $matakuliah ?>
<br> keterangan : <?= $ket?>
<br> grade : <?= $grade ?>
<br> predikat : <?= $predikat ?>

<?php } ?>

</body>
</html>