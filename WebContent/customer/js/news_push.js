var more=0;
$(document).ready(function(){
	pushProduct();
    pushNews();
});
pushNews = function(){
     $.ajax({
        type: "post",
        cache:false,
        url: contextPath + "/customer/push/mainnewsPush",
        dataType: "json",
        data: {
        },
        success: function(result){
            result = eval('(' + result + ')');
            $("#s2").empty();
            var data=result;
            var html = "";
            var len;
            if(data.length>12)
            {
            	len=12;
            }
            else
            {
            	len=data.length;
            }
            for (var i = 0; i < len; i++) {
                var obj = data[i];
                if(obj.tags==""){
                	html += "<li><span class=\"listMore\"><a target=\"_blank\" href=\""+contextPath + "/vip/"+obj.username+"/index"+"\">"+obj.entName+"</a></span>";
                }else{
                	html += "<li><span class=\"listMore\"><a href=\""+contextPath+"/customer/concern/detailNewsConcern?cur='01'&tag="+obj.tags+"\">"+obj.tags+"</a></span>";
                }
                html +="<a target=\"_blank\" href=\""+contextPath+"/vip/"+obj.username+"/news_detail?newsId="+obj.newsId+"\">"+obj.title+"</a></li>";
                obj=null;
            }
            $("#s2").html(html);
        }
    });
};
pushProduct = function(){
     $.ajax({
        type: "post",
        url: contextPath + "/customer/push/mainproductPush",
        dataType: "json",
        data: {
        },
        success: function(result){
        	if(result == null){
        		return;
        	}
            result = eval('(' + result + ')');
            if(result.length == 0){
            	$("#s1").html("");
            	return;
            }
            var html = "";
            var len = 0;
            if(result.length > 5){
            	len = 5;
            } else {
            	len = result.length;
            }
            for (var i = 0; i < len; i++) {
                var obj = result[i];
                if(obj.tags==""){
                	html += "<li><span class=\"listMore\"><a target=\"_blank\" href=\""+contextPath + "/vip/"+obj.username+"/index"+"\">"+obj.entName+"</a>";
                }else{
                	html += "<li><span class=\"listMore\"><a href=\""+contextPath+"/customer/concern/detailTagConcern?cur='01'&tag="+obj.tags+"\">"+obj.tags+"</a>";
                }
                html += "</span><span class=\"cov\"><a target=\"_blank\" href=\"";
                html += contextPath + "/vip/"+obj.username+"/product_detail?id=";
                html += obj.productId + "\"><img src=\""+obj.srcurl+"\"width=\"50\" height=\"50\"/>"+"</a></span><h4><a target=\"_blank\" href=\"";
                html += contextPath + "/vip/"+obj.username+"/product_detail?id=";
                html += obj.productId + "\">"+obj.name+"</a></h4><p>"+obj.desc+"</p></li>";
                obj=null;
            }
            $("#s1").html(html);
        }
        
    });
};



