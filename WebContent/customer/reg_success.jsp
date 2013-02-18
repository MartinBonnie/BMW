<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册成功</title>
<link href="<s:url value="/customer/css/reg.css"/>" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wraper ">
<div id="wrap"><s:include value="/customer/include/nolog_head.jsp" />
<div id="main">
	<div class="area clearfix">
		<div class="login reg">
			<h3>恭喜你，注册成功!</h3>
		<div>
		<div class="fix_content"><a href="<s:url value="/customer/login.jsp"/>">立刻登陆？</a></div>
		<div class="fix_content"><h4 class="h4">您登录的用户名为<s:property value="username" />
			，您可使用此用户名登陆<s:property value="@com.jadsoft.ngb.common.ConfConst@SITE_NAME"/>。</h4></div>
		<div class="fix_content"><h4 class="h4"><strong>友情提示：</strong>我们已将验证信发送到你的电子邮箱，<a
			href="mailto:<s:property value="email"/>"><s:property
			value="email" /></a> 收信，确认后即可验证成功！</h4></div>
		
	</div>
</div>
<div class="right">
	<h4>已有账号</h4>
	<a href="<s:url value="/customer/login.jsp"/>" class="quick">立即登录</a>
	<ol>
		<li>发布产品供求信息，让生意自动找上门</li>
		<li>发布公司介绍，提升企业知名度</li>
		<li>申请企业旺铺，量身打造全能企业网站</li>
		<li>交商友、看商情，时刻掌握行业最新资讯</li>
	</ol>
</div>
</div></div>
</div>
</div>
<s:include value="/customer/include/nolog_footer.jsp" />
</body>
</html>
