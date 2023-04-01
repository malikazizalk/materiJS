<?php
class person{
    public $nama;
    public $gender;
    public function __construct($nama, $gender){
        $this->nama = $nama;
        $this->gender = $gender;
    }
    public function cetak(){
        echo 'nama : '.$this->nama;
        echo '<br>jenis kelamin : '.$this->gender;
    }
}
?>