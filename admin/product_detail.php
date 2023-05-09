<?php
$id = $_REQUEST['id'];
$model = new Produk();
$produk = $model->getProduk($id);
?>

<div>
    <h3><?= $produk['nama'] ?> </h3>
</div>