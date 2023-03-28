<?php
//inisialisasi array 1 d
$m1 =['nim'=>'01111021','nama'=>'andi','nilai'=>80];
$m2 =['nim'=>'01111022','nama'=>'ani','nilai'=>70];
$m3 =['nim'=>'01111023','nama'=>'adi','nilai'=>50];
$m4 =['nim'=>'01111024','nama'=>'ana','nilai'=>40];
$m5 =['nim'=>'01111025','nama'=>'ayi','nilai'=>59];
$m6 =['nim'=>'01111026','nama'=>'ari','nilai'=>75];
$m7 =['nim'=>'01111027','nama'=>'anji','nilai'=>30];
$m8 =['nim'=>'01111028','nama'=>'andil','nilai'=>20];

$mahasiswa = [$m1,$m2,$m3,$m4,$m5,$m6,$m7,$m8];
$ar_judul = ['no','nim','nama','nilai','keterangan','grade','predikat']
?>

<table border="1px" width="100%" bgcolor="grey">
    <thead>
        <tr>
            <?php
            foreach($ar_judul as $judul){
            ?>
            <th><?= $judul ?></th>
            <?php } ?>
        </tr>
    </thead>
    <tbody>
        <?php
        $no=1;
        foreach($mahasiswa as $mhs){
            $ket = ($mhs['nilai']>=60) ? 'lulus' : 'gagal';

            //grade
            if($mhs['nilai']>= 81 && $mhs['nilai']<=100)$grade='A';
            else if($mhs['nilai']>= 75 && $mhs['nilai']<= 80)$grade='B';
            else if($mhs['nilai']>= 60 && $mhs['nilai']<= 74)$grade='C';
            else if($mhs['nilai']>= 30 && $mhs['nilai']<= 59)$grade='D';
            else if($mhs['nilai']>= 0 && $mhs['nilai']<= 29)$grade='E';
            else $grade = '';
        ?>
            <tr>
            <td><?= $no ?></td>
            <td><?= $mhs['nim'] ?></td>
            <td><?= $mhs['nama'] ?></td>
            <td><?= $mhs['nilai'] ?></td>
            <td><?= $mhs['nilai'] ?></td>
            
            </tr>
        <?php $no++; } ?>
        
    </tbody>
</table>