<?php
require_once 'latihan27oopPerson.php';

class dosen extends person{
    public $nidn;
    public $gelar;
    public function __construct($nama, $gender, $nidn, $gelar){
        parent::__construct($nama, $gender);
        $this->nidn = $nidn;
        $this->gelar = $gelar;
    }
    public function cetak(){
        parent::cetak();
        echo '<br>nidn : '.$this->nidn;
        echo '<br>gelar : '.$this->gelar;
        echo '<hr>';
    }
}
?>