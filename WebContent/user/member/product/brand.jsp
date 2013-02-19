<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
				$("#addBrandBtn").click(function(){
					$("#facebox").show();
					$("#formTitle").html("添加品牌");
					$("#brandName").val("");
					$("#brandDesc").val("");
					$("#brandId").val("");
				});
				$("#submitFormBtn").click(function(){
					var brandName = $("#brandName").val();
					var brandDesc = $("#brandDesc").val();
					if(brandName==""||brandDesc==""){
						$.showPrompt("error","请填写品牌名称和描述！");
						return;
					}
					var brandId=$("#brandId").val();
					if(brandId==""){//add new brand
						$.ajax({
				            type: "post",
				            dataType: 'json',
				            url: "/web/member/product/addBrand",
				            data: {
				                "brandDesc": brandDesc,
				                "brandName": brandName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","添加成功！");
									$("#facebox").hide();
									$('#belongId').select_close();
									$("#pageBody").append("<tr id='tr"+result.tag.brandId+"'>"+setHtml(result)+"</tr>");
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
							url: "/web/member/product/editBrand",
				            data: {
				                "brandId": brandId,
				                "brandDesc": brandDesc,
				                "brandName": brandName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","修改成功！");
									$("#facebox").hide();
									$('#belongId').select_close();
									$("#tr"+brandId).html(setHtml(result));
								}
				            },
				            error: function(){
				            	$.showPrompt("error","系统忙，请稍后再试！");
				            }
				        });
					}
				});
				
			});
			editBrand=function(brandId,brandName,brandDesc){
				$("#facebox").show();
				$("#formTitle").html("修改品牌");
				$("#brandName").val(brandName);
				$("#brandDesc").val(brandDesc);
				$("#brandId").val(brandId);
			};
			
			confirmDelBrand=function(brandId){
				$.ajax({
		            type: "post",
		            dataType: 'json',
					url: "/web/member/product/delBrand",
		            data: {
		                "brandId": brandId,
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							$.showPrompt("warning","删除成功！");
							$("#tr"+brandId).remove();
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			};
			delBrand=function(brandId){
				$.showConfirm("确定要删除该品牌？删除改品牌后，您无法在添加或者修改产品的时候选择该品牌，但是原来添加的产品不会被删除。",confirmDelBrand,brandId);
			};
			setHtml=function(result){
				//<td><input type='checkbox' />
				return "</td><td>"+result.tag.brandName+"</td><td>"+result.tag.brandDesc+"</td><td>"+result.tag.addTime.date()+"</td><td class='delete'><a href='javascript:editBrand(\""+brandId+"\",\""+result.tag.brandName+"\",\""+result.tag.brandDesc+"\")'>修改</a> <a href='javascript:delBrand(\""+result.tag.brandId+"\")'>删除</a></td>";
			};
		</script>
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
				$("#sidebar").load("/resource/member/include/left.html", function(){
					$.setMenu(3, 2);
				});
			</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>品牌管理</h2>
						<div class="form">
							<input type="text" class="text" value="Search" />
						</div>
					</div>		<!-- .block_head ends -->
					<div class="block_content form">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<!--  
									<th width="10"><input type="checkbox" class="check_all" /></th>
									-->
									<th>品牌名称</th>
									<th>品牌描述</th>
									<th>添加时间</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody id="pageBody">
								<c:forEach items="${brands}" var="brand">
								<tr id="tr${brand.brandId}">
									<!--  
									<td><input type="checkbox" /></td>
									-->
									<td><a href="#">${brand.brandName}</a></td>
									<td>${brand.brandDesc}</td>
									<td>${brand.addTime}</td>
									<td class="delete"><a href="javascript:editBrand('${brand.brandId}','${brand.brandName}','${brand.brandDesc}')">修改</a> <a href="javascript:delBrand('${brand.brandId}')">删除</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableactions">
							<input type="button" class="submit tiny" value="添加品牌" id="addBrandBtn"/>
						</div>		<!-- .tableactions ends -->
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
										<h3 id="formTitle">添加品牌</h3> 
											<div>
											<h4>品牌名称</h4> 
											<input type="hidden" name="brandId" id="brandId">
											<input type="text" name="brandName" id="brandName">
											</div>
											<div>
											<h4>品牌描述</h4> 
												<textarea class="textarea" name="brandDesc" id="brandDesc" cols="50" rows="5"></textarea> 
												<input class="button" type="button" value="保存" id="submitFormBtn"/> 
											</div>
									</div> <!-- End #messages --> 
                                </div>
                                <div class="footer" >
                                    <a href="javascript:void(0);" onclick="$('#facebox').hide();" class="close"><img src="/resource/member/images/closelabel.gif" title="close" class="close_image"></a>
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
