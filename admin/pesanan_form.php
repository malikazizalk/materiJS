<br>
<?php
$obj_pesanan = new Pesanan();
$data_pesanan = $obj_pesanan->dataPesanan();
?>
    <form action="pesanan_controller.php" method="POST">
      <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Tanggal Pesanan</label> 
        <div class="col-8">
          <input id="tanggal" name="tanggal" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Total Harga Pesanan</label> 
        <div class="col-8">
          <input id="total" name="total" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text3" class="col-4 col-form-label">Pelanggan ID</label> 
        <div class="col-8">
          <input id="pelanggan_id" name="pelanggan_id" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text4" class="col-4 col-form-label">Pesanan ID</label> 
        <div class="col-8">
          <input id="pesanan_id" name="pesanan_id" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text5" class="col-4 col-form-label">Status Pesanan</label> 
        <div class="col-8">
          <input id="status_pesanan" name="status_pesanan" type="text" class="form-control">
        </div>
      </div> 
      <div class="form-group row">
        <div class="offset-4 col-8">
          <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
<!-- 
    <form action="pesanan_controller.php" method="POST">
      <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Tanggal Pesanan</label> 
        <div class="col-8">
          <input id="tanggal" name="tanggal" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Total Harga Pesanan</label> 
        <div class="col-8">
          <input id="total" name="total" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text" class="col-4 col-form-label">Pelanggan ID</label> 
        <div class="col-8">
          <input id="pelanggan_id" name="pelanggan_id" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text3" class="col-4 col-form-label">Pesanan ID</label> 
        <div class="col-8">
          <input id="pesanan_id" name="pesanan_id" type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label for="text4" class="col-4 col-form-label">Status Pesanan</label> 
        <div class="col-8">
          <input id="status_pesanan" name="status_pesanan" type="text" class="form-control">
        </div>
      </div>
      
      <div class="form-group row">
        <div class="offset-4 col-8">
          <!- name proses pada submitnya dari controller -->
          <!-- <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>  -->