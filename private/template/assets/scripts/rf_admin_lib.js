const CLIENT_URL = "http://"+location.hostname+"/";

function toggleArrow(obj){
    if($(obj).hasClass("arrow-expanded")){
        $(obj).removeClass("arrow-expanded");
    }else{
        $(obj).addClass("arrow-expanded");
    }
}

function dataHandle(obj){
    let content;
    if ($('textarea').is("[name='content']")) {
        content = CKEDITOR.instances.content.getData();
    } else {
        content = null;
    }
    let performer = $(obj).parent().parent().data("performer");
    let opKey = $(obj).parent().parent().data("key");
    let data = $(obj).parent().parent().serialize();

    query(performer, opKey, data, content, "set");
}

function query(performer, key, data, content, queryType, func){
    
    $.ajax({
       type: "POST",
       url: CLIENT_URL+"private/performers/main_performer.php",
       data: {
          data:data,
          performer: performer,
          key: key,
          content: content
       },
       dataType: "html",
       success:function(response){
           if(queryType == "set"){
                notify(response);
           }
           else if(queryType == "get"){
                func(response);
           }
           
       }
    });
    
}

function searchReset(el){
    for (var i = 0; i < el.length; i++)
    {
        if ($("div").is(".default-list-container-expanded")) {
            $(el[i]).closest(".default-list-container-expanded").removeClass("container-hidden");
        } else if ($("div").is(".default-list-container")) {
            $(el[i]).closest(".default-list-container").removeClass("container-hidden");
        }
    }
}

function decode(data){
    
    data = data.split("╬");
    
    var parsedData = {};
    
    var parsedItem;
    
    data.forEach(function(element) {
        
        parsedItem = element.split("≈");
        
        parsedData[parsedItem[0]] = parsedItem[1];
        
    });
    
    return parsedData;
    
}

function get_data(data){
    
    data = decode(data);
    for (var key in data ) {
        
        if(key == "content"){
            
            CKEDITOR.instances.content.setData(data[key]);
            
        }else{
            
            $("[name='"+key+"']").val(data[key]);
            
        }
    }
    
}

function clearForm(){
    $("input").val("");
    if($('textarea').is("[name='content']")){
        content = CKEDITOR.instances.content.setData("");
    }
}

function notifyHide(){
    $(".notification-container").fadeOut(300)
}

function notify(text){
    $(".notification-container").fadeIn(300);
    $(".notification-text-inner").text(text);
    var timerId = setTimeout(notifyHide,3000);
}

function findRes(data){
    
    data_parsed = data.split(";");
    data_parsed.splice(-1,1);
    if(data_parsed.length > 0){
        var curData;
        var allDivs;
        var id;
        var error;
        data_parsed.forEach(function(element) {

            parsedItem = element.split("=");
            curData = $(".header-serach-results").html();
            
            
            allDivs = $(".search_item");
            for(var i=0; i<allDivs.length; i++)
            {
                id = $(allDivs[i]).data("id");
                if(parsedItem[0] == id){
                    error = true;
                };
            }
            if(!error){
                $(".header-serach-results").html(curData+"<div class='search_item' data-id="+parsedItem[0]+"><a href='"+CLIENT_URL+"admin/references/?id="+parsedItem[0]+"'><p>"+parsedItem[1]+"</p></a></div>");
            }
        });
    }else{
        $(".header-serach-results").html("<p>За вашим запитом нічого не знайдено</p>");
    }
    
    
}
