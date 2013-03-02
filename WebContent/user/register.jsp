<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
</head>
<body>
<center>
	<form name="register" action="registerUser" method="post">
			用户名：<input name="username" type="text"/><br/>
			昵称：<input name="name" type="text"/><br/>
			密码：<input name="password" type="text"/><br/>
			密码确认：<input name="password" type="text"/><br/>
			地址：<input name="address" type="text"/><br/>
			<input type="submit" value="提交"/>
	</form>
</center>
</body>
</html>