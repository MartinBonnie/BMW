<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<link rel="shortcut icon" href="<s:url value="/portal/include/favicon.ico"/>" />
<!-- Internet Explorer .png-fix --> 
<!--[if IE 6]>
<script type="text/javascript" src="<s:url value="/js/DD_belatedPNG_0.0.8a-min.js"/>" mce_src="<s:url value="/js/DD_belatedPNG_0.0.8a-min.js"/>"></script>
<![endif]--> 

<!-- 获取参数mainmenu和submenu，以便在js里面进行统一处理 -->
<%
String mainmenu = "01";
if(request.getParameter("cur")!=null) {
	mainmenu = request.getParameter("cur");
}
%>
<script type="text/javascript" src="<s:url value="/portal/content/js/common.js"/>"></script>
<script type="text/javascript">
var messageNum = "";
var mainmenu;
$(document).ready(function(){
	/*********初始化菜单****************/
	$("#totalBuyNum_nav").showTotalBuyNum();
	
	mainmenu = <%=mainmenu%>;
	var index = parseInt(mainmenu,10)*2-2;		//计算出跳转到哪个mainmenu
	$("#mainMenu").find("li").eq(index).addClass("current").find("a:eq(0)").click();		//根据mainmenu值将相应的主菜单加current样式，然后再选择到其里面的a标签进行模拟点击
	/*********结束****************/
	$("#nav li a").click(function() {
		$("#nav li").removeClass("current");
		$(this).parent().addClass("current");
	});
	$(".sideC li:odd").addClass("odd");
	$.ajax( {
		url : "<s:url value="/customer/message/unreadMessage"/>",
		cache : false,
		dataType : "json",
		type : "post",
		data : {},
		success : function(result) {
			$("#unread_messages").html("(" + result + ")");
			messageNum = result;
		}
	});
	$.ajax({
		url : "<s:url value="/customer/order/remindOrder"/>",
		cache : false,
		dataType : "json",
		type : "post",
		data : {},
		success : function(result) {
			var ms = Number(messageNum);
			var nums = result.split("_");
			$("#unpaid").html("(" + nums[0] + ")");
			$("#unreceiving").html("(" + nums[1] + ")");
			$("#unsendGoods").html("(" + nums[2] + ")");
			$("#unreturned").html("(" + nums[3] + ")");
			var msg = Number(nums[0]) + Number(nums[1]) + Number(nums[2])
					+ Number(nums[3]) + ms > 0 ? "newMes" : "";
			$("#newMsg").attr("class", msg);
		}
	});
	$("#topMenu a").each(function() {
		$(this).bind("click", function() {
			var parent = $(this);
			$("#mainMenu li").each(function() {
				if ($(this).attr("class").indexOf("current") > -1) {
					var link = parent.attr("href")+ "?cur="+ $(this).attr("title")+"&submenu="+parent.parent().attr("id");
						parent.attr("href",link);
						return true;
				}
			});
		});
	});
	$("#topMenuList a").each(function() {
		$(this).bind("click",function() {
			var parent = $(this);
			$("#mainMenu li").each(function() {
				if ($(this).attr("class").indexOf("current") > -1) {
					var link = parent.attr("href")+ "?cur="+ $(this).attr("title");
					parent.attr("href",link);
					return true;
				}
			});
		});
	});
});

$(document).ready(function(){
	var searchType="prod";
	$("#searchProd").click(function(){
		$("#searchType").html("产品");
		searchType="prod";
		$(this).parent().parent().parent().removeClass("xzHover");
	});
	$("#searchEnt").click(function(){
		$("#searchType").html("公司");
		searchType="ent";
		$(this).parent().parent().parent().removeClass("xzHover");
	});
	$("#searchNews").click(function(){
		$("#searchType").html("资讯");
		searchType="news";
		$(this).parent().parent().parent().removeClass("xzHover");
	});
	$("#searchBtn").click(function(){
		var keywords = $("#keywords").val();
		if(keywords==""){
			alert("请输入搜索的关键词！");
			return;
		}else{
			//keywords = encodeURI(url);
			if(searchType=="prod"){
				window.location="<s:url value="/portal/productSearch"/>?keywords="+keywords;
			}
			if(searchType=="news"){
				window.location="<s:url value="/portal/newsSearch"/>?keywords="+keywords;
			}
			if(searchType=="ent"){
				window.location="<s:url value="/portal/entSearch"/>?keywords="+keywords;
			}
		}
	});
	//改变标题
	var t=document.title;
	//alert(t);
	document.title="乾宝商务_"+t;
});

