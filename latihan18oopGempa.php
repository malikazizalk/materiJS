<?php
class gempa{

    private $lokasi;
    private $skala;

    public function __construct($lokasi, $skala){
        $this->lokasi = $lokasi;
        $this->skala = $skala;
    }
    private function dampak($skala){
        $this->skala = $skala;
        if($skala >= 0 && $skala <= 2)
        $dampak = 'tidak berasa';
        else if($skala > 2 && $skala <= 4)
        $dampak = 'bangunan retak-retak';
        else if($skala > 4 && $skala <= 6)
        $dampak = 'bangunan roboh';
        else $dampak = 'berpotensi tsunami';
        return $dampak;
    }
    public function cetak(){
        echo 'lokasi : '.$this->lokasi;
        echo '<br>skala : '.$this->skala;
        echo '<br>dampak : '.$this->dampak($this->skala);
        echo '<hr>';
    }
}


?>