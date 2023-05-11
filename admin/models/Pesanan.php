<?php
class Pesanan {
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataPesanan(){
        $sql = "SELECT * FROM pesanan";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    // mengambil id
    public function getPesanan($id){
        $sql = "SELECT pesanan.*, pesanan_items.produk_id as Kategori FROM pesanan INNER JOIN
        pesanan_items ON pesanan_items.pesanan_id = pesanan.pesanan_id WHERE pesanan.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]); //mengambil array id yg akaan di kirimkan ke view
        $rs = $ps->fetch();
        return $rs;
    }

    // menyimpan data
    public function simpan($data){
        $sql = "INSERT INTO pesanan(tanggal, total, pelanggan_id, pesanan_id, status_pesanan)
        VALUES (?,?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

     //update data
     public function ubah($data){
        $sql = "UPDATE pesanan SET tanggal=?, total=?, pelanggan_id=?, pesanan_id=?, status_pesanan=?
        WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

     //delet data
     public function hapus($id){
        $sql = "DELETE FROM pesanan WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
    }
}
?>