<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link href="../content/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
window.UEDITOR_HOME_URL="/ueditor/";
</script>
<script type="text/javascript" charset="utf-8" src="/ueditor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all.js"></script>
<script src="../content/js/jquery.js"></script>
<script src="../content/js/slider.js"></script>
<script>
	$(function(){
		//初始化ueditor
		//$("#editor").css({width:"100%";height:"250px"});
	    window.UEDITOR_CONFIG.initialFrameWidth=650;
	    window.UEDITOR_CONFIG.initialFrameHeight=250;
		UE.getEditor('editor');
		
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
            	<h1>我的后台</h1><p><span>你好<em>[<s:property value="#session.bmwUser.name"/>]</em></span><a href="#">退出</a><span>|</span><a href="#">返回</a><span>|</span><a href="#">管理账号</a><span>|</span><a href="#"><img src="content/images/email.png" />消息提醒（<strong>2</strong>）</a> </p>
            </div>
            <div id="nav">
            	<div class="r">
                	<div class="l">
                    	<ul>
                        	<li class="current"><a href="../index.jsp" title="首页"><span>首页</span></a></li>
                            <li>|</li>
                            <li><a href="../product/product.jsp" title="产品"><span>产品</span></a></li>
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
                        <li class="current"><a href="#"><span>发布产品</span></a></li>                        
                    </ul>
                </div>
                 
                <table class="table1">
                	<thead>                    	
                        <tr>	                             	
                        	<th>产品类型：</th><td><select><option>普通</option></select></td>
                            <th>查看权限：</th><td><select><option>访问者可见</option></select></td>
                        </tr>
                        <tr>	                             	
                        	<th><span class="cred">*</span>产品名称：</th><td><input type="text" style="width:200px" class="txt" /></td>
                            <th><span class="cred">*</span>产品分类：</th><td><input type="text" style="width:200px" class="txt" /></td>
                        </tr>
                        <tr>	                             	
                        	<th>产品类型：</th><td><input type="text" style="width:200px" class="txt" /></td>
                            <th><span class="cred">*</span>关键字：</th><td><input type="text" style="width:200px" class="txt" /></td>
                        </tr>
                        <tr>	                             	
                        	<th>产品价格：</th><td><input type="text" style="width:200px" class="txt" /></td>
                            <th>技数单位：</th><td><input type="text" style="width:200px" class="txt" /></td>
                        </tr>
                        <tr>	                             	
                        	<th><span class="cred">*</span>联系人：</th><td colspan="3"><input type="text" style="width:200px" class="txt" /></td>
                          
                        </tr>
                        <tr>	                             	
                        	<th><span class="cred">*</span>产品图片：</th><td colspan="3">
                            	<div class="uploadPic">
                                	<div class="tab">    
                                      	<ul>
                                            <li class="current"><a href="#" onclick="show(0)"><span>上传新图片</span></a></li>
                                            <li><a href="#" onclick="show(1)"><span>从图片空间中选择</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="picList" id="picList" >
                                    	<ul>
                                        	<li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                            <li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                            <li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                            <li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                            <li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                            <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                           
                                        </ul>
                                    </div>
                                    <div class="pic_zoom"style="display:none">
                                    	<div class="area clearfix">
                                        	<ul>
                                                <li class="current"><a href="#"><img src="content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a></li>
                                               
                                            </ul>
                                        </div>
                                    	 <div class="page"><a href="#">&lt;&lt;</a><a href="#">1</a><a href="#" class="current">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">&gt;&gt;</a></div>
                                        <div class="picList" >
                                            <ul>
                                                <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                                <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                                <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                                <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                                <li><a href="#"><img src="../content/images/pic.jpg" /></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                                <li><a href="#"><i>暂无图片</i></a><a href="#" class="fl"><input type="file" />上传图片</a></li>
                                               
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                               <script>
                               		function show(n){
										$(".tab li").removeClass("current");
										$(".pic_zoom").hide();
										$("#picList").hide();
										if(n==0){
											$(".tab li").eq(0).addClass("current");
									
											$("#picList").show();
										}
										if(n==1){
											$(".tab li").eq(1).addClass("current");
													$(".pic_zoom").show();
										}
									}
                               </script>
                                
                            </td>
                          
                        </tr>
                         <tr>
                        	<th>产品描述</th>
                            <td colspan="3">
                           	<textarea id=editor name=editor></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<th>&nbsp;</th>
                            <td colspan="3"><input type="button" class="sure"  value="确定"/></td>
                        </tr>
                    </thead>
                </table>
                
                
               
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
<div id="foot">Copyright © 2000-2011 泰斗设计室版权所有</div>
</body>
</html>
