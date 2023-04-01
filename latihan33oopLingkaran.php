<?php
require_once 'latihan32oopAbstrak.php';

class lingkaran extends bentuk2D{
    public $jari2;
    public function __construct($jari2){
        $this->jari2;
    }
    public function namaBidang(){
        echo "lingkaran";
    }
    public function luasBidang(){
        $luas = 3.14 * $this->jari2 * $this->jari2;
        return $luas;
    }
    public function kelilingBidang(){
        $keliling = 2 * 3.14 * $this->jari2;
    }
}
?> 