<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆成功</title>
<script src="content/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#info").click(function(){
		$.ajax({
			type:"post",
			url:"editUser",
			success:function(r){
				alert(r);
			},
			dataType:"json"
		});
	});
});
</script>
</head>
<body>
你登陆成功<a href="javascript:void(0)" id="info">个人信息</a><hr/>
<a href="logout">注销</a>
</body>
</html>