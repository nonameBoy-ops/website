function lightMode( el )
{
    if ( el.value === "Light Mode" )
        el.value = "Dark Mode";
    else
        el.value = "Light Mode";
    
    theme();
}

function theme(){
 //var all = document.getElementById("*");
 var element = document.body;
 var mail = document.getElementById("mail");
 var info = document.getElementById("info");
 //all.classList.toggle("*");
 element.classList.toggle("light-mode");
 mail.classList.toggle("mail-themed");
 info.classList.toggle("info-themed");
}