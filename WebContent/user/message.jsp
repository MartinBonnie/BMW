<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$(".sideC li:odd").addClass("odd");
		$(".table tr:even").addClass("odd");
		$(".table tr th:last").addClass("last");
		$(".letterList tr").hover(function(){
			$(this).addClass("hover")
		},
			function(){
			$(this).removeClass("hover")	
			}
		)
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
            	<h1>我的后台</h1><p><span>你好<em>庄程远</em></span><a href="#">退出</a><span>|</span><a href="#">返回</a><span>|</span><a href="#">管理账号</a><span>|</span><a href="#"><img src="content/images/email.png" />消息提醒（<strong>2</strong>）</a> </p>
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
                <li><a href="#" title="交易"><img src="content/images/nav/4.png" />交易</a></li>
                <li><a href="#" title="旺铺"><img src="content/images/nav/5.png" />旺铺</a></li>
                <li><a href="news.jsp" title="资讯"><img src="content/images/nav/6.png" />资讯</a></li>
                <li><a href="#" title="银行"><img src="content/images/nav/7.png" />银行</a></li>
                <li><a href="account.jsp" title="账号"><img src="content/images/nav/1.png" />账号</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="container"  class="clearfix">
        	<div class="sideRight letter">
            	<div class="title">
                    <ul>
                        <li class="current"><a href="#"><span>站内信</span></a></li>
                    </ul>
                </div>
                <div class="tab">
                	<a href="#" class="write_letter">写站内信</a>
                    <div class="fl"><a href="#">全选</a> | <a href="#">删除</a> | <a href="#">全部清空</a></div>
                </div>
                <div class="letterList">
                	<table>
                    	<tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" /></td>
                            <td><img src="content/images/pic.jpg" /></td>
                            <td>
                            	<span class="time">2009-11-11</span>
                                <h4><a href="#">庄程远</a></h4>
                                <p>今天凌晨，鲨鱼奥尼尔通过微博宣布自己即将退役，于是关于鲨鱼的一系列讨论由此展开，其中一个话题就是湖人是否会退役鲨鱼的球衣。不过，关于这个话题的讨论可以暂时告一段落了，因为湖人官方已经明确的表示，他们会退役鲨鱼的球衣。</p>
                            </td>
                        </tr>
                    </table>
                        	
                        <div class="page"><a href="#">&lt;&lt;</a><a href="#">1</a><a href="#" class="current">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">&gt;&gt;</a></div>	
                           
                       
                </div>
                
                
                
                
            </div>
        
        	<div class="sideLeft">
            	<ul>
                	<li class="current"><a href="#">写站内信</a></li>
                    <li><a href="#">收件箱</a></li>
                    <li><a href="#">发件箱</a></li>
                    <li><a href="#">通知</a></li>
                </ul>
            </div>
            
            
            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 版权所有</div>
</body>
</html>
