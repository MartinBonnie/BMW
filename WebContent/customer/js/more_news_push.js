var more=0;
$(document).ready(function(){
	more_pushProduct();
    more_pushNews();
});
more_pushNews = function(){
     $.ajax({
        type: "post",
        cache:false,
        url: contextPath + "/customer/push/newsMorePush",
        dataType: "json",
        data: {
        },
        success: function(result){
            result = eval('(' + result + ')');
            $("#more_newses").empty();
            var data=result;
            var html = "";
            var len;
            if(data.length>20)
            {
            	len=20;
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
                html +="<span class=\"listMoreR\">"+obj.addTime+"</span>";
                html +="<a target=\"_blank\" href=\""+contextPath+"/vip/"+obj.username+"/news_detail?newsId="+obj.newsId+"\">"+obj.title+"</a></li>";
                obj=null;
            }
            $("#more_newses").html(html);
        }
    });
};
more_pushProduct = function(){
     $.ajax({
        type: "post",
        url: contextPath + "/customer/push/morePush",
        dataType: "json",
        data: {
        },
        success: function(result){
        	if(result == null){
        		return;
        	}
            result = eval('(' + result + ')');
            if(result.length == 0){
            	$("#more_products").html("");
            	return;
            }
            var html = "";
            var len = 0;
            if(result.length > 12){
            	len = 12;
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
                html += "</span><span class=\"listMoreR\">"+obj.addTime+"</span>";
                html += "<span class=\"cov\"><a href=\""+contextPath + "/vip/"+obj.username+"/product_detail?id="+obj.productId+"\" target=\"_blank\">";
                html += "<img src=\""+obj.srcurl+"\"width=\"50\" height=\"50\"/></img></a></span>";
                html += "<h4><a href=\""+contextPath + "/vip/"+obj.username+"/product_detail?id="+obj.productId+"\" target=\"_blank\">"+obj.name+"</a></h4>";
                html += "<p>"+obj.desc+"</p></li>";
                obj=null;
            }
            $("#more_products").html(html);
        }
    });
};

