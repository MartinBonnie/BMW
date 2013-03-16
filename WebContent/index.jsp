<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- 配置ueditor -->
<script type="text/javascript">
window.UEDITOR_HOME_URL="/ueditor/";
</script>
<script type="text/javascript" charset="utf-8" src="/ueditor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all.js"></script>
</head>
<body>
	hello<hr>
	<div>
	<TEXTAREA id=editor name=editor style="width:1076px;">这里写你的初始化内容</TEXTAREA>
	</div>
</body>
<script type=text/javascript>
	//初始化ueditor
    UE.getEditor('editor');
</script>
</html>