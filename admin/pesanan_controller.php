<?php
include_once 'koneksi.php';
include_once 'models/Pesanan.php';

// step pertama yaitu menangkap request form
$tanggal = $_POST['tanggal'];
$total = $_POST['total'];
$pelanggan_id = $_POST['pelanggan_id'];
$pesanan_id = $_POST['pesanan_id'];
$status_pesanan = $_POST['status_pesanan'];

//menangkap form di atas dan dijadikan array
$data = [
    $tanggal,
    $total,
    $pelanggan_id,
    $pesanan_id,
    $status_pesanan,
    
];
$model = new Pesanan();
$tombol = $_REQUEST['proses'];
switch($tombol){
    case 'simpan':$model->simpan($data); break;
    case 'ubah':
        $data[] = $_POST['idx']; $model->ubah($data); break; //untuk mengirim id ke dalam detail
    default:
    header('Location:index.php?url=pesanan');
    break;
}
header('Location:index.php?url=pesanan');

?>