showPopWinList = function(){
	if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["popwin_wrap"]){	//判断浏览器是否是ie6.0， 并判断里面的img是否已经做过png滤镜处理
		$("#popwin_wrap").show().find("img").each(function(){
			DD_belatedPNG.fixPng($(this)[0]);
		});		
		IsFixMap["popwin_wrap"]=true;	
		$("#popwin_wrap").mouseover(function(){
			$(this).hide().show();
		});												//将滤镜处理状态设置为已处理，避免下一次重复处理
	} else {
		$("#popwin_wrap").show();
	}
}


</script>
</head>
<body>
<div id="header">
<div class="search">
<div class="xz" onmouseover="$(this).addClass('xzHover');" onmouseout="$(this).removeClass('xzHover');">
                	<i></i><span id="searchType">产品</span>
                	<ul>
                    	<li><a href="###" id="searchProd">产品</a></li>
                        <li><a href="###" id="searchEnt">公司</a></li>
                        <li><a href="###" id="searchNews">资讯</a></li>
                    </ul>
                </div>
                	
<input type="text" id="keywords" class="txt"><input id="searchBtn"
	type="button" value="搜索" class="btn"></div>
<div class="topbar">
<h1>我的后台</h1>
<p><span>您好<em><B><s:property
	value="%{#session.nameInfo}"></s:property></B></em><s:if test="%{#session.jaduser.isAuditUser()}">认证会员<img class="vip_blue"
						src="<s:url value="/images/transparent.gif"/>" title="认证会员">
				</s:if><s:else><a style="float:none;color:#FF7F00;" href="<s:url value="/customer/inputAudict"/>">申请认证</a><img class="apply_vip"
						src="<s:url value="/images/transparent.gif"/>" title="申请认证"></s:else></span><a href="<s:url value="/user/logout" />">退出</a>
<span>|</span><a href="<s:url value="/customer/index.jsp"/>">后台首页</a><span>|</span><a href="<s:url value="/"/>">网站首页</a><span>|</span><a href="<s:url value="/customer/account/view_userinfo.jsp"/>">管理账号</a><span>|</span><a href="<s:url value='/portal/shopping_cart.jsp'/>" title="我的购物车">购物车<strong id="totalBuyNum_nav">0</strong>件</a>
<span>|</span>
</p>
	 <ul id="topMessage1">
	 	<li class="s3" onmouseover="$(this).addClass('current1');" onmouseout="$(this).removeClass('current1');">
	 	<a href="#" id="newMsg" class=""  title="消息"><i></i>消息</a>
                	<div>
                         <a href="<s:url value="/customer/message/listMessage"/>"><em id="unread_messages"></em>站内信</a>
                         <a href="<s:url value="/customer/order/listWaitPayOrder"/>"><em id="unpaid"></em>待付款订单</a>
						 <a href="<s:url value="/customer/order/listUnreceivedOrder"/>"><em id="unreceiving"></em>待收货商品</a>
						 <a href="<s:url value="/customer/order/waitSendGoodsOrder"/>"><em id="unsendGoods"></em>待发货商品</a>
						 <a href="<s:url value="/customer/order/listReturnOrder"/>"><em id="unreturned"></em>待确认退货商品</a>
                    </div>
                </li>
	 </ul>
