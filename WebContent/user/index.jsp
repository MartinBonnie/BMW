<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		$(".sideC li:odd").addClass("odd")
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
            	<h1>我的后台</h1><p><span>你好<em>[<s:property value="#session.bmwUser.name"/>]</em></span><a href="logout">退出</a><span>|</span><a href="#">返回</a><span>|</span><a href="#">管理账号</a><span>|</span><a href="#"><img src="content/images/email.png" />消息提醒（<strong>2</strong>）</a> </p>
            </div>
            <div id="nav">
            	<div class="r">
                	<div class="l">
                    	<ul>
                        	<li class="current"><a href="index.jsp" title="首页"><span>首页</span></a></li>
                            <li>|</li>
                            <li><a href="product/product.jsp" title="产品"><span>产品</span></a></li>
                            <li>|</li>
                            <li><a href="order/order.jsp" title="交易"><span>交易</span></a></li>
                            <li>|</li>
                            <li><a href="news/news.jsp" title="资讯"><span>资讯</span></a></li>
                            <li>|</li>
                            <li><a href="bank/bank.jsp" title="银行"><span>银行</span></a></li>
                            <li>|</li>
                            <li><a href="account/account.jsp" title="账号"><span>账号</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
         </div>
        
        
         <div class="menu">
            <ul>
                <li><a href="" title="首页"><img src="content/images/nav/1.png" />首页</a></li>
                <li><a href="product/product.jsp" title="产品"><img src="content/images/nav/2.png" />产品</a></li>
                <li><a href="order/order.jsp" title="交易"><img src="content/images/nav/4.png" />交易</a></li>
                <li><a href="news/news.jsp" title="资讯"><img src="content/images/nav/6.png" />资讯</a></li>
                <li><a href="bank/bank.jsp" title="银行"><img src="content/images/nav/7.png" />银行</a></li>
                <li><a href="account/account.jsp" title="账号"><img src="content/images/nav/1.png" />账号</a></li>
            </ul>
        </div>
        
        <div class="personal border clearfix">
        	<div class="l">
            	<span class="cov"><img src="content/images/pic.jpg" /></span>
                <h2>将衣袖</h2>
                <p><img src="content/images/buy.gif" /> 卖家</p>
            </div>
            <div class="c">
            	<ul>
                	<li>电子邮箱：wl043249@163.com</li>
                    <li>用户名：一休哥哥</li>
                    <li>电子邮箱：wl043249@163.com</li>
                    <li>电子邮箱：wl043249@163.com</li>
                </ul>
            </div>
            <div class="r"><a href="#">【编辑修改个人资料】</a></div>
        </div>
        
        
        <div id="container"  class="clearfix">
        	<div class="clearfix">
                <div class="sideL">
                    <div class="box border">
                        <div class="area border">
                            <h3>平台资讯</h3>
                            <ul>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="box border cyellow">
                        <div class="area border">
                            
                            <ul>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                               
                            </ul>
                        </div>
                    </div>
                    
                </div>
                
                <div class="sideC">
                    <div class="box border trends">
                        <div class="area border">
                            <h3><img src="content/images/t1.gif" />平台资讯</h3>
                            <ul>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                               
                               
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="sideR">
                    <div class="banner"><a href="#"><img src="content/images/pic1.jpg" width="255" /></a></div>
                    <div class="box border">
                        <div class="area border">
                            <ul>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                 <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                                <li><a href="#">煤炭涨价等因素致长三角电荒加剧 </a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <div class="box border clearfix">
                <div class="area border">
                    <h3>平台统计</h3>
                   <img src="content/images/pic2.jpg" />
                </div>
            </div>
            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 版权所有</div>
</body>
</html>
