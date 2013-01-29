<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 	<s:form name="loginform" action="loginUser" namespace="/user" id="form1">
			<table border="1px" align="center">
				<tr><td>用户名：</td><td><input type="text" name="username"/></td></tr>
				<tr><td>密码：</td><td><input type="text" name="password"/></td></tr>
				<tr><td><s:submit value="提交"></s:submit></td></tr>
			</table>
			
	</s:form>
</body>
</html>