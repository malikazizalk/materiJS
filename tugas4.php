<?php
//deklarasi array
$ar_prodi = ["si"=>"sistem informasi",
             "ti"=>"teknik informatika",
             "ilkom"=>"ilmu komputer",
             "te"=>"teknik elektro"   
            ];

$ar_skill  = ["html"=>10,
             "css"=>10,
             "javascript"=>20,
             "rwd boostrap"=>20,
             "php"=>30,
             "mysql"=>30,
             "laravel"=>40
            ];
            
$domisili = ["jakarta",
             "bandung",
             "bekasi",
             "malang",
             "surabaya",
             "lainnya"
            ];
?>
<!-- form -->
<fieldset style="background-color: grey; width: 610px; margin-left: 25%; text-align: center;">
    <legend><h2>form registrasi kelompok belajar</h2></legend>
    <table>
        <thead>
            <tr>
                <th><h3>form registrasi</h3></th>
            </tr>
        </thead>
        <tbody>
    <form action="" method="post">
                <tr>
                    <td>nim</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="nim">
                    </td>
                </tr>
                <tr>
                    <td>nama</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="nama">
                    </td>
                </tr>
                <tr>
                    <td>jenis kelamin</td>
                    <td>:</td>
                    <td>
                        <input type="radio" name="jk" value="laki-laki">Laki-laki &nbsp;
                        <input type="radio" name="jk" value="perempuan">Perempuan
                    </td>
                </tr>
                <tr>
                    <td>program studi</td>
                    <td>:</td>
                    <td>
                        <select name="prodi" id="">
                        <option value="" disabled selected>----- prodi -----</option>
                            <?php
                            foreach($ar_prodi as $prodi => $v){
                            ?>
                            <option value="<?= $prodi ?>"><?= $v ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>skill programming</td>
                    <td>:</td>
                    <td>
                        <?php
                        foreach($ar_skill as $skill => $s){
                        ?>
                        <input type="checkbox" name="skill[]" value="<?= $skill ?>"><?= $skill ?>  
                        <?php } ?>
                    </td>
                </tr>
                <tr>
                    <td>domisili</td>
                    <td>:</td>
                    <td>
                        <select name="domisili" id="">
                        <option value="" disabled selected>----- tempat tinggal -----</option>
                            <?php
                            foreach($domisili as $d){
                            ?>
                            <option value="<?= $d ?>"><?= $d ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td> : </td>
                    <td>
                        <input type="email" name="email">
                    </td>
            </tr>
            
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3" >
                    <button name="proses">submit</button>
                </th>
            </tr>
        </tfoot>
    </form>
    </table>
</fieldset>


<fieldset style="background-color: grey; width: 610px; margin-left: 25%; ">
<?php
if(isset($_POST['proses'])){
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $prodi = $_POST['prodi'];
    $skill = $_POST['skill'];
    $domisili = $_POST['domisili'];
    $email = $_POST['email'];
}

//menentukan total score
$ts = 0;
foreach($skill as $total) {
    if(isset($ar_skill[$total])) {
        $ts += $ar_skill[$total];
    }
}

// penggunaan fungsi untuk menentukan kategori skill
function ks($ts) {
    if ($ts >= 100 && $ts <=150){
        return "sangat baik";
    }else if ($ts >= 60 && $ts <=100){
        return "baik";
    }else if ($ts >= 40 && $ts <=60){
        return "cukup";
    }else if ($ts >= 0 && $ts <=40){
        return "kurang";
    }else{
        return "tidak memadai";
    }
}
?>



<!-- table untuk menampilkan output -->
<table cellpadding="5">
    <thead>
        <tr>
        <legend style="text-align: center;"><h3>output</h3></legend>
        </tr>
    </thead>

    <tbody>
        <form>
            <tr>
                <td>nim</td>
                <td> : </td>
                <td> <?= $nim ?> </td>
            </tr>
            <tr>
                <td>nama</td>
                <td> : </td>
                <td> <?= $nama ?> </td>
            </tr>
            <tr>
                <td>jenis kelamin</td>
                <td> : </td>
                <td> <?= $jk ?> </td>
            </tr>
            <tr>
                <td>program studi</td>
                <td> : </td>
                <td> <?= $prodi ?> </td>
            </tr>
            <tr>
                <td>skill programming</td>
                <td> : </td>
                <td>
                <?php
                    foreach( $skill as $s){ ?>
                    <?= $s ?>, 
                    <?php } ?>
                </td>
            </tr>
            <tr>
                <td>skor skill</td>
                <td> : </td>
                <td> <?= $ts ?> </td>
            </tr>
            <tr>
                <td>kategori skill</td>
                <td> : </td>
                <td> <?= ks($ts) ?> </td>
            </tr>
            <tr>
                <td>domisili</td>
                <td> : </td>
                <td> <?= $domisili ?> </td>
            </tr>
            <tr>
                <td>email</td>
                <td> : </td>
                <td> <?= $email ?> </td>
            </tr>
    </tbody>
</fieldset>
