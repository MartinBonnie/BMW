<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="<s:url value="/portal/include/favicon.ico"/>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link href="<s:url value="/user/content/css/reg.css"/>" rel="stylesheet"
	type="text/css" />
<script src="<s:url value="/user/content/js/jquery.js"/>"></script>
<script src="<s:url value="/user/content/js/slider.js"/>"></script>
<script type="text/javascript" src="<s:url value="/user/content/js/common.js"/>"></script>
<script type="text/javascript"
	src="<s:url value="/user/content/js/vericode.js"/>"></script>
</head>
<body>
	<div class="wraper ">
		<div id="wrap">
			<s:include value="/customer/include/nolog_head.jsp" />
			<s:if test="result!=''&&result!=null">
				<div id="warning">${result}</div>
			</s:if>
			<s:else>
			<% if(request.getParameter("returnUrl")!=null){%>
				<div id="warning">请先登陆后再进行操作</div>
			<%} %>
			</s:else>
			<div id="main">
				<div class="area clearfix">
					<div class="title">
						<h3>立刻登陆</h3>
						我还没有账号<a href="<s:url value="/user/reg.jsp"/>">立刻注册？</a>
					</div>
					<div class="login"> 
					<s:form name="loginform" action="/user/loginUser"  id="form1">
					<input type="hidden" name="returnUrl" value="<%=request.getParameter("returnUrl")%>"/>
						<ul>
							<li><label>用户名：</label>
							<span class="form1">
           						<s:textfield name="username" maxLength="20" size="20" 
								cssClass="form01"></s:textfield>
          					</span> &nbsp;&nbsp;
          					<a href="<s:url value="/user/account/get_username.jsp"/>">找回用户名?</a>
							</li>
							<li><label>密&nbsp;&nbsp;码：</label>
							<span class="form1">
            					<s:password cssClass="form01" type="password" size="20"
								maxLength="20" name="password" />	
          					</span>&nbsp;&nbsp;
          					<a href="<s:url value="/user/account/get_password.jsp" />">找回密码?</a>
							</li>
							<li class="yzm"><label>验证码：</label><input type="text" style="width:60px"
								onfocus="$(this).addClass('focus')" onblur="$(this).removeClass('focus')"
								name="vericode"/>&nbsp;<img id="verifyPic"
								name="verifyPic" width="56" height="25" valign="bottom" onclick="refreshCode();"
								src="<s:url value="/veriImg"/>" />&nbsp;<a onclick="refreshCode();"href="#">换一张？</a>
							</li>
							<li><s:submit name="login" cssClass="btn" value="登录"></s:submit>
							</li>
						</ul>
						</s:form>
					</div>
					<div class="right">
						<a href="<s:url value="/user/reg.jsp"/>" title="免费注册" class="zc">免费注册</a>
						<ol>
							<li>发布产品供求信息，让生意自动找上门</li>
							<li>发布公司介绍，提升企业知名度</li>
							<li>申请企业旺铺，量身打造全能企业网站</li>
							<li>交商友、看商情，时刻掌握行业最新资讯</li>
						</ol>
					</div>

				</div>
			</div>
		</div>
	</div>
	<s:include value="/customer/include/nolog_footer.jsp" />
</body>
</html>
