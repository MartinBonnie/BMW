$(document).ready(function(){
	ShowIndNews(function(){
        void(0);
    });
	showNewNews(function(){
        void(0);
    });
	newAddEnt(function(){
        void(0);
    });
	mainShowHotNews(function(){
        void(0);
    });
    newAddProduct(function(){
        void(0);
    });
    
});
ShowIndNews = function(){
	$.ajax( {
			url : contextPath +"/customer/news/mainShowIndNews",
			cache : false,
			dataType : "json",
			type: "post",
			data : {
			},
			success : function(result) {
				var list = eval("{"+result+"}");
				var html="";
				if(list.length>0){
				for(var i=0;i<list.length;i++){
					var news = list[i];
					html +="<li><span class=\"listMore1\">"+news.addTimeString+"</span><a href=\""+contextPath+"/customer/news/detailNews?newsId="+news.newsId+"\">"+news.title+"</a></li>";
				}
				$("#newsShow").html(html);
				}
			}
		});
};
showNewNews = function(){	
	$.ajax( {
		url : contextPath +"/customer/news/showNewNews",
		cache : false,
		dataType : "json",
		type: "post",
		data : {
		},
		success : function(result) {
			result = eval("{"+result+"}");
			if(result.length>0){
			var data=result;
			var html="";
			for(var i=0;i<data.length;i++){
			    var obj = data[i];
				html+="<li><span class=\"listMore2\">"+obj.time+"</span><a target=\"_Blank\" title=\""+obj.title+"\" href=\""+contextPath+"/vip/"+obj.username+"/news_detail?newsId="+obj.newsId+"\">"+obj.title+"</a></li>";
				obj=null;
			}
			$("#newsNew").html(html);
			}
		}
	});
};
newAddEnt = function(){
	$.ajax( {
		 type: "post",
		    cache:false,
		    url: contextPath +"/customer/ent/newAddEnt",
		    dataType: "json",
		    data: {
		    },
		    success: function(result){
		        result = eval('(' + result + ')');
		        if(result.length>0){
		        var data=result;
		        var html = "";
		        if(data.length<=10){
		        	var j = data.length;
		        }else{
		        	var j = 10;
		        }
		        for (var i = 0; i <j; i++) {
		            var obj = data[i];
		            html+="<li>欢迎企业<B><a title=\""+obj.name1+"\" href=\""+contextPath+"/vip/"+obj.username+"\" target=\"_Blank\">"+obj.name+"</a></B>入驻商城</li>";
		            obj=null;
		        }
		        $("#newEnt").html(html);
		        }
		    }
	});
};
newAddProduct = function(){
	$.ajax( {
		 type: "post",
		    cache:false,
		    url: contextPath +"/customer/product/newAddProduct",
		    dataType: "json",
		    data: {
		    },
		    success: function(result){
		        result = eval('(' + result + ')');
		        if(result.length>0){
		        var data=result;
		        var html = "";
		        if(data.length<=10){
		        	var j = data.length;
		        }else{
		        	var j = 10;
		        }
		        for (var i = 0; i <j; i++) {
		            var obj = data[i];
		            html+="<li>新产品<B><a target=\"_Blank\" title=\""+obj.name2+"\" href=\""+contextPath+"/vip/"+obj.username+"/product_detail?id=";
		            html += obj.productId +"\" >"+obj.name+"</a></B>上架了！</li>";
		            obj=null;
		        }
		        $("#newProduct").html(html);
		        }
		    }
	});
};
mainShowHotNews = function(){	
	$.ajax( {
		url : contextPath +"/customer/news/mainShowHotNews",
		cache : false,
		dataType : "json",
		type: "post",
		data : {
		},
		success : function(result) {
			var list = eval("{"+result+"}");
			var html="";
			if(list.length>0){
			for(var i=0;i<list.length;i++){
				var news = list[i];
				html+="<li><span class=\"listMore1\">"+news.addTimeString+"</span><a href=\""+contextPath+"/customer/news/detailNews?newsId="+news.newsId+"\" target=\"_Blank\">"+news.title+"</a></li>";
			}
			$("#newsHot").html(html);
			}
		}
	});
};