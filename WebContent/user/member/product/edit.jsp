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
				$("select.styled").select_skin();
				
				$('.block input[type=file]').addClass('file');
				$("input[type=file]").filestyle({ 
				    image: "/resource/member/images/upload.gif",
				    imageheight : 30,
				    imagewidth : 80,
				    width : 250
				});
				$("#fileupload").mouseover(function(){
					$('#uploadmsg').addClass('loading').text('Uploading...');
				});
				$("#fileupload").mouseout(function(){
					$('#uploadmsg').removeClass('loading').text("Complete...");
				});
			});
		</script>
		<script type="text/javascript">
		function ajaxFileUpload()
		{
			var filename = $("#picdata").val();
			if(filename==""){
				alert("选个文件！");
				return;
			}
			if(!filename.isPicture()){
				alert("必须是图片！");
				return;
			}
			$("#loading")
			.ajaxStart(function(){
				$(this).show();
			})
			.ajaxComplete(function(){
				$(this).hide();
			});
			
			$.ajaxFileUpload
			(
				{
					url:'/web/member/upload/',
					secureuri:false,
					dataType: 'json',
					fileElementId:'picdata',
					data: {
						 'type':'product'
		            },
					beforeSend:function()
					{
						$("#loading").show();
					},
					complete:function()
					{
						$("#loading").hide();
					},				
					success: function (data, status)
					{
						var atts = $("#atts").val();
						if(atts==""){
							$("#atts").val(data.id);
						}else{
							$("#atts").val(atts+","+data.id);
						}
						$("#loading").hide();
						if(data.state!= 'SUCCESS'){
							alert(data.state);
						}else{
							$("#picdata").val("");
							$("#uploadmsg").html("上传成功！再传一张！");
							$("#uploadedImages").append("<li id=\"att"+data.id+"\" class=\"s5 hover\"><a href=\"javascript:void(0)\" onclick=\"setAtt('"+data.id+"','"+data.url+"')\"><img src=\""+data.url+"\" alt=\""+data.title+"\" width=\"300px\" height=\"200px\"/></a><a href=\"javascript:void(0)\" onclick=\"delAtt('"+data.id+"')\" class=\"close\" title=\"删除\"></a></li>");
						}
						
					},
					error: function (data, status, e)
					{
						alert(e);
					}
				});
				return false;
			}
		
			function setAtt(id,path){
				var atts = $("#atts").val();
				if(atts.indexOf(id)==-1){//没有这个附件
					if(atts==""){
						$("#atts").val(id);
					}else{
						$("#atts").val(atts+","+id);
					}
				}
				var content = editor.getContent();
				editor.setContent(content+"<img src='"+path+"'/>");
			}
			function delAtt(id){
				$("#att"+id).remove();
				var atts = $("#atts").val();
				atts = atts.replace(" "+id,"");
				atts = atts.replace(id,"");
				$("#atts").val(atts);
				$.ajax({
		            type: "post",
		            dataType: 'json',
		            url: "/web/member/product/deleteAtt",
		            data: {
		            	"id": id
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			}
	</script>
	<script type="text/javascript"  src="/resource/member/js/ueditorAll/editor_config.js"></script>
    <script type="text/javascript"  src="/resource/member/js/ueditorAll/editor.js"> </script>
    <link rel="stylesheet" type="text/css" href="/resource/member/js/ueditorAll/themes/default/css/ueditor.css"/>
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
					$("#sidebar").load("/resource/member/include/left.html", function(){
						$.setMenu(3, 0);
					});
				</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>修改产品</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content">
						<div class="message info"><p>带*为必填项目</p><span class="close" title="Dismiss" onmouseover="$(this).addClass('hover');" onmouseout="$(this).removeClass('hover');"></span></div>
						<form action="/web/member/product/saveEdit" method="post">
						<div class="form">
							<p>
								<input type="hidden" name="prodId" value="${product.prodId}"/>
								<label>产品名称:</label><br />
								<input name="prodName" type="text" value="${product.prodName}" class="text small" style="font-size: 14px;padding: 5px;"/> 
								<span class="note">*</span>
							</p>
							<p>
								<label>产品型号:</label><br />
								<input name="prodModel" type="text" value="${product.prodModel}" class="text small" style="font-size: 14px;padding: 5px;"/> 
							</p>
							<p>
								<label>产品品牌:</label><br />
								<select class="styled" name="prodBrand">
									<c:forEach items="${brands}" var="brand">
										<option value="${brand.brandId}" <c:if test="${brand.brandId==product.prodBrand}">selected</c:if>>${brand.brandName}</option>
									</c:forEach>
								</select></p>
							<p>
								<label>系统分类:</label> <br /> <select class="styled"
									name="prodCategory">
									<c:forEach items="${prodCategory}" var="productCategory">
												<option value="${productCategory.sysId}"  <c:if test="${productCategory.sysId==product.prodCategory}">selected</c:if>>${productCategory.sysName}</option>
									</c:forEach>
								</select>
							</p>
							<p>
								<label>所属分类:</label> <br /> <select class="styled"
									name="userCategory">
									<c:forEach items="${categories}" var="category">
										<c:choose>
											<c:when test="${category.getSubCategory().size()==0}">
												<option value="${category.categoryId}" <c:if test="${category.categoryId==product.userCategory}">selected</c:if>>${category.name}</option>
											</c:when>
											<c:otherwise>
												<optgroup label="${category.name}">
													<c:forEach items="${category.getSubCategory()}" var="subCategory">
														<option value="${subCategory.categoryId}" <c:if test="${subCategory.categoryId==product.userCategory}">selected</c:if>>${subCategory.name}</option>
													</c:forEach>
												</optgroup>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</p>
							<p>
								<label>价格:</label><br />
								<input name="prodPrice"  value="${product.prodPrice}"type="text" class="text small" style="font-size: 14px;padding: 5px;"/> 
							</p>
							<p>
								<label>单位:</label><br />
								<input name="prodUnit"  value="${product.prodUnit}"type="text" class="text small" style="font-size: 14px;padding: 5px;"/> 
							</p>
							<p>
								<label>关键字:</label><br />
								<input name="prodTag" type="text"  value="${product.prodTag}"class="text medium error" style="font-size: 14px;padding: 5px;"/> 
								<span class="note">多个关键字请用空格隔开</span>
							</p>
							<p>
								<label>产品简介:</label><br />
								<textarea id="prodDesc" name="prodDesc" class="wysiwyg">${product.prodDesc}</textarea>
							</p>
							<p class="fileupload">
								<label>产品图片:</label><br />
								<input type="hidden" id="atts" name="atts"/>
								<input type="file" id="picdata" name="picdata" onchange="ajaxFileUpload()"/>
								<span id="uploadmsg">图片最大为2M</span>
								<span id="loading"><img src="/resource/member/images/loading.gif" style="display:none;"></span>
							</p>
							<div id="imgArea">
								<ul id="uploadedImages">
									<c:forEach items="${atts}" var="att">
										<li id="att${att.id}" class="s5 hover">
											<a href="javascript:void(0)" onclick="setAtt('${att.id}','${att.url}')">
												<img src="${att.url}" alt="" width="300px" height="200px">
											</a>
											<a href="javascript:void(0)" onclick="delAtt('${att.id}')" class="close" title="删除">
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<hr />
							<p>
								<input type="submit" class="submit small" value="提交" />
							</p>
						</div>
						</form>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				<div id="footer"> 
					<small> <!-- Remove this notice or replace it with whatever you want --> 
							&#169; Copyright 2009 NET355 | Powered by NET355 | <a href="#">Top</a> 
					</small> 
				</div><!-- End #footer --> 
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
										<h3>3 Messages</h3> 
										<p> 
											<strong>17th May 2009</strong> by Admin<br /> 
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue.
											<small><a href="#" class="remove-link" title="Remove message">Remove</a></small> 
										</p> 
										<p> 
											<strong>2nd May 2009</strong> by Jane Doe<br /> 
											Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.
											<small><a href="#" class="remove-link" title="Remove message">Remove</a></small> 
										</p> 
										<p> 
											<strong>25th April 2009</strong> by Admin<br /> 
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue.
											<small><a href="#" class="remove-link" title="Remove message">Remove</a></small> 
										</p> 
											<div>
											<h4>New Message</h4> 
												<textarea class="textarea" name="textfield" cols="50" rows="5"></textarea> 
												<select name="dropdown" class="small-input"> 
													<option value="option1">Send to...</option> 
													<option value="option2">Everyone</option> 
													<option value="option3">Admin</option> 
													<option value="option4">Jane Doe</option> 
												</select> 
												<input class="button" type="submit" value="Send" /> 
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
	<script type="text/javascript">
	var editor = new UE.ui.Editor();
	editor.render("prodDesc");
</script>
</html> 
