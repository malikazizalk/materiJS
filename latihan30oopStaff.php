<?php
require_once 'latihan27oopPerson.php';

class staff extends person{
    public $nip;
    public $bidang;
    public $gaji;
    public function __construct($nama, $gender, $nip, $bidang, $gaji){
        parent::__construct($nama, $gender);
        $this->nip = $nip;
        $this->bidang = $bidang;
        $this->gaji = $gaji;
    }
    public function cetak(){
        parent::cetak();
        echo '<br>nomor induk pegawai : '.$this->nip;
        echo '<br>bidang : '.$this->bidang;
        echo '<br>gaji : '.$this->gaji;
        echo '<hr>';
    }
}
?>