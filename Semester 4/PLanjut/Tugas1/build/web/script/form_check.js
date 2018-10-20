function containNumber(data){
    var cv = "1234567890";
    for(var i=0; i<data.length; i++){
        for(var j=0; j<cv.length; j++){
            if(data[i] === cv[j]){
                return true;
            }
        }
    }
    
    return false;
}

function containAlphabet(data){
    var cv = "abcdefhijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(var i=0; i<data.length; i++){
        for(var j=0; j<cv.length; j++){
            if(data[i] === cv[j]){
                return true;
            }
        }
    }
    
    return false;
}

function containWildcard(data){
    var cv = "`!@#$%^&*()_+-=[];',./<>?:\"{}|\\";
    for(var i=0; i<data.length; i++){
        for(var j=0; j<cv.length; j++){
            if(data[i] === cv[j]){
                return true;
            }
        }
    }
    
    return false;
}

function numberContainWildcard(data){
    var cv = "`!@#$%^&*()_+-=[];',/<>?:\"{}|\\";
    for(var i=0; i<data.length; i++){
        for(var j=0; j<cv.length; j++){
            if(data[i] === cv[j]){
                return true;
            }
        }
    }
    
    return false;
}

var oname = document.forms["calc-form"]["input-nama"],
    onim = document.forms["calc-form"]["input-nim"],
    oangka1 = document.forms["calc-form"]["input-angka1"],
    oangka2 = document.forms["calc-form"]["input-angka2"];
var name, nim, angka1, angka2;

function refreshVariables(){
    name = oname.value;
    nim = onim.value;
    angka1 = oangka1.value;
    angka2 = oangka2.value;
}

function checkInputs(){
    if(validate()){
        document.getElementById("submit-button").className = "button is-link is-fullwidth is-loading";
        return true;
    } else {
        return false;
    }
}

function validate(){
    var retval = true;
    refreshVariables();

    if(containWildcard(name)){
        alert("Nama Tidak Boleh Mengandung Simbol!");
        oname.value = "";
        oname.className = "input is-danger is-more-danger";
        retval = false;
    } else if(containNumber(name)){
        alert("Nama Tidak Boleh Mengandung Angka!");
        oname.value = "";
        oname.className = "input is-danger is-more-danger";
        retval = false;
    } else {
        oname.className = "input is-success is-more-success";
    }
    
    if(containWildcard(nim)){
        alert("NIM Tidak Boleh Mengandung Simbol!");
        onim.value = "";
        onim.className = "input is-danger is-more-danger";
        retval = false;
    } else if(containAlphabet(nim)){
        alert("NIM Tidak Boleh Mengandung Huruf!");
        onim.value = "";
        onim.className = "input is-danger is-more-danger";
        retval = false;
    } else if (nim.length < 9 || nim.length > 9){
        alert("NIM Harus Berjumlah 9 Angka!");
        onim.value = "";
        onim.className = "input is-danger is-more-danger";
        retval = false;
    } else {
        onim.className = "input is-success is-more-success";
    }
    
    if(numberContainWildcard(angka1)){
        alert("Angka 1 Tidak Boleh Mengandung Simbol!");
        oangka1.value = "";
        oangka1.className = "input is-danger is-more-danger";
        retval = false;
    } else if(containAlphabet(angka1)){
        alert("Angka 1 Tidak Boleh Mengandung Huruf!");
        oangka1.value = "";
        oangka1.className = "input is-danger is-more-danger";
        retval = false;
    } else {
        oangka1.className = "input is-success is-more-success";
    }
    
    if(numberContainWildcard(angka2)){
        alert("Angka 2 Tidak Boleh Mengandung Simbol!");
        oangka2.value = "";
        oangka2.className = "input is-danger is-more-danger";
        retval = false;
    } else if(containAlphabet(angka2)){
        alert("Angka 2 Tidak Boleh Mengandung Huruf!");
        oangka2.value = "";
        oangka2.className = "input is-danger is-more-danger";
        retval = false;
    } else {
        oangka2.className = "input is-success is-more-success";
    }
    
    return retval;
}

function resetInputs(){
    oname.className = "input";
    onim.className = "input";
    oangka1.className = "input";
    oangka2.className = "input";
}