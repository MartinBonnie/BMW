<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<s:url value="/customer/user/jquery.js"/>"></script>
<script type="text/javascript">
	login = function(){
		var userName =$("#username").val();
		var userPwd =$("#password").val();
		if(userName.length==0) {
			$("#username").focus();
			return;
		} else if(userPwd.length==0) {
			$("#password").focus();
			return;
		}
		$.ajax({
			type : "post",
			url : "/mvc/admin/login"
				+"?ts="+new Date().getTime(),
			dataType : "json",
			data: {
				"userName": $("#userName").val().trim(), 
				"password": $("#password").val().trim()}
		}).done(function(result){
			alert(result);
		}).fail(function(){
			$.showAlert("网络繁忙，请稍后再试！", "确定");
		});
	};
	reset = function(){
		$("#user_name").val("").focus();
		$("#user_pwd").val("");
	};
</script>
</head>
<body>
			<table border="1px" align="center">
				<tr><td>用户名：</td><td><input type="text" name="username"/></td></tr>
				<tr><td>密码：</td><td><input type="text" name="password"/></td></tr>
				<tr><td><span onclick="login()">提交</span></td></tr>
			</table>
</body>
</html>