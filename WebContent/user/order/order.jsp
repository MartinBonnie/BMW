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
                            <li class="current"><a href="../order/order.jsp" title="交易"><span>交易</span></a></li>
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
                <li><a href="../order/order.jsp" title="交易"><img src="../content/images/nav/4.png" />交易</a></li>
            </ul>
        </div>
        
        
        
        
        <div id="container"  class="clearfix">
        	<div class="sideRight">
            	<div class="title">
                    <ul>
                        <li class="current"><a href="#"><span>交易记录列表</span></a></li>
                        
                    </ul>
                </div>
                <table class="table">
                	<thead> 	               	                	        	    	     
                    	<tr> 	         	        	              	     
                        	<th>付费银行</th>
                            <th>付费金额</th>
                            <th>单据号</th>
                            <th>付费时间</th>
                            <th>开始时间</th>
                            <th>截至时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                        	<td>农行</td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td>农行</td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td>农行</td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td>农行</td>
                            <td>ceshi</td>
                            <td>2010-9-18 13:54:21 </td>
                            <td><select><option>1</option></select></td>
                            <td><a href="#">上移</a> <a href="#">下移</a></td>
                            <td><select><option>1</option></select></td>
                            <td class="last"><a href="#">修改</a>|<a href="#">已显示</a>|<a href="#">刷新</a>|<a href="#">删除</a></td>
                        </tr>
                        <tr>
                        	<td>农行</td>
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
                	<li><a href="#" onclick="$(this).parent().addClass('current')"><i></i>我要买</a>
                    	<ul>
                        	<li class="current"><a href="#">购物车</a></li>
                            <li><a href="#">已买到的</a></li>
                            <li><a href="#">历史交易</a></li>
                            <li><a href="#">我的收藏</a></li>
                        </ul>
					</li>
                    <li ><a href="#"  onclick="$(this).parent().addClass('current')"><i></i>账户名密码管理</a>
                    	<ul>
                        	<li ><a href="#">购物车</a></li>
                            <li><a href="#">已买到的</a></li>
                            <li><a href="#">历史交易</a></li>
                            <li><a href="#">我的收藏</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
            
            
            
        </div>
        
        
        
    </div>
    
</div>
<div id="foot">Copyright © 2000-2011 东方五金版权所有</div>
</body>
</html>
