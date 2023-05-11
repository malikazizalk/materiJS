<?php
class Pelanggan {
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataPelanggan(){
        $sql = "SELECT * FROM pelanggan";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    // mengambil id
    public function getPelanggan($id){
        $sql = "SELECT pelanggan.*, kartu.nama as Kategori FROM pelanggan INNER JOIN
        kartu ON kartu.id = pelanggan.kartu_id WHERE pelanggan.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]); //mengambil array id yg akaan di kirimkan ke view
        $rs = $ps->fetch();
        return $rs;
    }

    // tambah data
    public function simpan($data){
        $sql = "INSERT INTO pelanggan(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat)
        VALUES (?,?,?,?,?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

     //update data
     public function ubah($data){
        $sql = "UPDATE pelanggan SET kode=?, nama_pelanggan=?, jk=?, tmp_lahir=?, tgl_lahir=?, email=?, kartu_id=?, alamat=?
        WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

     //delet data
     public function hapus($id){
        $sql = "DELETE FROM pelanggan WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
    }
}
?>