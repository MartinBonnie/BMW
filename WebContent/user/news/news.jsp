<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link href="../content/css/css.css" rel="stylesheet" type="text/css" />
<script src="../content/js/jquery.js"></script>
<script src="../content/js/slider.js"></script>
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
            	<h1>我的后台</h1><p><span>你好<em>[<s:property value="#session.bmwUser.name"/>]</em></span><a href="../logout">退出</a><span>|</span><a href="#">返回</a><span>|</span><a href="#">管理账号</a><span>|</span><a href="#"><img src="../content/images/email.png" />消息提醒（<strong>2</strong>）</a> </p>
            </div>
            <div id="nav">
            	<div class="r">
                	<div class="l">
                    	<ul>
                        	<li><a href="../index.jsp" title="首页"><span>首页</span></a></li>
                            <li>|</li>
                            <li><a href="../product/product.jsp" title="产品"><span>产品</span></a></li>
                            <li>|</li>
                            <li><a href="../order/order.jsp" title="交易"><span>交易</span></a></li>
                            <li>|</li>
                            <li class="current"><a href="../news/news.jsp" title="资讯"><span>资讯</span></a></li>
                            <li>|</li>
                            <li><a href="../bank/bank.jsp" title="银行"><span>银行</span></a></li>
                            <li>|</li>
                            <li><a href="../account/account.jsp" title="账号"><span>账号</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
         </div>
        
        
         <div class="menu">
            <ul>
                 <li><a href="../news/news.jsp" title="资讯"><img src="../content/images/nav/6.png" />资讯</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="container"  class="clearfix">
        	<div class="sideRight">
            	<div class="title">
                    <ul>
                        <li class="current"><a href="#"><span>资讯点击排行榜</span></a></li>
                        <li><a href="#"><span>资讯搜索排行榜</span></a></li>
                    </ul>
                </div>
                <div class="newsList">
                	<ul>
                    	<li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                        <li><span><a href="#">编辑</a> | <a href="#">删除</a></span><a href="#">[春天有礼] 今天梦想大奖：运动休闲品牌EXR服装两套</a></li>
                    </ul>
                </div>
                
                
                <div class="page"><a href="#">&lt;&lt;</a><a href="#">1</a><a href="#" class="current">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">&gt;&gt;</a></div>
            </div>
        
        	<div class="sideLeft">
            	<ul>
                	<li class="current"><a href="#">发布资讯</a></li>
                    <li><a href="#">管理资讯</a></li>
                    <li><a href="#">产品分类</a></li>
                    <li><a href="#">定制资讯</a></li>
                    
                </ul>
            </div>
            
            







            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 版权所有</div>
</body>
</html>
