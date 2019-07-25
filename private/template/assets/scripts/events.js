$(document).ready(function(){
    
    $(".default-list-container-expand").on( "click", function() {
        $(this).parent().parent().parent().children(".default-list-container-sublevel").slideToggle(300);
        toggleArrow(this);
    });   
    
    $(".menu-trigger").on( "click", function() {
        $("nav").slideToggle(300);
    });  
    
    $(".copy").on( "click", function() {
        $("nav").slideToggle(300);
    });  
    
    $(".search").keyup(function(){
        var el = $(".find-selector");
        var finded = false;
        if($(this).val().length>0){
            searchReset(el);
            $(".search-not-finded").hide();
            for(var i=0; i<el.length; i++)
            {
                if(!$(el[i]).text().includes($(this).val())){
                    if ($("div").is(".default-list-container-expanded")) {
                        $(el[i]).closest(".default-list-container-expanded").addClass("container-hidden");
                    } else if ($("div").is(".default-list-container")) {
                        $(el[i]).closest(".default-list-container").addClass("container-hidden");
                    }
                    $(".search-results-text").fadeIn(300);
                }else{
                    finded = true;
                }
            }
            if(!finded){
                $(".search-not-finded").show();
            }
        }else{
        
            searchReset(el);
            $(".search-not-finded").hide();
            
        }
    });
    
    $("#main-search").keyup(function(){
        if($(this).val().length>0){
            $(".header-serach-results").html("");
            $(".header-serach-results").fadeIn(300); 
            data = $(this).val();
            query("admin_references", "F", data, null, "get", findRes);
        }else{
        
            $(".header-serach-results").html("");
            $(".header-serach-results").fadeOut(300);
        }
    });
    
    
    $(".delete").on( "click", function() {
        let data = $(this).data("id");
        let performer = $(this).data("performer");
        let opKey = $(this).data("key");
        
        query(performer, opKey, data, null, "set");
        
        if($("div").is(".default-list-container-expanded")){$(this).closest(".default-list-container-expanded").fadeOut(300);}
        else if($("div").is(".default-list-container")){$(this).closest(".default-list-container").fadeOut(300);}
        
    }); 
    
    $(".submit").on( "click", function() {
       dataHandle(this);
       $('.update-informer-wrapper').fadeIn(300);
       clearForm();
    });
    
    $(".get").on( "click", function() {
       let performer = $(this).data("performer");
       let opKey = $(this).data("key");    
       let data = $(this).data("id");
       
       $("form").data("key","U");
       $(".submit").hide();
       $(".update").show();
       
       $(".mode-informer").fadeIn(300);
       
       query(performer, opKey, data, null, "get", get_data);
    }); 
    
    $(".update").on( "click", function() {
        
        dataHandle(this);
        $('.update-informer-wrapper').fadeIn(300);
        
    });
    
    $(".edit-mode-diable").on( "click", function() {
        
       $("form").data("key","C");
       $(".update").hide();
       $(".submit").show();
       
       clearForm();
       
       $(this).parent().parent().fadeOut(300);

    });
    
    $(".show").on( "click", function() {
        if($(this).data("status")=="hidden"){
            $(this).parent().children(".show-content").slideDown(300);
            $(this).data("status", "visible");
            $(this).text("[приховати]");
        }else{
            $(this).parent().children(".show-content").slideUp(300);
            $(this).data("status", "hidden");
            $(this).text("[показати]");
        }
    });
    
    $(".notification-container").on( "click", function() {
        $(this).fadeOut(300);
    });
    
    $(".user-action").on("click",function(){
       
        let data = $(this).data("id");
        let performer = $(this).data("performer");
        let opKey = $(this).data("key");
        let opType = $(this).data("action");
        query(performer, opKey, data, opType, "set");
        
    });
   
    $(".see").on("click", function () {

        let performer = $(this).data("performer");
        let opKey = $(this).data("key");
        let data = $(this).data("field") + "=" + $(this).data("value")+"&"+"id="+$(this).data("id");

        query(performer, opKey, data, null, "set");
        
    });
    
});
