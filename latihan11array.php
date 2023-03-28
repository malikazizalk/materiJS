<?php
//arrray scalar
$b1 = ['kode'=>'a1', 'buah'=>'apel', 'harga'=>25000, 'jml' => 5];
$b2 = ['kode'=>'a2', 'buah'=>'anggur', 'harga'=>45000, 'jml' => 10];
$b3 = ['kode'=>'a3', 'buah'=>'belimbing', 'harga'=>15000, 'jml' => 11];
$b4 = ['kode'=>'a4', 'buah'=>'bengkuang', 'harga'=>10000, 'jml' => 12];
$b5 = ['kode'=>'a5', 'buah'=>'cerry', 'harga'=>35000, 'jml' => 15];

//array assosiative (dua dimensi)
$buah2an = [$b1, $b2, $b3, $b4, $b5];
$ar_judul = ['no', 'kode', 'buah', 'harga', 'jumlah'];

//fungsi sederhana
$jumlah_data = count($buah2an);
$jml_kg = array_column($buah2an, 'jml');
$total_kg = array_sum($jml_kg);
// $harga_total = array_sum($jml_kg);
$max_kg = max($jml_kg);
$min_kg = min($jml_kg);
$keterangan = [
    'jumlah data'=>$jumlah_data,
    'total kg'=>$total_kg,
    'jumlah tertinggi'=>$max_kg,
    'jumlah terendah'=>$min_kg,
    ]
?>

<!-- cetak array -->
<table border="1" cellpadiing="10px" width="100%">
    <thead>
        <tr>
            <?php
            foreach($ar_judul as $j){
            ?>
            <th><?= $j ?></th>
            <?php } ?>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 1;
        foreach($buah2an as $b){
            $warna = $no % 2 == 1 ? 'grey' : 'green';
        ?>
        <tr bgcolor="<?= $warna; ?>">
            <td><?= $no ?></td>
            <td><?= $b['kode'] ?></td>
            <td><?= $b['buah'] ?></td>
            <td><?= $b['harga'] ?></td>
            <td><?= $b['jml'] ?></td>
        </tr>
        <?php
        $no++;
        }
        ?>
    </tbody>
    <tfoot>
        <?php
        foreach($keterangan as $ket => $hasil){
        ?>
        <tr>
            <th colspan="4"><?= $ket ?></th>
            <th><?= $hasil ?></th>
        </tr>
        <?php } ?>
    </tfoot>
</table>