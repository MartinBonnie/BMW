<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		//$(".sideC li:odd").addClass("odd");
		//$(".table tr:even").addClass("odd");
		//$(".table tr th:last").addClass("last");
		
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
                            <li class="current"><a href="product.jsp" title="产品"><span>产品</span></a></li>
                            <li>|</li>
                            <li><a href="../order/order.jsp" title="交易"><span>交易</span></a></li>
                            <li>|</li>
                            <li><a href="../news/news.jsp" title="资讯"><span>资讯</span></a></li>
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
                <li><a href="../product/addProduct.jsp" title="产品"><img src="../content/images/nav/cp1.png" />发布产品</a></li>
           		<li><a href="../product/product.jsp" title="产品"><img src="../content/images/nav/cp2.png" />管理产品</a></li>
            	<li><a href="../product/product.jsp" title="产品"><img src="../content/images/nav/cp3.png" />产品分类</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="container"  class="clearfix">
        	<div class="sideRight">
            	<div class="title">
                    <ul>
                        <li class="current"><a href="#"><span>产品搜索次数统计</span></a></li>
                        <li><a href="#"><span>产品搜索排行榜</span></a></li>
                    </ul>
                </div>
                <div class="tab">    
                	<a href="#" class="choose" onclick="$(this).addClass('chooseC')">筛选游戏</a>
                    <ul>
                        <li class="current"><a href="#"><span>已发布上网</span></a></li>
                        
                        <li><a href="#"><span>审核中</span></a></li>
                        
                        <li><a href="#"><span>审核未通过</span></a></li>
                        
                        <li><a href="#"><span>已过期</span></a></li>
                    </ul>
                </div>
                <div class="sear">              
                	<ul>
                    	<li><label>产品分类: </label><select><option>所有分类</option></select></li>
                        <li><label>产品类型: </label><select><option>所有分类</option></select></li>
                        <li><label>名称/型号: </label><input type="text" class="txt" /></li>
                        <li><label>广告产品: </label><select><option>所有分类</option></select></li>
                        <li><input type="button" value="搜索"  class="btn"/></li>
                    </ul>
                </div>
                <table class="table">
                	<thead>
                    	<tr> 	         	        	              	     
                        	<th>图片</th>
                            <th>标题</th>
                            <th>发布时间</th>
                            <th>调序</th>
                            <th>移序</th>
                            <th>插序</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                        	<td><img src="../content/images/pic.jpg" /></td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td><img src="../content/images/pic.jpg" /></td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td><img src="../content/images/pic.jpg" /></td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td><img src="../content/images/pic.jpg" /></td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td><img src="../content/images/pic.jpg" /></td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                    </tbody>
                </table>
                <div class="page"><a href="#">&lt;&lt;</a><a href="#">1</a><a href="#" class="current">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">&gt;&gt;</a></div>
            </div>
        
        	<div class="sideLeft">
            	<ul>
                	<li class="current"><a href="#">发布产品</a></li>
                    <li><a href="#">管理产品</a></li>
                    <li><a href="#">产品分类</a></li>
                    <li><a href="#">管理品牌</a></li>
                    <li><a href="#">促销设置</a></li>
                </ul>
            </div>
            
            
            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 版权所有</div>
</body>
</html>
