var CONTEXT_PATH = function() { 
    var root = window.top.location.href.replace("http://","").replace("https://","").replace("//","/");   
    var first = root.indexOf("/");   
    root = root.substr(first, root.indexOf("/",first+1) - first);   
    return root;
}();
var CONTEXT_HEAD = function() { 
    var root = window.top.location.href.replace("http://","").replace("https://","").replace("//","/");   
    var first = root.indexOf("/");   
    root = root.substr(0, first+1);   
    return "http://"+root;
}();
unopen = function() {
	alert("暂未开放！");
};
request = function(paras) {
	var url = window.location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for(var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[paras.toLowerCase()];
	if( typeof (returnValue) == "undefined") {
		return "";
	} else {
		return returnValue;
	}
};
//设置cookie
setCookies = function(cookieName, cookieValue) {
	var Days = 30;
	//此 cookie 将被保存 30 天
	var exp = new Date();
	//new Date("December 31, 9998");
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = cookieName + "=" + escape(cookieValue) + ";expires=" + exp.toGMTString();
};
//获取cookie
getCookies = function(cookieName) {
	var arr = document.cookie.match(new RegExp("(^| )" + cookieName + "=([^;]*)(;|$)"));
	if(arr != null) {
		return unescape(arr[2]);
	}
	return "";
};
//删除cookie
delCookies = function(cookieName) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1000);
	document.cookie = cookieName + "=0; expires=" + exp.toGMTString();
};

var GLOBAL = {
	"TERMINAL_MODEL": new Array("model-1", "model-2", "model-3"),
	"INIT_AREA": "绍兴",
	"COMPANY": "浙大网新智能有限公司",
	"WEEK_NAME": new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"),
	"WEEK_VALUE": new Array(1, 2, 3, 4, 5, 6, 7),
	"WEEK_SHOW": new Array("一", "二", "三", "四", "五", "六", "日")
};

modifyPwd = function(){
	$("#float_pwd").find("input").triggerHandler("keyup");
	if($("#float_pwd").find("input.err").size()>0) {
		alert("还有内容没有填写正确，请根据红色字体提示进行修改后再保存！");
		return;
	}
	var postData = {};
	postData.newAdminPwd1 = $("#add_pwd0").val().trim();
	postData.newAdminPwd2 = $("#add_pwd1").val().trim();
	postData.oldAdminPwd = $("#verify_pwd").val().trim();
	$.showAddBg(true, 1000, true);
	$.ajax({
		type : "post",
		async: false,
		url : "/mvc/admin/changePwd"
			+"?ts="+new Date().getTime(),
		dataType : "json",
		data: postData
	}).done(function(result){
		if(result.isTrue) {
			$("#float_pwd").remove();
			$.showAddBg(false);
		} else {
			$.showAlert(result.message, "确定", function(){
				$.showAddBg(true);
			});
		}
	}).fail(function(){
		$.showAlert("网络繁忙，请稍后再试！", "确定", function(){
			$.showAddBg(true);
		});
	});
};











