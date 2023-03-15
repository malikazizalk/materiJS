
//penjumlahan
function tambah(){
    var frm = document.getElementById('formKalkulator');
    var a1 = parseFloat(frm.angka1.value);
    var a2 = parseFloat(frm.angka2.value);
    var total = a1 + a2;
    var trigger = 'Maaf angka belum terisi';
    if(a1 && a2){
        frm.hasil.value = total;
    }else{
        document.getElementById('peringatan').innerHTML = trigger;
        return false;
    }
}


//pengurang
function kurang(){
    var frm = document.getElementById('formKalkulator');
    var a1 = parseFloat(frm.angka1.value);
    var a2 = parseFloat(frm.angka2.value);
    var total = a1 - a2;
    if(a1 && a2){
        frm.hasil.value = total;
    }else{
        alert('Maaf angka belum terisi');
        return false;
    }
}


//perkalian
function kali(){
    var frm = document.getElementById('formKalkulator');
    var a1 = parseFloat(frm.angka1.value);
    var a2 = parseFloat(frm.angka2.value);
    var total = a1 * a2;
    var trigger = 'Maaf angka belum terisi';
    if(a1 && a2){
        frm.hasil.value = total;
    }else{
        document.getElementById('peringatan').innerHTML = trigger;
        return false;
    }
}


//pembagian
function bagi(){
    var frm = document.getElementById('formKalkulator');
    var a1 = parseFloat(frm.angka1.value);
    var a2 = parseFloat(frm.angka2.value);
    var total = a1 / a2;
    if(a1 && a2){
        frm.hasil.value = total;
    }else{
        alert('maaf');
        return false;
    }
}


//pangkat
function pangkat(){
    var frm = document.getElementById('formKalkulator');
    var a1 = parseFloat(frm.angka1.value);
    var a2 = parseFloat(frm.angka2.value);
    var total = a1 ** a2;
    var trigger = 'Maaf angka belum terisi';
    if(a1 && a2){
        frm.hasil.value = total;
    }else{
        document.getElementById('peringatan').innerHTML = trigger;
        return false;
    }
}
