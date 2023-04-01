<?php
require_once 'latihan27oopPerson.php';

class mahasiswa extends person{
    public $semester;
    public $jurusan;
    public function __construct($nama, $gender, $semester, $jurusan){
        parent::__construct($nama, $gender);
        $this->semester = $semester;
        $this->jurusan = $jurusan;
    }
    public function cetak(){
        parent::cetak();
        echo '<br>semester : '.$this->semester;
        echo '<br>jurusan : '.$this->jurusan;
        echo '<hr>';
    }
}
?>