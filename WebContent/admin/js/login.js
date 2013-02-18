
$(document).ready(function(){
	$("#userName").focus();
});

//登陆
getLogin = function(){
	var userName = $.trim($("#userName").val());
	var userPwd = $.trim($("#userPwd").val());
//	var chkCode = $.trim($("#chkCode").val());
	var chkCode = "";
	if(userName==""){
		alert("用户名不能为空！");
		return;
	}
	else if(userPwd==""){
		alert("用户密码不能为空！");
		return;
	}
//	else if(chkCode=="" || chkCode.length<4){
//		alert("请输入正确的验证码！");
//		return;
//	}
	else{
		userPwd = hex_md5(userPwd);
		LoginHelper.login(userName, userPwd, chkCode, function(result){
			if(!result.isTrue){
				alert(result.message);
				$("#chkCode").val("");
				$("#center_middle > div > img").click();
			}
			else {
				window.location.href="root/main.html";
			}
		});
	}
};

checkIsLogin = function(e){
	var e = window.event ? window.event : e;
    if(e.keyCode == 13){
        getLogin();
    }
};

//重置
getReset = function(){
	$("#userName").val("");
	$("#userPwd").val("");
	$("#chkCode").val("");
	$("#center_middle > div > img").click();
};




