</div>
<div id="nav">
<div class="r">
<div class="l">
<ul id="mainMenu">
	<li title="01" ><a href="###" title="首页" id="home"><span>首页</span></a></li>
	<li>|</li>
	<li title="02" ><a href="###" title="产品" id="prod"><span>产品</span></a></li>
	<li>|</li>
	<li title="03" ><a href="###" title="公司" id="ent"><span>公司</span></a></li>
	<li>|</li>
	<li title="04" ><a href="###" title="客户" id="customer"><span>客户</span></a></li>
	<li>|</li>
	<li title="05" ><a href="###" title="交易" id="tx"><span>交易</span></a></li>
	<li>|</li>
	<li title="06" ><a href="###" title="旺铺" id="vip"><span>旺铺</span></a></li>
	<li>|</li>
	<li title="07" ><a href="###" title="资讯" id="news"><span>资讯</span></a></li>
	<li>|</li>
	<li title="08" ><a href="###" title="银行" id="bank"><span>账户</span></a></li>
	<li>|</li>
	<li title="09" ><a href="###" title="账号" id="acc"><span>账号</span></a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="menu"><a href="###" onclick="showPopWinList();" class="more"><i></i>查看更多</a>
<ul id="topMenu">
	<li class="xinxi" id="1"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("1")){%>class="current"<%} %> href="<s:url value="/customer/message/listMessage"/>" title="站内信">
		<img src="<s:url value="/customer/images/nav/znx.png"/>" >站内信</a></li>
	<li class="chanpin" id="2"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("2")){%>class="current"<%} %> href="<s:url value="/customer/product/addProduct"/>" title="产品">
		<img src="<s:url value="/customer/images/nav/cp.png"/>" >产品</a></li>
	<li class="kehu" id="3"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("3")){%>class="current"<%} %> href="<s:url value="/customer/group/listGroup"/>" title="客户">
		<img src="<s:url value="/customer/images/nav/kh.png"/>" >客户</a></li>
	<li class="jiaoyi" id="4"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("4")){%>class="current"<%} %> href="<s:url value="/customer/order/listOrder"/>" title="交易">
		<img src="<s:url value="/customer/images/nav/jy.png"/>" >交易</a></li>
	<li class="guanzhu" id="5"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("5")){%>class="current"<%} %> href="<s:url value="/customer/concern/listTagConcern"/>" title="关注">
		<img src="<s:url value="/customer/images/nav/gz.png"/>" >关注</a></li>
	<li class="zixun" id="6"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("6")){%>class="current"<%} %> href="<s:url value="/customer/news/listNews"/>" title="资讯">
		<img src="<s:url value="/customer/images/nav/zx1.png"/>" >资讯</a></li>
	<li class="yinhang" id="7"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("7")){%>class="current"<%} %> href="<s:url value="/account/view_balance"/>" title="银行">
		<img src="<s:url value="/customer/images/nav/yh.png"/>" >账户</a></li>
	<li class="zhanghao" id="8"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("8")){%>class="current"<%} %> href="<s:url value="/user/detailUserInfo"/>" title="账号">
		<img src="<s:url value="/customer/images/nav/zh.png"/>" >账号</a></li>
	<li class="gongsi" id="9"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("9")){%>class="current"<%} %> href="<s:url value="/customer/ent/listEnt"/>" title="公司">
		<img src="<s:url value="/customer/images/nav/gs.png"/>" >公司</a></li>
