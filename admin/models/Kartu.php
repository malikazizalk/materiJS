<?php
class Kartu {
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataKartu(){
        $sql = "SELECT * FROM kartu";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    // mengambil id
    public function getKartu($id){
        $sql = "SELECT kartu.*, pelanggan.nama_pelanggan as Kategori FROM kartu INNER JOIN
        pelanggan ON pelanggan.kartu_id = kartu.id WHERE kartu.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]); //mengambil array id yg akaan di kirimkan ke view
        $rs = $ps->fetch();
        return $rs;
    }

    // menyimpan data
    public function simpan($data){
        $sql = "INSERT INTO kartu(kode, nama, diskon, iuran)
        VALUES (?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
}
?>