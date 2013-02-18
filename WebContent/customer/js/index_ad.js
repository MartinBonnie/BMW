$(document).ready(function(){
	rightDownAd(function(){
        void(0);
    });
	rightUpAd(function(){
        void(0);
    });
});
rightDownAd = function(){
	$.ajax({
		url : contextPath+"/customer/news/getRightDownAd",
		async: false,
		dataType : "json",
		type: "post",
		data : {"sysType":"ad_userhome_promote", "count":10 },
		success : function(result) {
			result = eval('(' +result+ ')');
			if(result.isTrue){
				var html = "";
				for(var i=0;i<result.items.length;i++){
					var obj = result.items[i];
					html +="<li><a href=\""+obj.adUrl+"\" target=\"_blank\" title=\""+obj.adDesc+"\">"+obj.adTitle+"</a></li>";
				}
				$("#rightDownSDiv").html(html);
			}
		}
	});
};
rightUpAd = function(){
	$.ajax({
		url : contextPath+"/customer/news/getRightDownAd",
		async: false,
		dataType : "json",
		type: "post",
		data : {"sysType":"ad_userhome_img", "count":3 },
		success : function(result) {
			result = eval('(' +result+ ')');
			if(result.isTrue){
				var picHtml="";
				for(var i=0;i<result.items.length;i++){
					var obj = result.items[i];
					picHtml+="<li><a href=\""+obj.adUrl+"\" target=\"_blank\" title=\""+obj.adTitle+"\"><img src=\""+obj.adPath+"\" width=\"220px\" alt=\""+obj.adTitle+"\" /></a></li>";
				}
				$("#rightUpAd").html(picHtml);
			}
		}
	});
}
