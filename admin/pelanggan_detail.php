<?php
$id = $_REQUEST['id'];
$model = new Pelanggan();
$pelanggan = $model->getPelanggan($id);
?>

<h1 class="mt-4">Detail Pelanggan</h1>
<div class="card-body">
    <div class="card mb-4">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Tempat Lahir</th>
                                            <th>ID Kartu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?= $pelanggan['kode']?></td>
                                            <td><?= $pelanggan['nama_pelanggan']?></td>
                                            <td><?= $pelanggan['jk']?></td>
                                            <td><?= $pelanggan['tmp_lahir']?></td>
                                            <td><?= $pelanggan['kartu_id']?></td>                                        </tr>
                                    </tbody>
                                    </table>
</div>
</div>