</ul>
<ul id="topMenuList">
	<li class="xinxi" id="11"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("11")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/addMessage" title="发站内信">
		<img src="<s:url value="/customer/images/nav/znx1.png"/>">发站内信</a></li>
	<li class="xinxi" id="12"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("1")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/listMessage" title="收件箱" >
		<img src="<s:url value="/customer/images/nav/znx2.png"/>">收件箱</a></li>
	<li class="xinxi" id="13"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("13")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/sentMessage" title="发件箱"> 
		<img src="<s:url value="/customer/images/nav/znx3.png"/>">发件箱</a></li>
	<li class="xinxi" id="14"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("14")){%>class="current"<%} %>  href="<%=request.getContextPath()%>/customer/message/groupMessage" title="群发站内信">
		<img src="<s:url value="/customer/images/nav/znx4.png"/>">群发站内信</a></li>

	<li class="chanpin" id="21"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("2")){%>class="current"<%} %> href="<s:url value="/customer/product/addProduct"/>" title="发布产品">
		 <img src="<s:url value="/customer/images/nav/cp1.png"/>">发布产品</a></li>
	<li class="chanpin" id="22"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("22")){%>class="current"<%} %> href="<s:url value="/customer/product/listProductManage"/>" title="管理产品">
		<img src="<s:url value="/customer/images/nav/cp2.png"/>">管理产品</a></li>
	<li class="chanpin" id="23"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("23")){%>class="current"<%} %> href="<s:url value="/customer/product/category/list"/>" title="产品分类">
		<img src="<s:url value="/customer/images/nav/cp3.png"/>">产品分类</a></li>
	<li class="chanpin" id="24"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("24")){%>class="current"<%} %> href="<s:url value="/customer/product/brand/list"/>" title="管理品牌">
		<img src="<s:url value="/customer/images/nav/cp4.png"/>">管理品牌</a></li>
	<li class="xiangce" id="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >相册</a></li>
	<!-- <li class="xiangce" id="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >收藏分类设置</a></li>
	<li class="xiangce" id="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >商城商品收藏</a></li>
		<li class="xiangce" id="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >旺铺商品收藏</a></li>
		<li class="xiangce" id="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >企业旺铺收藏</a></li>
	<li class="chanpin" id="26"><a href="#" title="促销设置">
		<img src="<s:url value="/customer/images/nav/cp5.png"/>">促销设置</a></li>-->
	
	<li class="kehu" id="31"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("31")){%>class="current"<%} %> href="<s:url value="/customer/group/listCustomer"/>" title="客户管理" >
		 <img src="<s:url value="/customer/images/nav/kh1.png"/>">客户管理</a></li>
	<li class="kehu" id="32"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("32")){%>class="current"<%} %>  href="<s:url value="/customer/group/addGroup"/>" title="添加群组"> 
		 <img src="<s:url value="/customer/images/nav/kh2.png"/>">添加群组</a></li>
	<li class="kehu" id="33"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("3")){%>class="current"<%} %>  href="<s:url value="/customer/group/listGroup"/>" title="群组列表"> 
		<img src="<s:url value="/customer/images/nav/kh3.png"/>">群组列表</a></li>
 	<!-- <li class="kehu" id="34"><a href="<s:url value="/customer/group/listPreferential"/>" title="优惠设置"> 
 		<img src="<s:url value="/customer/images/nav/kh4.png"/>">优惠设置</a></li> -->
	
	<li class="jiaoyi" id="4"><a <% if(request.getParameter("submenu")!=null && (request.getParameter("submenu").equals("4")||request.getParameter("submenu").equals("41"))){%>class="current"<%} %> href="<s:url value="/customer/order/listOrder"/>" title="订单管理">
		<img src="<s:url value="/customer/images/nav/jy1.png"/>">订单管理 </a></li>
	<li class="jiaoyi" id="42"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("42")){%>class="current"<%} %> href="<s:url value="/customer/order/listWaitPayOrder"/>" title="待付款订单">
		<img src="<s:url value="/customer/images/nav/jy2.png"/>">待付款订单</a></li>
	<li class="jiaoyi" id="43"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("43")){%>class="current"<%} %> href="<s:url value="/customer/order/listUnreceivedOrder"/>" title="待收货商品">
		<img src="<s:url value="/customer/images/nav/jy3.png"/>">待收货</a></li>
	<li class="jiaoyi" id="44"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("44")){%>class="current"<%} %> href="<s:url value="/customer/order/listFinishOrder"/>" title="已收货商品">
		<img src="<s:url value="/customer/images/nav/jy4.png"/>">已收货</a></li>
	<li class="jiaoyi" id="45"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("45")){%>class="current"<%} %> href="<s:url value="/customer/order/listBuyerReturnOrder"/>" title="退货商品">
		<img src="<s:url value="/customer/images/nav/jy5.png"/>">退货商品 </a></li>
	<li class="jiaoyi" id="46"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("46")){%>class="current"<%} %> href="<s:url value="/customer/order/waitSendGoodsOrder"/>" title="待发货商品">
		<img src="<s:url value="/customer/images/nav/jy6.png"/>">待发货</a></li>
	<li class="jiaoyi" id="47"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("47")){%>class="current"<%} %> href="<s:url value="/customer/order/listReturnOrder"/>" title="待确认退货">
		<img src="<s:url value="/customer/images/nav/jy7.png"/>">待确认退货</a></li>
	<li class="jiaoyi" id="48"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("48")){%>class="current"<%} %> href="<s:url value="/customer/order/listInvoice"/>" title="发票">
		<img src="<s:url value="/customer/images/nav/jy8.png"/>">发票</a></li>

	<li class="guanzhu" id="51"><a  <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("5")){%>class="current"<%} %> href="<s:url value="/customer/concern/listTagConcern"/>" title="关注标签">
		<img src="<s:url value="/customer/images/nav/gz1.png"/>">关注标签</a></li>
	<li class="guanzhu" id="52"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("52")){%>class="current"<%} %> href="<s:url value="/customer/concern/listUserConcern"/>" title="关注企业">
		<img src="<s:url value="/customer/images/nav/gz2.png"/>">关注企业</a></li>

	<li class="zixun" id="61"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("61")){%>class="current"<%} %> href="<s:url value="/customer/news/addNews"/>"title="发布资讯">
		<img src="<s:url value="/customer/images/nav/zx4.png"/>">发布资讯 </a></li>
	<li class="zixun" id="62"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("6")){%>class="current"<%} %> href="<s:url value="/customer/news/listNews"/>"title="管理资讯">
		<img src="<s:url value="/customer/images/nav/zx1.png"/>">管理资讯 </a></li>
	<li class="zixun" id="63"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("63")){%>class="current"<%} %> href="<s:url value="/customer/news/listCategorys"/>"title="资讯分类">
		<img src="<s:url value="/customer/images/nav/zx3.png"/>">资讯分类 </a></li>
	<li class="zixun" id="64"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("64")){%>class="current"<%} %> href="<s:url value="/customer/news/showIndNews"/>"title="行业资讯">
		<img src="<s:url value="/customer/images/nav/zx2.png"/>">行业资讯 </a></li>

	<li class="yinhang" id="71"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("7")){%>class="current"<%} %> href="<s:url value="/account/view_balance"/>"title="账户余额">
		<img src="<s:url value="/customer/images/nav/yh1.png"/>">账户余额 </a></li>
	<li class="yinhang" id="72"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("72")){%>class="current"<%} %> href="<s:url value="/account/alter_pass_input"/>"title="支付密码">
		<img src="<s:url value="/customer/images/nav/yh2.png"/>">支付密码</a></li>
	<li class="yinhang" id="73"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("73")){%>class="current"<%} %> href="<s:url value="/account/rebates"/>"title="返利记录">
		<img src="<s:url value="/customer/images/nav/yh3.png"/>">返利记录 </a></li>
	<li class="yinhang" id="74"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("74")){%>class="current"<%} %> href="<s:url value="/account/recharge"/>"title="账户充值">
		<img src="<s:url value="/customer/images/nav/yh4.png"/>">账户充值 </a></li>
	<li class="yinhang" id="75"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("75")){%>class="current"<%} %> href="<s:url value="/account/view_recharge"/>"title="充值记录">
		<img src="<s:url value="/customer/images/nav/yh5.png"/>">充值记录 </a></li>
	<li class="yinhang" id="76"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("76")){%>class="current"<%} %> href="<s:url value="/account/list_recharge"/>"title="消费记录">
		<img src="<s:url value="/customer/images/nav/yh6.png"/>">消费记录 </a></li>
	<li class="yinhang" id="77"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("77")){%>class="current"<%} %> href="<s:url value="/statement/listStatement"/>"title="对账单">
		<img src="<s:url value="/customer/images/nav/yh6.png"/>">对账单 </a></li>
	
	<li class="zhanghao" id="81"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("8")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/view_userinfo.jsp"title="用户信息">
		 <img src="<s:url value="/customer/images/nav/zh1.png"/>">用户信息 </a></li>
	<li class="zhanghao" id="82"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("82")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/change_usercode.jsp"title="修改密码">
		<img src="<s:url value="/customer/images/nav/zh2.png"/>">修改密码 </a></li>
	<li class="zhanghao" id="83"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("83")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/view_PwdQuestion.jsp"title="密保问题">
		<img src="<s:url value="/customer/images/nav/zh3.png"/>">密保问题 </a></li>
	<li class="zhanghao" id="84"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("84")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/inputAudict"title="用户验证">
		<img src="<s:url value="/customer/images/nav/zh4.png"/>">用户验证 </a></li>
	<li class="zhanghao" id="85"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("85")){%>class="current"<%} %> href="<s:url value="/customer/favourite/listFavourite"/>" title="商城产品收藏">
		<img src="<s:url value="/customer/images/nav/photo.png"/>" >收藏</a></li>
	
	<li class="gongsi" id="91"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("9")){%>class="current"<%} %> href="<s:url value="/customer/ent/listEnt"/>"title="公司信息">
		<img src="<s:url value="/customer/images/nav/gs1.png"/>">公司信息 </a></li>
	<li class="gongsi" id="92"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("92")){%>class="current"<%} %> href="<s:url value="/customer/ent/listEntContact"/>"title="公司联系人">
		<img src="<s:url value="/customer/images/nav/gs2.png"/>">公司联系人 </a></li>
	<li class="gongsi" id="93"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("93")){%>class="current"<%} %> href="<s:url value="/customer/ent/listintroductionEnt"/>"title="公司简介">
		<img src="<s:url value="/customer/images/nav/gs3.png"/>">公司简介 </a></li>
	<li class="gongsi" id="94"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("94")){%>class="current"<%} %> href="<s:url value="/customer/ent/viewTechnicalEnt"/>"title="技术实力">
		<img src="<s:url value="/customer/images/nav/gs4.png"/>">技术实力 </a></li>
	<li class="gongsi" id="95"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("95")){%>class="current"<%} %> href="<s:url value="/customer/cert/listCertificate"/>"title="公司证书">
		<img src="<s:url value="/customer/images/nav/gs5.png"/>">公司证书 </a></li>
	<li class="gongsi" id="96"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("96")){%>class="current"<%} %> href="<s:url value="/customer/logo/viewLogo"/>"title="公司LOGO">
		<img src="<s:url value="/customer/images/nav/gs6.png"/>">公司 LOGO</a></li>
	
	<li class="vip" id="101"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("101")){%>class="current"<%} %> href="http://<s:property value="#session.jaduser.username"/>.qb35.com/index" target="_blank" title="在线预览">
		<img src="<s:url value="/customer/images/nav/wp1.png"/>">在线预览 </a></li>
	<li class="vip" id="102"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("102")){%>class="current"<%} %> href="<s:url value="/maintain"/>/<s:property value="#session.jaduser.username"/>/index" target="_blank" title="外观设计">
		<img src="<s:url value="/customer/images/nav/wp2.png"/>">外观设计 </a></li>
	<!-- <li class="vip" id="103"><a href="#" target="_blank" title="优化设置"><img src="<s:url value="/customer/images/nav/wp3.png"/>">优化设置 </a></li>-->
	<li class="vip" id="101"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("89")){%>class="current"<%} %> href="<s:url value="/customer/vipsite/listDomain"/>" title="域名绑定">
		<img src="<s:url value="/customer/images/nav/wp4.png"/>">域名绑定 </a></li>
	<!-- <li class=vip" id="104"><a href="#" target="_blank" title="浏览分析"><img src="<s:url value="/customer/images/nav/wp5.png"/>">浏览分析 </a></li> -->
</ul>
</div>



</body>
</html>