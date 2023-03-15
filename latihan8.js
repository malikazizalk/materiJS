function dataPerson(){
    let forms = document.getElementById('frm');
    let nama = forms.nama.value;
    let pekerjaan = forms.pekerjaan.value;
    let hobby = forms.hoby.value;
    let data = `input data : 
    <br> nama : ${nama}
    <br> pekerjaan : ${pekerjaan}
    <br> hobby : ${hobby}`;

    document.getElementById('hasil').innerHTML = data; 
}