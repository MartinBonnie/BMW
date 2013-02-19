<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Account Index</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<!-- Internet Explorer Fixes Stylesheet --> 
		<!--[if lte IE 7]>
			<link rel="stylesheet" href="css/ie.css" type="text/css" />
		<![endif]--> 
		<!--[if IE]><script type="text/javascript" src="js/core/excanvas.js"></script><![endif]-->	
		<!-- Internet Explorer .png-fix --> 
		<!--[if IE 6]>
			<script type="text/javascript" src="js/core/DD_belatedPNG_0.0.7a.js"></script>
			<script type="text/javascript">
				DD_belatedPNG.fix('.png_bg, img, li');
			</script>
		<![endif]--> 
		<script type="text/javascript">
			$(document).ready(function() {
				$("#addNewsBtn").click(function(){
					window.location="add";
				});
				$("#submitFormBtn").click(function(){
					var categoryName = $("#categoryName").val();
					var cdesc = $("#cdesc").val();
					var isort = $("#sort").val();
					var belongId = $("#belongId").val();
					if(categoryName==""||cdesc==""){
						$.showPrompt("error","请填写分类名称和描述！");
						return;
					}
					if(isort!=""&&!isort.isDigit()){
						$.showPrompt("error","顺序必须为数字！");
						return;
					}
					var categoryId=$("#categoryId").val();
					if(categoryId==""){//add new category
						$.ajax({
				            type: "post",
				            dataType: 'json',
				            url: "/web/member/news/addNews",
				            data: {
				            	"cdesc": cdesc,
				            	"belongId": belongId,
				            	"sort": isort,
				                "name": categoryName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","添加成功！");
									$("#facebox").hide();
									$('#belongId').select_close();
									$("#pageBody").append("<tr id='tr"+result.tag.categoryId+"'>"+setHtml(result)+"</tr>");
								}
				            },
				            error: function(){
				            	$.showPrompt("error","系统忙，请稍后再试！");
				            }
				        });
					}else{
						$.ajax({
				            type: "post",
				            dataType: 'json',
							url: "/web/member/news/editNews",
				            data: {
				                "categoryId": categoryId,
				                "cdesc": cdesc,
				                "belongId": belongId,
				            	"sort": isort,
				                "name": categoryName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","修改成功！");
									$("#facebox").hide();
									$('#belongId').select_close();
									$("#tr"+categoryId).html(setHtml(result));
								}
				            },
				            error: function(){
				            	$.showPrompt("error","系统忙，请稍后再试！");
				            }
				        });
					}
				});
				
			});
			editNews=function(categoryId,categoryName,cdesc,belongId,sort){
				initTopNews();
				$("#facebox").show();
				$("#formTitle").html("修改分类");
				$("#belongId").val(belongId);
				$("#categoryName").val(categoryName);
				$("#cdesc").val(cdesc);
				$("#categoryId").val(categoryId);
			};
			
			confirmDelNews=function(newsId){
				$.ajax({
		            type: "post",
		            dataType: 'json',
					url: "/web/member/news/del",
		            data: {
		                "newsId": newsId
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							$.showPrompt("warning","删除成功！");
							$("#tr"+newsId).remove();
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			};
			delNews=function(newsId){
				$.showConfirm("确定要删除该资讯？",confirmDelNews,newsId);
			};
			
			initTopNews = function(){
				var belongIdIpt = $("#belongId");
				belongIdIpt.select({size:15}, belongIdIpt.val(), new Array(), new Array());
				$.ajax({
					type : "post",
					url : "/web/member/news/topCategories",
					dataType : "json",
					data : {},
					success : function(result) {
						if(result.isTrue){
							belongIdIpt.select({size:15}, belongIdIpt.val(), result.tag.values, result.tag.keys);
						} else {
							$.showPrompt("error",result.message);
						}
					},
					error : function() {
						$.showPrompt("error","网络繁忙，请稍后再试！");
					}
				});
			};
			setHtml=function(result){
				return "<td><input type='checkbox' /></td><td>"+result.tag.name+"</td><td>"+result.tag.cdesc+"</td><td>"+(result.tag.rootNews==null?"":result.tag.rootNews.name)+"</td><td>"+result.tag.sort+"</td><td>"+result.tag.addTime+"</td><td class='delete'><a href='javascript:editNews(\""+result.tag.categoryId+"\",\""+result.tag.categoryName+"\",\""+result.tag.cdesc+"\",\""+(result.tag.sort==null?"":result.tag.sort)+"\")'>修改</a> <a href='javascript:delNews(\""+result.tag.categoryId+"\")'>删除</a></td>";
			};
		</script>
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
				$("#sidebar").load("/resource/member/include/left.html", function(){
					$.setMenu(2, 0);
				});
			</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>资讯管理</h2>
						<div class="form">
							<input type="text" class="text" value="Search" />
						</div>
					</div>		<!-- .block_head ends -->
					<div class="block_content form">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" class="check_all" /></th>
									<th>标题</th>
									<th>分类</th>
									<th>关键字</th>
									<th>添加时间</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody id="pageBody">
								<c:forEach items="${ps.items}" var="news">
								<tr id="tr${news.newsId}">
									<td><input type="checkbox" /></td>
									<td><a href="#">${news.newsTitle}</a></td>
									<td>${news.addTimeStr}</td>
									<td>${news.newsTag}</td>
									<td class="delete"><a href="edit?newsId=${news.newsId}">修改</a> <a href="javascript:delNews('${news.newsId}')">删除</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableactions">
							<input type="button" class="submit tiny" value="添加资讯" id="addNewsBtn"/>
						</div>		<!-- .tableactions ends -->
						<jsp:include page="/user/member/include/page.jsp"></jsp:include>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<jsp:include page="/resource/member/include/footer.html"></jsp:include>
			</div> <!-- End #main-content --> 
		</div>
		
	</body> 
</html> 
