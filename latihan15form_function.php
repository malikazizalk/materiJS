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
                            <?php
                            foreach($domisili as $d){
                            ?>
                            <option value="<?= $d ?>"><?= $d ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
            
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3">
                    <button name="proses">submit</button>
                </th>
            </tr>
        </tfoot>
    </form>
    </table>
</fieldset>

<?php
if(isset($_POST['proses'])){
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $prodi = $_POST['prodi'];
    $skill = $_POST['skill'];
    $domisili = $_POST['domisili'];
}
?>

<fieldset style="background-color: grey; width: 610px; margin-left: 25%; ">
<legend style="text-align: center;"><h3>Output</h3></legend>
nim : <?= $nim ?><br>
nama : <?= $nama ?><br>
jenis kelamin : <?= $jk ?><br>
program studi : <?= $prodi ?><br>
skill : 
<?php
foreach($skill as $s){
?>
<?= $s ?>, 
<?php } ?>
<br> domisili : <?= $domisili ?><br>
</fieldset>