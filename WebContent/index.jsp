<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.zwrx.bmw.models.*,com.zwrx.bmw.util.*" %>
<%	MailBox box=new MailBox();
	MailInfo eml=new MailInfo("250289416@qq.com","赵志洋");
	String body="<html><body>欢迎你注册斗价网！<br/>"+
			"点击链接激活<br/><p><a href=\"\">xxxx</a></p><br/>"+
			"<img src=\"http://192.168.1.186/BMW/uploadfile/meinv.jpg\" alt=\"\"/>"
			+"该邮件不必回复。"+"</body></html>";
	eml.setBody(body);
	//MailUtils.sendMail(box,eml);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello EveryOne</h1>
</body>
</html>