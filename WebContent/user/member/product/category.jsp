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
				$("#addCategoryBtn").click(function(){
					$("#facebox").show();
					initTopCategory();
					$("#formTitle").html("添加分类");
					$("#categoryName").val("");
					$("#cdesc").val("");
					$("#belongId").val("");
					$("#categoryId").val("");
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
				            url: "/web/member/product/addCategory",
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
							url: "/web/member/product/editCategory",
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
			editCategory=function(categoryId,categoryName,cdesc,belongId,sort){
				initTopCategory();
				$("#facebox").show();
				$("#formTitle").html("修改分类");
				$("#belongId").val(belongId);
				$("#categoryName").val(categoryName);
				$("#cdesc").val(cdesc);
				$("#categoryId").val(categoryId);
			};
			
			confirmDelCategory=function(categoryId){
				$.ajax({
		            type: "post",
		            dataType: 'json',
					url: "/web/member/product/delCategory",
		            data: {
		                "categoryId": categoryId,
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							$.showPrompt("warning","删除成功！");
							$("#tr"+categoryId).remove();
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			};
			delCategory=function(categoryId){
				$.showConfirm("确定要删除该分类？删除改分类后，您无法在添加或者修改产品的时候选择该分类，但是原来添加的产品不会被删除。",confirmDelCategory,categoryId);
			};
			
			initTopCategory = function(){
				var belongIdIpt = $("#belongId");
				$.ajax({
					type : "post",
					url : "/web/member/product/topCategories",
					dataType : "json",
					data : {},
					success : function(result) {
						if(result.isTrue){
							 var option = "";
				             for(var j =0;j < result.tag.values.length; j++)
				             {
				                    option += "<option value=\"" + result.tag.keys[j] + "\">" + result.tag.values[j] + "</option>";
				             }
				             belongIdIpt.html(option);
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
				return "<td>"+result.tag.name+"</td><td>"+result.tag.cdesc+"</td><td>"+(result.tag.rootCategory==null?"":result.tag.rootCategory.name)+"</td><td>"+result.tag.sort+"</td><td>"+result.tag.addTime.date()+"</td><td class='delete'><a href='javascript:editCategory(\""+result.tag.categoryId+"\",\""+result.tag.categoryName+"\",\""+result.tag.cdesc+"\",\""+(result.tag.sort==null?"":result.tag.sort)+"\")'>修改</a> <a href='javascript:delCategory(\""+result.tag.categoryId+"\")'>删除</a></td>";
			};
		</script>
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
					$("#sidebar").load("/resource/member/include/left.html", function(){
						$.setMenu(3, 3);
					});
				</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>分类管理</h2>
						<div class="form">
							<input type="text" class="text" value="Search" />
						</div>
					</div>		<!-- .block_head ends -->
					<div class="block_content form">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<!-- <th width="10"><input type="checkbox" class="check_all" /></th>
									 -->
									<th>分类名称</th>
									<th>分类描述</th>
									<th>上级分类</th>
									<th>顺序</th>
									<th>添加时间</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody id="pageBody">
								<c:forEach items="${ps.items}" var="category">
								<tr id="tr${category.categoryId}">
									<!-- 
									<td><input type="checkbox" /></td>
									 -->
									<td><a href="#">${category.name}</a></td>
									<td>${category.cdesc}</td>
									<td>${category.rootCategory.name}</td>
									<td>${category.sort}</td>
									<td>${category.addTime}</td>
									<td class="delete"><a href="javascript:editCategory('${category.categoryId}','${category.name}','${category.cdesc}','${category.belongId}','${category.sort}')">修改</a> <a href="javascript:delCategory('${category.categoryId}')">删除</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableactions">
							<input type="button" class="submit tiny" value="添加分类" id="addCategoryBtn"/>
						</div>		<!-- .tableactions ends -->
						<jsp:include page="/user/member/include/page.jsp"></jsp:include>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<jsp:include page="/resource/member/include/footer.html"></jsp:include>
			</div> <!-- End #main-content --> 
		</div>
		
        <div id="facebox" style="display:none; top: 69.6px; left: 490.5px; ">
            <div class="popup">
                <table>
                    <tbody>
                        <tr>
                            <td class="tl">
                            </td>
                            <td class="b">
                            </td>
                            <td class="tr">
                            </td>
                        </tr>
                        <tr>
                            <td class="b">
                            </td>
                            <td class="body">
                                <div class="content" >
                                    <div id="messages" > <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  --> 
										<h3 id="formTitle">添加分类</h3> 
											<div>
											<h4>分类名称</h4> 
											<input type="hidden" name="categoryId" id="categoryId">
											<input type="text" name="categoryName" id="categoryName">
											</div>
											<div>
											<h4>上级分类</h4> 
											<select class="styled" id="belongId" name="belongId" style="width: 160px;height:20px;"> </select>
											
											</div>
											<div>
											<h4>顺序</h4> 
											<input id="sort" name="sort" type="text" value="" />
											</div>
											<div>
											<h4>分类描述</h4> 
												<textarea class="textarea" name="cdesc" id="cdesc" cols="50" rows="5"></textarea> 
												<input class="button" type="button" value="保存" id="submitFormBtn"/> 
											</div>
									</div> <!-- End #messages --> 
                                </div>
                                <div class="footer" >
                                    <a href="javascript:void(0);" onclick="$('#facebox').hide();$('#belongId').select_close();" class="close"><img src="/resource/member/images/closelabel.gif" title="close" class="close_image"></a>
                                </div>
                            </td>
                            <td class="b">
                            </td>
                        </tr>
                        <tr>
                            <td class="bl">
                            </td>
                            <td class="b">
                            </td>
                            <td class="br">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
	</body> 
</html> 
