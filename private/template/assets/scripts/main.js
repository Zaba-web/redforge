$(document).ready(function(){
   
    let url = window.location.href;
    url = url.split('admin/');
    
    let particion = "home";
    
    if(url.length>1){
        if(url[1] != ""){
            particion = url[1];
        }
    }
    
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '.' + dd + '.' + yyyy;


    try {

        $("#"+particion).addClass("menu-item-active");
        $(".date").val(today);
        
    } catch (err) {


    }
    
    
    if($('textarea').is("[name='content']")){
        var content = CKEDITOR.replace("content");
    }
    
   
});

