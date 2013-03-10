<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link rel="shortcut icon" href="<s:url value="/portal/include/favicon.ico"/>" />
<link href="<s:url value="/user/content/css/reg.css"/>" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<s:url value="/user/content/js/jquery.js"/>"></script>
<script src="<s:url value="/user/content/js/slider.js"/>"></script>
<script type="text/javascript" src="<s:url value="/user/content/js/common.js"/>"></script>
<script type="text/javascript" src="<s:url value="/user/content/js/reg.js"/>"></script>
<script type="text/javascript">
	setAgreement=function(id){
		$('.shade').show();
		$('#appendAgreementDiv').show();
	};
</script>

</head>
<body >
<div class="wraper">
<div id="wrap"><s:include value="/user/include/nolog_head.jsp" />
<div id="main">
<div class="area clearfix">
<div class="title">
<h3>免费注册</h3>
我已经有账号<a href="<s:url value="/user/login.jsp"/>">立刻登陆？</a></div>
<div class="login reg"><s:if test="result!=''&&result!=null">
	<div id="warning">${result}</div>
</s:if> <s:form method="post" action="registerUser" id="regForm" namespace="/user">
	<h3>设置你的账户信息</h3>
	<ul>
		<li><label><span class="necessary">*</span>电子邮箱：</label> <s:textfield
			name="email" id="email" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" maxlength="50" />
		<div id="emailTip"><i></i>${errors.email[0]}</div>
		</li>
		<li><label><span class="necessary">*</span>用户名：</label> <s:textfield
			name="username" id="username" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />
		<div id="usernameTip"><i></i>${errors.username[0]}</div>
		</li>
		<li><label><span class="necessary">*</span>登录密码：</label> 
		<s:password	name="password" id="password" onfocus="$(this).addClass('focus')" onblur="$(this).removeClass('cssClasss')" cssClass="txt" />
		<div id="passwordTip"><i></i>${errors.password[0]}</div>
		</li>
		<li><label><span class="necessary">*</span>确认密码：</label> <s:password
			name="password2" id="password2" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />
		<div id="password2Tip"><i></i>${errors.password2[0]}</div>
		</li>
		<li><label>推荐人账号：</label> <s:textfield name="reqName"
			id="reqName" cssClass="txt" /> <s:if
			test="errors.reqName[0]!=null&&errors.reqName[0]!=''">
			<div class="true false"><i></i>${errors.reqName[0]}</div>
		</s:if></li>
	</ul>
	<h3>公司信息和联系方式</h3>
	<ul>
		<s:set name="bir" value="-12"></s:set>
		<li><label><span class="necessary">*</span>会员身份：</label> <span
			class="choose"><input type="radio" name="identity"
			value="pri" id="radio"
			<s:if test="#request.identity!='ent'"> checked="checked" </s:if> />
		个人</span> <span class="choose"><input type="radio"
			name="identity" value="ent" id="radio2"
			<s:if test="#request.identity=='ent'"> checked="checked" </s:if> />
		企业 </span></li>
		<li id="pri_name"><label><span class="necessary">*</span>姓名：</label>
		<s:textfield name="name" id="name" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />(请输入真实姓名以供审核)
		<div id="nameTip">${errors.name[0]}</div>
		</li>
		<li class="entNameLabel"><label><span class="necessary">*</span>公司名称：</label>
		<s:textfield name="entName" id="entName"
			onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />
		<div id="entNameTip">${errors.entName[0]}</div>
		</li>
		<li><label><span class="necessary">*</span>固定电话：</label> <s:textfield
			name="phone" id="phone" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />
		<div id="phoneTip">${errors.phone[0]}</div>
		</li>
		<li><label><span class="necessary">*</span>手机号码：</label> <s:textfield
			name="cellphone" id="cellphone" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" cssClass="txt" />
		<div id="cellphoneTip">${errors.cellphone[0]}</div>
		</li>
		<li class="yzm"><label><span class="necessary">*</span>验证码：</label>
		<s:textfield name="vericode" id="vericode" cssClass="txt"
			cssStyle="width:70px;" onfocus="$(this).addClass('focus')"
			onblur="$(this).removeClass('focus')" /> <div id="valcodeTip">${errors.valcode[0]}</div><img id="verifyPic"
			name="ValidKey" alt="验证码" class="validate-num"
			src="<s:url value="/veriImg"/>" /><a href="###"
			onclick="refreshCode();">换一张？</a>
		
		</li>
		<li><span class="choose"><a href="#" onclick="setAgreement();">点击查看服务条款</a> </span>
		</li>
		<li><input type="submit" value="同意服务条款并注册" class="btn btn1" /></li>
	</ul>
</s:form></div>
<div class="right">
<h4>已有账号</h4>
<a href="<s:url value="/user/login.jsp"/>" class="quick">立即登录</a>
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

<div id="appendAgreementDiv" class="show "
	style="display:none; width: 600px; left: 50%; top: 10%; margin-left: -200px;z-index: 999;" >
