<?php
class pegawai{
    protected $nip;
    public $nama;
    private $jabatan;
    private $agama;
    private $status;
    static $jml = 0;
    const pt = 'PT. HTP Indonesia';

    public function __construct($nip, $nama, $jabatan, $agama, $status){
        $this->nip = $nip;
        $this->nama = $nama;
        $this->jabatan = $jabatan;
        $this->agama = $agama;
        $this->status = $status;
        self::$jml++;
    }
    public function setGajiPokok($jabatan){
        $this->jabatan = $jabatan;
        switch($jabatan){
            case 'manager': $gapok = 15000000; break;
            case 'asisten manager': $gapok = 10000000; break;
            case 'kepala bagian': $gapok = 7000000; break;
            case 'staff': $gapok = 5000000; break;
            default: $gapok;
        }
        return $gapok;
    }

    public function setTunjab($jabatan){
        $this->jabatan = $jabatan;
        $tunjab = $this->setGajiPokok($jabatan) * 0.2;
        return $tunjab;
    }

    public function setTunkel($status){
        $this->status = $status;
        $tunkel = ($this->status == 'menikah') ? $this->setGajiPokok($this->jabatan) * 0.1 : 0;
        return $tunkel;
    }

    public function setZakatProfesi($agama){
        $this->agama = $agama;
        $zakat = ($this->agama == 'islam' && $this->setGajiPokok($this->jabatan) > 6000000) ? $this->setGajiPokok($this->jabatan) * 0.025 : 0;
        return $zakat;
    }

    public function getGajiPokok(){
        return $this->setGajiPokok($this->jabatan);
    }

    public function getTunjab(){
        return $this->setTunjab($this->jabatan);
    }

    public function getTunkel(){
        return $this->setTunkel($this->status);
    }

    public function getZakatProfesi(){
        return $this->setZakatProfesi($this->agama);
    }

    public function getGajiBersih(){
        return $this->getGajiPokok() + $this->getTunjab() + $this->getTunkel() - $this->getZakatProfesi();
    }

    
    public function cetak(){
        echo '<b><u>'.self::pt.'</u></b>';
        echo '<br>nip pegawai : '.$this->nip;
        echo '<br>nama pegawai : '.$this->nama;
        echo '<br>jabatan : '.$this->jabatan;
        echo '<br>agama : '.$this->agama;
        echo '<br>status : '.$this->status;
        echo "<br>gaji pokok : ".$this->getGajiPokok();
        echo "<br>tunjangan jabatan : ".$this->getTunjab();
        echo "<br>tunjangan keluarga : ".$this->getTunkel();
        echo "<br>zakat profesi : ".$this->getZakatProfesi();
        echo "<br>gaji bersih : ".$this->getGajiBersih();
        echo '<hr>';
    }
}

?>