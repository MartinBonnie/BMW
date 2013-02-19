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
				$("#addFileBtn").click(function(){
					$("#facebox").show();
					$("#formTitle").html("添加文件");
					$("#fileName").val("");
					$("#fileupload").show();
					$("#picdata").show();
					$("#uploadedImages").empty();
					$("#fileId").val("");
				});
				$("#submitFormBtn").click(function(){
					var fileName = $("#fileName").val();
					var fileHref = $("#fileHref").val();
					var fileFolder=$("#fileFolder").val();
					var fileType=$("#fileType").val();
					if(fileName==""){
						$.showPrompt("error","请填写文件名称！");
						return;
					}
					if(fileHref==""){
						$.showPrompt("error","请上传图片！");
						return;
					}
					var fileId=$("#fileId").val();
					if(fileId==""){//add new file
						$.ajax({
				            type: "post",
				            dataType: 'json',
				            url: "/web/member/space/addFile",
				            data: {
				            	"fileHref": fileHref,
				                "fileName": fileName,
				                "fileFolder":fileFolder,
				                "fileType":fileType
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","添加成功！");
									$("#facebox").hide();
									$("#pageBody").append("<tr id='tr"+result.tag.fileId+"'>"+setHtml(result)+"</tr>");
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
							url: "/web/member/space/editFile",
				            data: {
				                "fileId": fileId,
				                "fileName": fileName,
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","修改成功！");
									$("#facebox").hide();
									$("#tr"+fileId).html(setHtml(result));
								}
				            },
				            error: function(){
				            	$.showPrompt("error","系统忙，请稍后再试！");
				            }
				        });
					}
				});
				
			});
			editFile=function(fileId,fileName){
				$("#facebox").show();
				$("#formTitle").html("修改文件");
				$("#fileName").val(fileName);
				$("#fileId").val(fileId);
				$("#uploadDiv").hide();
			};
			
			confirmdelFile=function(fileId){
				$.ajax({
		            type: "post",
		            dataType: 'json',
					url: "/web/member/space/delFolderFile",
		            data: {
		                "fileId": fileId,
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							$.showPrompt("warning","删除成功！");
							$("#tr"+fileId).remove();
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			};
			delFile=function(fileId){
				$.showConfirm("确定要删除该文件?删除该文件后，您无法再添加或者修改资讯及产品的时候选择该文件，但是原来添加的产品或者资讯不会被删除。",confirmdelFile,fileId);
			};
			setHtml=function(result){
				if(result.tag.fileType=='01'){
					return "<td>"+result.tag.fileName+"</td><td>"+result.tag.fileType+"</td><td><img src=\""+result.tag.fileHref+"\" width=\"100px\" height=\"80px\"/></td><td>"+result.tag.addTime.date()+"</td><td class='delete'><a href='javascript:editFile(\""+result.tag.fileId+"\",\""+result.tag.fileName+"\")'>修改</a> <a href='javascript:delFile(\""+result.tag.fileId+"\")'>删除</a></td>";
				}else{
					return "<td>"+result.tag.fileName+"</td><td>"+result.tag.fileType+"</td><td>"+result.tag.fileHref+"</td><td>"+result.tag.addTime.date()+"</td><td class='delete'><a href='javascript:editFile(\""+result.tag.fileId+"\",\""+result.tag.fileName+"\")'>修改</a> <a href='javascript:delFile(\""+result.tag.fileId+"\")'>删除</a></td>";
				}
				};
			function ajaxFileUpload()
			{
				var filename = $("#picdata").val();
				if(filename==""){
					alert("选个文件！");
					return;
				}
				//if(!filename.isPicture()){
				//	alert("必须是图片！");
				//	return;
				//}
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
							 'type':'file'
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
								$("#uploadedImages").append("<li class=\"s5 hover\"><a href=\""+data.url+"\"+><img src=\""+data.url+"\" alt=\""+data.title+"\" width=\"100px\" height=\"80px\"/></a></li>");
								$("#picdata").hide();
								$("#fileHref").val(data.url);
							}
							
						},
						error: function (data, status, e)
						{
							alert(e);
						}
					});
					return false;
				}
		</script>
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
				$("#sidebar").load("/resource/member/include/left.html", function(){
					$.setMenu(1, 1);
				});
			</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>文件管理</h2>
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
									<th>文件名称</th>
									<th>文件类型</th>
									<th>文件内容</th>
									<th>添加时间</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody id="pageBody">
								<c:forEach items="${ps.items}" var="file">
								<tr id="tr${file.fileId}">
									<!--  									
									<td><input type="checkbox" /></td>
									-->
									<td>${file.fileName}</a></td>
									<td>${file.fileType}</td>
									<td>
									 <c:choose>
										<c:when test="${file.fileType=='01'}">
											<a href="${file.fileHref}" target="_blank"><img src="${file.fileHref}" width="100px" height="80px"/></a>
										</c:when>
										<c:otherwise>
											<a href="${file.fileHref}" target="_blank">${file.fileHref}</a>
										</c:otherwise>
										</c:choose>
									</td>
									<td>${file.addTime}</td>
									<td class="delete"><a href="javascript:editFile('${file.fileId}','${file.fileName}','${file.fileType}')">修改</a> <a href="javascript:delFile('${file.fileId}')">删除</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableactions">
							<input type="button" class="submit tiny" value="添加文件" id="addFileBtn"/>
						</div>		<!-- .tableactions ends -->
						<jsp:include page="/user/member/include/pageFile.jsp"></jsp:include>
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
										<h3 id="formTitle">添加文件</h3> 
											<div>
												<h4>文件名称</h4> 
												<input type="hidden" name="fileId" id="fileId">
												<input type="hidden" name="fileFolder" id="fileFolder" value="${fileFolder}">
												<input type="hidden" name="fileHref" id="fileHref">
												<input type="text" name="fileName" id="fileName">
											</div>
											<div id="uploadDiv">
												<select id="fileType" name="fileType">
													<option value="01">图片</option>
													<option value="02">文档</option>
												</select>
												<p class="fileupload">
													<label>上传图片:</label><br />
													<input type="hidden" id="atts" name="atts"/>
													<input type="file" id="picdata" name="picdata" onchange="ajaxFileUpload()"/>
													<span id="uploadmsg">图片最大为2M</span>
													<span id="loading"><img src="/resource/member/images/loading.gif" style="display:none;"></span>
												</p>
												<div id="imgArea">
													<ul id="uploadedImages">
													</ul>
												</div>
											</div>
											<div>
													<input class="button" type="button" value="保存" id="submitFormBtn"/> 
											</div>
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
