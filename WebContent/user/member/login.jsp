<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Simpla Admin | Sign In</title>
<link rel="stylesheet" href="/resource/member/css/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="/resource/member/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/resource/member/js/core/common.js"></script>
<!--[if IE 6]>
	<script type="text/javascript" src="js/DD_belatedPNG_0.0.7a.js"></script>
	<script type="text/javascript">
		DD_belatedPNG.fix('.png_bg, img, li');
	</script>
<![endif]-->
<script type="text/javascript">
	login = function() {
		var account = $("#account").val();
		var password = $("#password").val();
		$.ajax({
			type : "post",
			url : "/web/getLogin",
			dataType : "json",
			data : {
				"account" : account,
				"password" : password,
				"checkcode" : "abcd"
			},
			success : function(result) {
				eval('(' + result.message + ')');
			},
			error : function() {
				alert("您的输入有误，请重新输入！");
			}
		});
	};
</script>
</head>
<body id="login" onload="$('#account').focus();">
	<div id="login-wrapper" class="png_bg">
		<div id="login-top">
			<span style="font-size: 20px">Personal Login</span>
		</div>
		<div class="clear30"></div>
		<div id="login-content">
			<p>
				<label>账号</label><input id="account" class="text-input" type="text" />
			</p>
			<div class="clear"></div>
			<p>
				<label>密码</label><input id="password" class="text-input"
					type="password" onkeyup="if(event.keyCode == 13) login();" />
			</p>
			<div class="clear"></div>
			<p class="align-right">
				<a href="###" class="button" onclick="login();">Sign In</a>
			</p>
		</div>
		<!-- End #login-content -->
	</div>
	<!-- End #login-wrapper -->
</body>
</html>