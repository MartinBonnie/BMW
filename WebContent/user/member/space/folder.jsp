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
				$("#addFolderBtn").click(function(){
					$("#facebox").show();
					$("#formTitle").html("添加文件夹");
					$("#folderName").val("");
					$("#folderDesc").val("");
					$("#folderId").val("");
				});
				$("#submitFormBtn").click(function(){
					var folderName = $("#folderName").val();
					var folderDesc = $("#folderDesc").val();
					if(folderName==""||folderDesc==""){
						$.showPrompt("error","请填写文件夹名称和描述！");
						return;
					}
					var folderId=$("#folderId").val();
					if(folderId==""){//add new folder
						$.ajax({
				            type: "post",
				            dataType: 'json',
				            url: "/web/member/space/addFolder",
				            data: {
				            	"folderDesc": folderDesc,
				                "folderName": folderName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","添加成功！");
									$("#facebox").hide();
									$("#pageBody").append("<tr id='tr"+result.tag.folderId+"'>"+setHtml(result)+"</tr>");
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
							url: "/web/member/space/editFolder",
				            data: {
				                "folderId": folderId,
				                "folderDesc": folderDesc,
				                "folderName": folderName
				            },
				            success: function(result){
				            	if(!result.isTrue){
				            		$.showPrompt("error",result.message);
								}else{
									$.showPrompt("warning","修改成功！");
									$("#facebox").hide();
									$("#tr"+folderId).html(setHtml(result));
								}
				            },
				            error: function(){
				            	$.showPrompt("error","系统忙，请稍后再试！");
				            }
				        });
					}
				});
				
			});
			editFolder=function(folderId,folderName,folderDesc){
				initTopfolder();
				$("#facebox").show();
				$("#formTitle").html("修改文件夹");
				$("#folderName").val(folderName);
				$("#folderDesc").val(folderDesc);
				$("#folderId").val(folderId);
			};
			
			confirmdelFolder=function(folderId){
				$.ajax({
		            type: "post",
		            dataType: 'json',
					url: "/web/member/space/delFolder",
		            data: {
		                "folderId": folderId,
		            },
		            success: function(result){
		            	if(!result.isTrue){
		            		$.showPrompt("error",result.message);
						}else{
							$.showPrompt("warning","删除成功！");
							$("#tr"+folderId).remove();
						}
		            },
		            error: function(){
		            	$.showPrompt("error","系统忙，请稍后再试！");
		            }
		        });
			};
			delFolder=function(folderId){
				$.showConfirm("确定要删除该文件夹？删除该文件夹后，您无法再添加或者修改资讯及产品的时候选择该文件夹下的资源，但是原来添加的产品或者资讯不会被删除。",confirmdelFolder,folderId);
			};
			setHtml=function(result){
				return "<td>"+result.tag.folderName+"</td><td>"+result.tag.folderDesc+"</td><td>"+result.tag.folderAmount+"</td><td>"+result.tag.addTime.date()+"</td><td class='delete'><a href='javascript:editFolder(\""+result.tag.folderId+"\",\""+result.tag.folderName+"\",\""+result.tag.cdesc+"\",\""+(result.tag.sort==null?"":result.tag.sort)+"\")'>修改</a> <a href='javascript:delFolder(\""+result.tag.folderId+"\")'>删除</a></td>";
			};
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
						<h2>文件夹管理</h2>
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
									<th>文件夹名称</th>
									<th>文件夹描述</th>
									<th>文件数量</th>
									<th>添加时间</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody id="pageBody">
								<c:forEach items="${ps.items}" var="folder">
								<tr id="tr${folder.folderId}">
									<!--  									
									<td><input type="checkbox" /></td>
									-->
									<td><a href="file?fileFolder=${folder.folderId}">${folder.folderName}</a></td>
									<td>${folder.folderDesc}</td>
									<td>${folder.folderAmount}</td>
									<td>${folder.addTime}</td>
									<td class="delete"><a href="javascript:editFolder('${folder.folderId}','${folder.folderName}','${folder.folderDesc}')">修改</a> <a href="javascript:delFolder('${folder.folderId}')">删除</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableactions">
							<input type="button" class="submit tiny" value="添加文件夹" id="addFolderBtn"/>
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
										<h3 id="formTitle">添加文件夹</h3> 
											<div>
												<h4>文件夹名称</h4> 
												<input type="hidden" name="folderId" id="folderId">
												<input type="text" name="folderName" id="folderName">
											</div>
											<div>
												<div>
													<h4>文件夹描述</h4> 
													<textarea class="textarea" name="folderDesc" id="folderDesc" cols="50" rows="5"></textarea> 
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
