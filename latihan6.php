<form action="" method="GET">
    <label for="">nama</label>
    <br>
    <input type="text" name="nama" >
    <br>
    <label for="">alamat</label>
    <br>
    <textarea name="alamat" id="" cols="30" rows="10"></textarea>
    <br>
    <input type="submit" name="proses" value="simpan">
</form>

<?php 

//menutupi warning karna belum ada database yg dimasukkan untuk method get nya
error_reporting(0);

    //memproses form
    $nama = $_GET['nama'];
    $alamat = $_GET['alamat'];

    //tampilakan data
    $proses = $_GET['proses'];
    if (isset($proses)){
        echo 'nama : '.$nama.
        '<br> alamat : '.$alamat;
    }
?>