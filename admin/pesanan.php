<?php
// include_once 'top.php';
// include_once 'menu.php';


$model = new Pesanan();
$data_pesanan = $model->dataPesanan();

// foreach ($data_produk as $row){
//     print $row['kode'];
// }

?>

                <h1 class="mt-4">Tables</h1>
                   <ol class="breadcrumb mb-4">
                       <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                       <li class="breadcrumb-item active">Tables</li>
                   </ol>
                   <div class="card mb-4">
                       <div class="card-body">
                            DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                           <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                           .
                           
                       </div>
                   </div>
                   <div class="card mb-4">
                       <div class="card-header">
                           <!-- <i class="fas fa-table me-1"></i>
                           DataTable Example -->

                           <a href="index.php?url=pesanan_form" class="btn btn-primary btn-sm"> Tambah</a>
                       </div>
                       <div class="card-body">
                           <table id="datatablesSimple">
                               <thead>
                                   <tr>
                                       <th>No</th>
                                       <th>Tanggal Pesanan</th>
                                       <th>Total Harga Pesanan</th>
                                       <th>ID Pelanggan</th>
                                       <th>ID Pesanan</th>
                                       <th>Status Pesanan</th>
                                       <th>Action</th>
                                   </tr>
                               </thead>
                               <tfoot>
                                   <tr>
                                       <th>No</th>
                                       <th>Tanggal Pesanan</th>
                                       <th>Total Harga Pesanan</th>
                                       <th>ID Pelanggan</th>
                                       <th>ID Pesanan</th>
                                       <th>Status Pesanan</th>
                                       <th>Action</th>
                                   </tr>
                               </tfoot>
                               <tbody>

                               <?php
                               $no = 1;
                               foreach($data_pesanan as $row){
                                
                               ?>
                                   <tr>
                                        <td><?= $no ?></td>
                                       <td><?= $row['tanggal']?></td>
                                       <td><?= $row['total']?></td>
                                       <td><?= $row['pelanggan_id']?></td>
                                       <td><?= $row['pesanan_id']?></td>
                                       <td><?= $row['status_pesanan']?></td>
                                       <td>
                                       <form action="pesanan_controller.php" method="POST">
                                            <a href="index.php?url=pesanan_detail&id=<?= $row ['id'] ?>" class="btn btn-info btn-sm">Detail</a>
                                            <a href="" class="btn btn-warning btn-sm">Ubah</a>
                                            <a href="" class="btn btn-danger btn-sm">Hapus</a>

                                            <input type="hidden" name="idx" value="<?= $row ['id'] ?>">
                                       </form> 
                                       </td>
                                   </tr>
                                <?php
                                $no++;
                                }
                                ?>   
                               </tbody>
                           </table>
                       </div>
                   </div>
                   </div>
                   </div>

<?php
// include_once 'bottom.php';
?>