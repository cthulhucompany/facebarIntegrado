/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


           
            
                
        
            
            var req;
            var isIE;

           

function postear() {
    if(!$("#actualiza").hasClass("disabled")){
        var url = "/faceBar3.0/actualizacionEstado?texto=" + $("#post").val()+"&imagenURL="+$("#inputUpload").val()+"&videoURL="+$("#url").val();
        req = initRequest();
        req.open("GET", url, true);
        
        req.onreadystatechange = callback;
        req.send(null);
        $("#error").show();
    }
}
function callback(){
    
    if (req.readyState == 4) {
        if (req.status == 200) {
            
            if(req.responseText == "exito"){
                $("#error").hide();
                $("#exito").show();
                var currentDate = new Date();
                var day = currentDate.getDate();
                var month = currentDate.getMonth();
                var year = currentDate.getFullYear();
                
                $("#user").append("Tu escribiste el dia "+day+"/"+month+"/"+year);
                $("#estado").append($("#post").val());
                if($("#url").val() != ""){
                $("#estado").append("<p><a class='btn' href='"+$("#url").val()+"'>Ver Video</a>");
                }
                $("#caja").slideDown();
                
            }
            if(req.responseText != "exito"){
                
                $("#error").show();
                
            }
        }
    }
}
    
    










function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}