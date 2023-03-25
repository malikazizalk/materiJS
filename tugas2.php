<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Muh. Malik Aziz Al Kutbi</title>
</head>
<body>

    <!-- form -->
    <form action="" method="GET">
        <fieldset>
        <legend>Data Rincian Gaji Pegawai</legend>

        <!-- nama -->
        <label for="">Nama</label>
        <br>
        <input name="nama">
        <br>
        <br>

        <!-- jabatan -->
        <label for="">Jabatan</label>
        <br>
            <select name="jabatan" id="">
                <option value="" disabled selected>----- Jabatan -----</option>
                <option value="Manager">Manager</option>
                <option value="Asisten">Asisten</option>
                <option value="Kepala_Bagian">Kepala Bagian</option>
                <option value="Staff">Staff</option>  
            </select>
        <br>
        <br>

        <!-- status -->
        <label for="">Status</label>
        <br>
            <select name="status" id="">
                <option value="" disabled selected>----- Status -----</option>
                <option value="Menikah">Menikah</option>
                <option value="Lajang">Lajang</option>  
            </select>
        <br>
        <br>

        <!-- jumlah anak -->
        <label for="">Jumlah Anak</label>
        <br>
            <select name="ja" id="">
                <option value="" disabled selected>----- Jumlah Anak -----</option>
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
        <br>
        <br>

        <!-- agama -->
        <label for="">Agama</label>
        <br>
            <select name="agama" id="">
                <option value="" disabled selected>----- Agama -----</option>
                <option value="Islam">Islam</option>
                <option value="Kristen">Kristen</option>
                <option value="Katolik">Katolik</option>
                <option value="Hindu">Hindu</option>
                <option value="Konghuchu">Konghuchu</option>  
            </select>
        <br>

        <!-- button -->
        <br>
        <button name="proses" type="submit">simpan</button>
        


        </fieldset>
    </form>

    <!-- php code -->
    <?php

    //menghilangkan warning di awal
    error_reporting(0);
    
    //deklarasi
    $nama       = $_GET['nama'];
    $jabatan    = $_GET['jabatan'];
    $status     = $_GET['status'];
    $anak       = $_GET['ja'];
    $agama      = $_GET['agama'];
    $button     = $_GET['proses'];

    //logika

    //gaji pokok
    switch ($jabatan){
        case "Manager" :        $gp     = 20000000; break;
        case "Asisten" :        $gp     = 15000000; break;
        case "Kepala_Bagian" :  $gp     = 10000000; break;
        case "Staff" :          $gp     =  4000000; break;
        default :               $gp     =        0;
        }


    //coba 
    // if($jabatan == 'Manager') $gp = 20000000;
    // else if($jabatan == 'Asisten' ) $gp = 15000000;
    // else if($jabatan == 'Kepala Bagian') $gp = 10000000;
    // else if($jabatan == 'Staff' ) $gp = 4000000;
    // else $gp = "";

    

    //tunjangan jabatan
    $tj = 0.2 * $gp;

    //tunjangan keluaraga
    if($status == 'Menikah' && $anak == '1') $tk = 0.05 * $gp;
    else if($status == 'Menikah' && $anak == '2' ) $tk = 0.05 * $gp;
    else if($status == 'Menikah' && $anak == '3' ) $tk = 0.1 * $gp;
    else if($status == 'Menikah' && $anak == '4' ) $tk = 0.1 * $gp;
    else if($status == 'Menikah' && $anak == '5' ) $tk = 0.1 * $gp;
    else $tk = '0';

    //gaji kotor 
    $gk = $gp + $tj + $tk;

    //zakat profesi
    $zakat = ($agama == 'Islam' && $gk >= 6000000) ?  $zp = 0.025 * $gk : $zp = 0 ;
    
    // if($agama == 'Islam' && $gk >= 6000000){
    //     $zp = 0.025 * $gk ;
    // }else{
    //     $zp = 0;
    // }

    //gaji bersih
    $gb = $gk - $zakat;

    //tombol
    if(isset($button)){
        
    ?>

    <hr>
    <fieldset>

    <!-- hasil -->
    <legend>Output :</legend>

    Nama Mahasiswa          : <?= $nama ?>
    <br> Jabatan            : <?= $jabatan ?>
    <br> Gaji Pokok         : Rp. <?= $gp ?>
    <br> Tunjangan Jabatan  : Rp. <?= $tj ?>
    <br> Status             : <?= $status ?>
    <br> Jumlah Anak        : <?= $anak ?> 
    <br> Tunjangan Keluarga : Rp. <?= $tk ?>
    <br> Gaji Kotor         : Rp. <?= $gk ?>
    <br> Agama              : <?= $agama ?>
    <br> Zakat              : Rp. <?= $zakat ?>
    <br> Gaji Bersih        : Rp. <?= $gb ?>
    
    </fieldset>

    <?php } ?>
</body>
</html>