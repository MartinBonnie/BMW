<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人账户</title>
</head>
<body>
	<s:form name="form1" action="doEditUser" method="post">
	<s:hidden name="userId" value="4028813a3d33405a013d335ee46a0004"></s:hidden>
	 用户名:<s:textfield name="username"></s:textfield><br/>
	 密码:<s:textfield name="password"></s:textfield><br/>
	 昵称:<s:textfield name="name"></s:textfield><br/>
	 住址：<s:textfield name="address"></s:textfield>
	 <s:submit value="提交"></s:submit>
	 </s:form>
</body>
</html>