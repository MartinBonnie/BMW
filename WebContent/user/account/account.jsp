<<<<<<< HEAD:WebContent/user/account.jsp
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link href="content/css/css.css" rel="stylesheet" type="text/css" />
<script src="content/js/jquery.js"></script>
<script src="content/js/slider.js"></script>
<script>
	$(function(){
		$("#nav li a").click(function(){
			$("#nav li").removeClass("current");
			$(this).parent().addClass("current")
		})
		$(".sideC li:odd").addClass("odd");
		$(".table tr:even").addClass("odd");
		$(".table tr th:last").addClass("last");
		
	})
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 .menu img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->
</head>

<body>
<div class="wraper clearfix ">
    <div id="wrap">
    	<div id="header">
        	<div class="search">
            	<input type="text" class="txt" value="请输入关键字" /><input type="button" value="搜索"  class="btn"/>
            </div>
        	<div class="topbar">
            	<h1>我的后台</h1><p><span>你好<em><s:property value="#session.bmwUser.name"/></em></span><a href="logout">退出</a><span>|</span><a href="#">返回</a><span>|</span><a href="#">管理账号</a><span>|</span><a href="#"><img src="content/images/email.png" />消息提醒（<strong>2</strong>）</a> </p>
            </div>
            <div id="nav">
            	<div class="r">
                	<div class="l">
                    	<ul>
                        	<li class="current"><a href="#" title="首页"><span>首页</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="产品"><span>产品</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="客户"><span>客户</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="交易"><span>交易</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="旺铺"><span>旺铺</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="资讯"><span>资讯</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="银行"><span>银行</span></a></li>
                            <li>|</li>
                            <li><a href="#" title="账号"><span>账号</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
         </div>
        
        
         <div class="menu">
         	<a href="#" class="more"><i></i>查看更多</a>
            <ul>
                <li><a href="index.jsp" title="首页"><img src="content/images/nav/1.png" />首页</a></li>
                <li><a href="product.jsp" title="产品"><img src="content/images/nav/2.png" />产品</a></li>
                <li><a href="customer.jsp" title="客户"><img src="content/images/nav/3.png" />客户</a></li>
                <li><a href="order.jsp" title="交易"><img src="content/images/nav/4.png" />交易</a></li>
                <li><a href="shop.jsp" title="旺铺"><img src="content/images/nav/5.png" />旺铺</a></li>
                <li><a href="news.jsp" title="资讯"><img src="content/images/nav/6.png" />资讯</a></li>
                <li><a href="bank.jsp" title="银行"><img src="content/images/nav/7.png" />银行</a></li>
                <li><a href="account.jsp" title="账号"><img src="content/images/nav/1.png" />账号</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="container"  class="clearfix">
        	<div class="sideRight">
            	<div class="title">
                    <ul>
                        <li class="current"><a href="#"><span>个人信息列表</span></a></li>
                        
                    </ul>
                </div>
                
                <table class="table1">
                	<thead>
                    	<tr>	                             	
                        	<th width="60">主营产品: </th><td>销售:手机 采购</td>
                            <th width="60">主营行业: </th><td>通信产品</td>
                        </tr>
                        <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                        <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                        <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                        <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                         <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                         <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                         <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                         <tr>	                             	
                        	<th>主营产品: </th><td>销售:手机 采购</td>
                            <th>主营行业: </th><td>通信产品</td>
                        </tr>
                    </thead>
                </table>
                
                
            </div>
        
        	<div class="sideLeft">
				<ul>
                	<li class="current"><a href="editUser">个人信息管理</a></li>
                    <li><a href="#">账户名密码管理</a></li>
                    
                </ul>
            </div>
            
            
            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 版权所有</div>
</body>
</html>

