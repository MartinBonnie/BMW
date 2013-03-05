<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
var IsFixMap = {};
$(document).ready(function(){
	$(".scroll a").each(function() {
		$(this).bind("click", function() {
			var parent = $(this);
				var link = parent.attr("href")+"?cur="+ parent.parent().parent().attr("title")+"&submenu="+parent.parent().attr("title");
				parent.attr("href",link);
				return true;
		});
	});
	
});
</script>
<div id="foot">浙ICP备&nbsp;&nbsp; Copyright @2011 泰斗实验室 版权所有</div>
<div id="popwin_wrap" class="popwin_wrap" style="display:none">
    <div class="poping">
    	<a href="javascript:" onclick="$(this).parent().parent().hide()" class="close"></a>
    	<h3>全部应用</h3>
        <div class="scroll">
            <div class="area">
                <h4>产品管理</h4>
                <ul class="clearfix" title="02" id="cpin">
                    <li title="21"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("2")){%>class="current"<%} %> href="<s:url value="/customer/product/addProduct"/>" title="发布产品"><img src="<s:url value="/customer/images/nav/cp1.png"/>" />发布产品</a></li>
                    <li title="22"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("22")){%>class="current"<%} %> href="<s:url value="/customer/product/listProductManage"/>" title="管理产品"><img src="<s:url value="/customer/images/nav/cp2.png"/>" />管理产品</a></li>
                    <li title="23"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("23")){%>class="current"<%} %> href="<s:url value="/customer/product/category/list"/>" title="产品分类"><img src="<s:url value="/customer/images/nav/cp3.png"/>" />产品分类</a></li>
                    <li title="24"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("24")){%>class="current"<%} %> href="<s:url value="/customer/product/brand/list"/>" title="管理品牌"><img src="<s:url value="/customer/images/nav/cp4.png"/>" />管理品牌</a></li>
                    <li title="25"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("25")){%>class="current"<%} %> href="<s:url value="/customer/album/listAlbum"/>" title="相册"><img src="<s:url value="/customer/images/nav/photo.png"/>" >相册</a></li>
                    <!--<li title=""><a  href="#" title="促销设置"><img src="<s:url value="/customer/images/nav/cp5.png"/>" />促销设置</a></li> -->
              </ul>
               
            </div>
            <div class="area">
                <h4>公司管理</h4>
                <ul class="clearfix" title="03" id="gsi">
                    <li title="91"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("9")){%>class="current"<%} %> href="<s:url value="/customer/ent/listEnt"/>" title="公司信息"><img src="<s:url value="/customer/images/nav/gs1.png"/>" />公司信息</a></li>
                    <li title="92"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("92")){%>class="current"<%} %> href="<s:url value="/customer/ent/listEntContact"/>" title="公司联系人"><img src="<s:url value="/customer/images/nav/gs2.png"/>" />公司联系人</a></li>
                    <li title="93"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("93")){%>class="current"<%} %> href="<s:url value="/customer/ent/listintroductionEnt"/>" title="公司简介"><img src="<s:url value="/customer/images/nav/gs3.png"/>" />公司简介</a></li>
                    <li title="94"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("94")){%>class="current"<%} %> href="<s:url value="/customer/ent/viewTechnicalEnt"/>" title="技术实力"><img src="<s:url value="/customer/images/nav/gs4.png"/>" />技术实力</a></li>
                    <li title="95"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("95")){%>class="current"<%} %> href="<s:url value="/customer/cert/listCertificate"/>" title="公司证书"><img src="<s:url value="/customer/images/nav/gs5.png"/>" />公司证书</a></li>
                    <li title="96"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("96")){%>class="current"<%} %> href="<s:url value="/customer/logo/viewLogo"/>" title="公司LOGO"><img src="<s:url value="/customer/images/nav/gs6.png"/>" />公司LOGO</a></li>
               </ul>
               
            </div>
            <div class="area">
                <h4>客户管理</h4>
                <ul class="clearfix" title="04" id="khu">
                    <li title="31"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("31")){%>class="current"<%} %> href="<s:url value="/customer/group/listCustomer"/>" title="客户管理"><img src="<s:url value="/customer/images/nav/kh1.png"/>" />客户管理</a></li>
                    <li title="32"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("32")){%>class="current"<%} %> href="<s:url value="/customer/group/addGroup"/>" title="添加群组"><img src="<s:url value="/customer/images/nav/kh2.png"/>" />添加群组</a></li>
                    <li title="33"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("3")){%>class="current"<%} %> href="<s:url value="/customer/group/listGroup"/>" title="群组列表"><img src="<s:url value="/customer/images/nav/kh3.png"/>" />群组列表</a></li>
                     <!-- <li title=""><a href="<s:url value="/customer/group/listPreferential"/>" title="优惠设置"><img src="<s:url value="/customer/images/nav/kh4.png"/>" />优惠设置</a></li>-->
               </ul>
               
            </div>
            <div class="area">
                <h4>交易管理</h4>
                <ul class="clearfix" title="05" id="jyi">
                    <li title="41"><a <% if(request.getParameter("submenu")!=null && (request.getParameter("submenu").equals("4")||request.getParameter("submenu").equals("41"))){%>class="current"<%} %> href="<s:url value="/customer/order/listOrder"/>" title="订单管理"><img src="<s:url value="/customer/images/nav/jy1.png"/>" />订单管理</a></li>
                    <li title="42"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("42")){%>class="current"<%} %> href="<s:url value="/customer/order/listWaitPayOrder"/>" title="待付款订单"><img src="<s:url value="/customer/images/nav/jy2.png"/>" />待付款订单</a></li>
                    <li title="43"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("43")){%>class="current"<%} %> href="<s:url value="/customer/order/listUnreceivedOrder"/>" title="待收货"><img src="<s:url value="/customer/images/nav/jy3.png"/>" />待收货商品</a></li>
                    <li title="44"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("44")){%>class="current"<%} %> href="<s:url value="/customer/order/listFinishOrder"/>" title="已收货"><img src="<s:url value="/customer/images/nav/jy4.png"/>" />已收货商品</a></li>
                    <li title="45"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("45")){%>class="current"<%} %> href="<s:url value="/customer/order/listBuyerReturnOrder"/>" title="退货商品"><img src="<s:url value="/customer/images/nav/jy5.png"/>" />退货商品</a></li>
                    <li title="46"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("46")){%>class="current"<%} %> href="<s:url value="/customer/order/waitSendGoodsOrder"/>" title="待发货"><img src="<s:url value="/customer/images/nav/jy6.png"/>" />待发货商品</a></li>
                    <li title="47"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("47")){%>class="current"<%} %> href="<s:url value="/customer/order/listReturnOrder"/>" title="待确认退货"><img src="<s:url value="/customer/images/nav/jy7.png"/>" />待确认退货</a></li>
                    <li title="48"><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("48")){%>class="current"<%} %> href="<s:url value="/customer/order/listInvoice"/>" title="发票"><img src="<s:url value="/customer/images/nav/jy8.png"/>" />发票</a></li>
               </ul>
               
            </div>
            <div class="area">
                <h4>旺铺管理</h4>
                <ul class="clearfix" title="06" id="wpu">
                    <li><a target="_blank" href="<s:url value="/vip"/>/<s:property value="#session.jaduser.username"/>/index" title="在线预览"><img src="<s:url value="/customer/images/nav/wp1.png"/>" />在线预览</a></li>
                    <li title=""><a target="_blank" href="<s:url value="/maintain"/>/<s:property value="#session.jaduser.username"/>/index" title="外观设计"><img src="<s:url value="/customer/images/nav/wp2.png"/>" />外观设计</a></li>
                    <!-- <li title=""><a target="_blank" href="#" title="优化设置"><img src="<s:url value="/customer/images/nav/wp3.png"/>" />优化设置</a></li>
                    <li title=""><a target="_blank" href="#" title="域名绑定"><img src="<s:url value="/customer/images/nav/wp4.png"/>" />域名绑定</a></li>
                    <li title=""><a target="_blank" href="#" title="浏览分析"><img src="<s:url value="/customer/images/nav/wp5.png"/>" />浏览分析</a></li> -->
               </ul>
               
            </div>
            <div class="area">
                <h4>资讯管理</h4>
                <ul class="clearfix" title="07" id="zxun">
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("11")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/addMessage" title="发站内信"><img src="<s:url value="/customer/images/nav/znx1.png"/>" />发站内信</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("1")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/listMessage" title="收件箱"><img src="<s:url value="/customer/images/nav/znx2.png"/>" />收件箱</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("13")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/sentMessage" title="发件箱"><img src="<s:url value="/customer/images/nav/znx3.png"/>" />发件箱</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("14")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/message/groupMessage" title="群发站内信"><img src="<s:url value="/customer/images/nav/znx4.png"/>" />群发站内信</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("5")){%>class="current"<%} %> href="<s:url value="/customer/concern/listTagConcern"/>" title="关注标签"><img src="<s:url value="/customer/images/nav/gz1.png"/>" />关注标签</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("52")){%>class="current"<%} %> href="<s:url value="/customer/concern/listUserConcern"/>" title="关注企业"><img src="<s:url value="/customer/images/nav/gz2.png"/>" />关注企业</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("61")){%>class="current"<%} %> href="<s:url value="/customer/news/addNews"/>" title="发布资讯"><img src="<s:url value="/customer/images/nav/zx4.png"/>" />发布资讯</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("6")){%>class="current"<%} %> href="<s:url value="/customer/news/listNews"/>" title="管理资讯"><img src="<s:url value="/customer/images/nav/zx1.png"/>" />管理资讯</a></li>
               		<li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("63")){%>class="current"<%} %> href="<s:url value="/customer/news/listCategorys"/>" title="资讯分类"><img src="<s:url value="/customer/images/nav/zx3.png"/>" />资讯分类</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("64")){%>class="current"<%} %> href="<s:url value="/customer/news/showIndNews"/>" title="行业资讯"><img src="<s:url value="/customer/images/nav/zx2.png"/>" />行业资讯</a></li>
               </ul>
               
            </div>
            <div class="area">
                <h4>银行管理</h4>
                <ul class="clearfix" title="08" id="yhang">
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("7")){%>class="current"<%} %> href="<s:url value="/account/view_balance"/>" title="账户余额"><img src="<s:url value="/customer/images/nav/yh1.png"/>" />账户余额</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("72")){%>class="current"<%} %> href="<s:url value="/account/alter_pass_input"/>" title="支付密码"><img src="<s:url value="/customer/images/nav/yh2.png"/>" />支付密码</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("73")){%>class="current"<%} %> href="<s:url value="/account/rebates"/>" title="返利记录"><img src="<s:url value="/customer/images/nav/yh3.png"/>" />返利记录</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("74")){%>class="current"<%} %> href="<s:url value="/account/recharge"/>" title="账户充值"><img src="<s:url value="/customer/images/nav/yh4.png"/>" />账户充值</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("75")){%>class="current"<%} %> href="<s:url value="/account/view_recharge"/>" title="充值记录"><img src="<s:url value="/customer/images/nav/yh5.png"/>" />充值记录</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("76")){%>class="current"<%} %> href="<s:url value="/account/list_recharge"/>" title="消费记录"><img src="<s:url value="/customer/images/nav/yh6.png"/>" />消费记录</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("77")){%>class="current"<%} %> href="<s:url value="/statement/listStatement"/>" title="对账单"><img src="<s:url value="/customer/images/nav/yh6.png"/>" />对账单</a></li>
               </ul>
               
            </div>
            <div class="area">
                <h4>帐号管理</h4>
                <ul class="clearfix" title="09" id="zhao">
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("8")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/view_userinfo.jsp" title="用户信息"><img src="<s:url value="/customer/images/nav/zh1.png"/>" />用户信息</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("82")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/change_usercode.jsp" title="修改密码"><img src="<s:url value="/customer/images/nav/zh2.png"/>" />修改密码</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("83")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/account/view_PwdQuestion.jsp" title="密保问题"><img src="<s:url value="/customer/images/nav/zh3.png"/>" />密保问题</a></li>
                    <li title=""><a <% if(request.getParameter("submenu")!=null && request.getParameter("submenu").equals("84")){%>class="current"<%} %> href="<%=request.getContextPath()%>/customer/inputAudict" title="用户验证"><img src="<s:url value="/customer/images/nav/zh4.png"/>" />用户验证</a></li>
               </ul>
               
            </div>
        </div>
    </div>
    <div class="poping_s"></div>
</div>