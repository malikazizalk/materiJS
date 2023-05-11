<br>
<?php
error_reporting(0);
$obj_kartu = new Kartu();
$data_kartu = $obj_kartu->dataKartu();
$idedit = $_REQUEST['idedit'];
$card = !empty($idedit) ? $obj_kartu->getKartu($idedit) : array();

?>
<form action="kartu_controller.php" method="POST">
      <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Kode</label> 
        <div class="col-8">
          <input id="kode" name="kode" type="text" class="form-control" value="<?= $card['kode']?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Nama Kartu</label> 
        <div class="col-8">
          <input id="nama" name="nama" type="text" class="form-control" value="<?= $card['nama']?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="text3" class="col-4 col-form-label">Diskon Kartu</label> 
        <div class="col-8">
          <input id="diskon" name="diskon" type="text" class="form-control" value="<?= $card['diskon']?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="text4" class="col-4 col-form-label">Iuran Kartu Per Bulan</label> 
        <div class="col-8">
          <input id="iuran" name="iuran" type="text" class="form-control" value="<?= $card['iuran']?>">
        </div>
      </div> 
      
      <div class="form-group row">
        <div class="offset-4 col-8">
        <?php

        if(empty($idedit)){

        ?>

          <!-- name proses pada submitnya dari controller -->
          <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>

        <?php
        }
        else {
        ?>
        <button name="proses" type="submit" value="ubah" class="btn btn-primary">Update</button>
        <input type="hidden" name="idx" value="<?= $idedit ?>">
        <?php
        }
        ?>
        <button name="proses" type="submit" value="batal" class="btn btn-primary">Cancel</button>
        </div>
      </div>
    </form>