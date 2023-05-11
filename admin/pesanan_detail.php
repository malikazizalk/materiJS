<?php
$id = $_REQUEST['id'];
$model = new Pesanan();
$pesanan = $model->getPesanan($id);
?>

<h1 class="mt-4">Detail Pesanan</h1>
<div class="card-body">
    <div class="card mb-4">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Tanggal Pesanan</th>
                                            <th>Total Pesanan</th>
                                            <th>ID Pelanggan</th>
                                            <th>Status Pesanan</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?= $pesanan['tanggal']?></td>
                                            <td><?= $pesanan['total']?></td>
                                            <td><?= $pesanan['pelanggan_id']?></td>
                                            <td><?= $pesanan['status_pesanan']?></td>
                                        </tr>
                                    </tbody>
                                    </table>
</div>
</div>