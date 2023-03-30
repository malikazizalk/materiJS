<?php
class bank{
    //member variable atau prperti
    protected $norek;
    public $nama;
    private $saldo;
    static $jml = 0;
    const Bank = 'bank syariah';

    //konstruktor untuk file objek untuk menyimpan variable
    public function __construct($no, $nasabah, $saldo){
        //this menunjjuk varable yg ada di dalam diri sendiri atau constructor
        $this->norek = $no;
        $this->nama = $nasabah;
        $this->saldo = $saldo;
        //menujjukan variable yg ada di dalam class
        self::$jml++;
    }
    //proses
    public function setor($uang){//function setor yg didalamnya ada parameter atau variable bernama uang
        $this-> saldo += $uang;
    }
    public function ambil($uang){
        $this->saldo -= $uang;
    }
    public function cetak(){
        echo '<b><u>'.self::Bank.'</u></b>';
        echo '<br>no. rekening : '.$this->norek;
        echo '<br>nama nasabah : '.$this->nama;
        echo '<br>saldo : Rp. '.number_format($this->saldo, 0, ',','.');
        echo '<hr>';
    }
}
?>