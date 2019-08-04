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

//----

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

function fileQuery(key, data, queryType, func){
    
    $.ajax({
       type: "POST",
       url: CLIENT_URL+"private/performers/file_performer.php",
       data: {
          data:data,
          key: key
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

//---

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

function showModal(text){
    $(".modal-wrapper").fadeIn(300);
    $(".modal-wrapper").css({"display":"flex"});
    $(".modal-text").html(text);
}

function closeModal(){
    $(".modal-wrapper").fadeOut(300);
}

function fileListInDir(data){

    data = data.split("╬");
    var dir = data[1];
    
    data = data[0].split(";");
    
    var shortName = "";
    
    var res = "<h4>Список файлів в директорії</h4><br>";
        
    for(i = 0;i < data.length-1;i++){
        if(data[i].length > 20){
            shortName = data[i].substr(0,20)+"...";
        }else{
            shortName = data[i]
        }
        res = res+"<div class='file-item-mini'><p>Назва: <span class='selected'>"+shortName+"</span></p><div class='file-controlls'><span class='delete-file' title='Видалити файл' data-name='"+dir+"/"+data[i]+"'> <svg xmlns='http://www.w3.org/2000/svg' x='0px' y='0px' width='24' height='24' viewBox='0 0 172 172' style=' fill:#000000;'><g fill='none' fill-rule='nonzero' stroke='none' stroke-width='1' stroke-linecap='butt' stroke-linejoin='miter' stroke-miterlimit='10' stroke-dasharray='' stroke-dashoffset='0' font-family='none' font-weight='none' font-size='none' text-anchor='none' style='mix-blend-mode: normal'><path d='M0,172v-172h172v172z' fill='none'></path><g fill='#d9d9d9'><path d='M72.24,6.88c-5.66037,0 -10.32,4.65964 -10.32,10.32v6.88h-26.98922c-0.19315,-0.03228 -0.3887,-0.04802 -0.58453,-0.04703c-0.16665,0.00361 -0.33282,0.01933 -0.49719,0.04703h-6.32906c-1.24059,-0.01754 -2.39452,0.63425 -3.01993,1.7058c-0.62541,1.07155 -0.62541,2.39684 0,3.46839c0.62541,1.07155 1.77935,1.72335 3.01993,1.7058h3.44v123.84c0,5.66037 4.65963,10.32 10.32,10.32h89.44c5.66037,0 10.32,-4.65963 10.32,-10.32v-123.84h3.44c1.24059,0.01754 2.39452,-0.63425 3.01993,-1.7058c0.62541,-1.07155 0.62541,-2.39684 0,-3.46839c-0.62541,-1.07155 -1.77935,-1.72335 -3.01993,-1.7058h-6.30219c-0.37149,-0.0614 -0.75054,-0.0614 -1.12203,0h-26.97578v-6.88c0,-5.66036 -4.65963,-10.32 -10.32,-10.32zM72.24,13.76h27.52c1.90763,0 3.44,1.53236 3.44,3.44v6.88h-34.4v-6.88c0,-1.90764 1.53237,-3.44 3.44,-3.44zM37.84,30.96h26.94219c0.37149,0.0614 0.75054,0.0614 1.12203,0h40.15797c0.37149,0.0614 0.75054,0.0614 1.12203,0h26.97578v123.84c0,1.90763 -1.53237,3.44 -3.44,3.44h-89.44c-1.90763,0 -3.44,-1.53237 -3.44,-3.44zM65.30625,48.11297c-1.89722,0.02966 -3.41223,1.58976 -3.38625,3.48703v86c-0.01754,1.24059 0.63425,2.39452 1.7058,3.01993c1.07155,0.62541 2.39684,0.62541 3.46839,0c1.07155,-0.62541 1.72335,-1.77935 1.7058,-3.01993v-86c0.01273,-0.92983 -0.35149,-1.82522 -1.00967,-2.48214c-0.65819,-0.65692 -1.55427,-1.01942 -2.48408,-1.00489zM85.94625,48.11297c-1.89722,0.02966 -3.41223,1.58976 -3.38625,3.48703v86c-0.01754,1.24059 0.63425,2.39452 1.7058,3.01993c1.07155,0.62541 2.39684,0.62541 3.46839,0c1.07155,-0.62541 1.72335,-1.77935 1.7058,-3.01993v-86c0.01273,-0.92983 -0.35149,-1.82522 -1.00967,-2.48214c-0.65819,-0.65692 -1.55427,-1.01942 -2.48408,-1.00489zM106.58625,48.11297c-1.89722,0.02966 -3.41223,1.58976 -3.38625,3.48703v86c-0.01754,1.24059 0.63425,2.39452 1.7058,3.01993c1.07155,0.62541 2.39684,0.62541 3.46839,0c1.07155,-0.62541 1.72335,-1.77935 1.7058,-3.01993v-86c0.01273,-0.92983 -0.35149,-1.82522 -1.00967,-2.48214c-0.65819,-0.65692 -1.55427,-1.01942 -2.48408,-1.00489z'></path></g></g></svg> </span></div></div>";
    }

    showModal(res);
}