<div class="area">
	<h3 align="center"><a href="#" class="close"
	onclick="$('.shade').hide();$('#appendAgreementDiv').hide()"></a>乾宝商务网注册协议</h3>
	
	<div class="creatAblum" style="overflow-x: hidden; overflow-y: scroll; height:500px;">
		<s:label cssStyle="overflow: scroll;">
<p>
	 感谢您光临乾宝商务网官方商城，本商城由杭州杰德科技有限公司运营。以下条款中，包括乾宝商务网官方商城官方网站上更新的所有条款、条件、限制和要求等，
	构成本商城会员与乾宝商务网官方商城之间关于制度的完整协议，请仔细阅读。
</p>
<p>
	如果您使用乾宝商务网官方商城，即表示您已完全理解并同意参与本计划并接受了这些条款、条件、限制和要求。乾宝商务网官方商城保留修改或中断计划或者服务而不需通知会员的权利，
	且不需对会员或第三方负责。用户应完全同意所有服务条款并完成注册程序，才能成为乾宝商务网官方商城的正式用户，通过验证审核之后，您将获得一个独立属于您的乾宝商务网官方商城账户名和密码。
</p>
<h5>
1.用户的权力和义务
</h5>
<p>
用户同意参与本条款，即表明您拥有了在乾宝商务网官方商城发布商品、进行买与卖的权力，同时拥有通过乾宝商务网官方商城这个平台进行支付的权力。
</p>
<p>作为乾宝商务网官方商城的会员，您的义务如下：
</p>
<p>
<strong>1.1</strong>用户必须保管好自己的账户和密码，不给予他人作正当使用或者不正当使用；
</p>
<p>
<strong>1.2</strong>用户必须提供真实的自我信息，单独承担发布内容的责任；
</p>
<p>
<strong>1.3</strong>使用网络服务不作非法用途；
</p>
<p>
<strong>1.4</strong>不干扰或混乱网络服务；
</p>
<p>
<strong>1.5</strong>遵守所有使用网络服务的网络协议、规定、程序和惯例。
</p>
<h5>
2.协议变更及终止</h5>
<p>
	<strong>2.1</strong>
	乾宝商务网官方商城可以自行变更计划或者条款、乾宝商务网官方商城的任何其它条款和条件、或您的会员资格的任何方面，对于变更内容恕不另行通知。
	如果任何变更被认定为无效、废止或因任何原因不可执行，则该变更是可分割的，且不影响其它变更或条件的有效性或可执行性。在我们变更这些条款后，您对乾宝商务网官方商城的继续使用，
	构成您对变更的理解和接受。
</p>
<p>
	<strong>2.2</strong>
	宝商务网官方商城可以不经通知而自行决定终止全部或部分计划，或终止您的会员资格。即使乾宝商务网官方商城没有要求或强制您严格遵守这些条款，
	也并不构成对属于乾宝商务网官方商城的任何权利的放弃。如果您在乾宝商务网官方商城的客户帐户被关闭，那么您也将丧失您的会员资格。对于该会员资格的丧失，
	您对乾宝商务网官方商城不能主张任何权利或为此索赔。
</p>	
<h5>3.责任限制
</h5>
<p>
	<strong>3.1</strong>
	除了乾宝商务网官方商城的使用条件中规定的其它限制和除外情况之外，在中国法律法规所允许的限度内，对于因会员积分计划而引起的或与之有关的任何直接的、间接的、特殊的、附带的、后果性的或惩罚性的损害，
	或任何其它性质的损害，乾宝商务网官方商城、乾宝商务网官方商城的董事、管理人员、雇员、代理或其它代表在任何情况下都不承担责任。
</p>
<p>
	<strong>3.2</strong>
	如由通信、网络故障或地震、台风、战争、罢工等不可抗力所造成的会员资料丢失、服务暂时中止、会员权利受损，乾宝商务网官方商城不承担任何责任，也不提供任何赔偿。
</p>
<p>
	<strong>3.3</strong>
	乾宝商务网官方商城的全部责任，不论是合同、保证、侵权（包括过失）项下的还是其它的责任，均不超过您所购买的与该索赔有关的商品价值额。
	这些责任排除和限制条款将在法律所允许的最大限度内适用，并在您的会员资格被撤销或终止后仍继续有效。
</p>
<p>
	<b>会员制度及积分规则由乾宝商务网官方商城制定并保留所有的修改权和最终解释权。</b>
</p>
<p>
	<b>本协议各方面应受中华人民共和国大陆地区法律的管辖。倘若本协议任何规定被裁定为无效或不可强制执行，该项规定应被撤销，而其余规定应予执行。</b>		
</p>	
		</s:label>
		
	
	</div><div class="btnDiv"><input type="button"
	onclick="$('#appendAgreementDiv').hide();$('.shade').hide();" value="确定" class="btnn" /> </div>
</div>
<div class="di"></div>
</div>

<div class="shade"></div>
<s:include value="/user/include/nolog_footer.jsp" />
</body>
</html>
