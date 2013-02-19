<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>空间状态</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#sel_all_space').bind('click', function () {
				if($(this).prop("checked")) {
					$('#space_data').find('input').prop("checked", true);
				} else {
					$('#space_data').find('input').prop("checked", false);
				}
			});
			initSpaceBlock();
			var today = new Date();
			DATA_MONTH.space = today.getFullYear()+"-"+ARRAY_MONTH[today.getMonth()];
			searchFile(1);
			$("#space_year").showYear(today);
			$("#space_month").showMonth(today);
			
		});
		var PAGE_SIZE = {"space": 10};
		var CUR_PAGE = {"space": 1};
		var ORDER_NAME = {"space": "addTime"};
		var ORDER_SORT = {"space": true};
		var DATA_MONTH = {"space": ""};
		var IS_SHOW_CHART = {"space": false};

		initSpaceBlock = function(){
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/space/getSpaceView",
				dataType : "json",
				data : {},
				success : function(result) {
					if(result.isTrue){
						var html = "";
						for(var i=0; i<result.items.length; i++){
							html+="<div><label>付费空间：</label><span>"+result.items[i].size+"G</span>";
							html+="(<strong>到期时间: "+result.items[i].endTime+"&nbsp;&nbsp;&nbsp;";
							html+="<a href=\"/web/member/buyspace/"+result.items[i].id+"\" target=\"_blank\">续费</a></strong>)</div>";
						}
						$("#spaceBlock").append(html);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		
		searchFile = function(page){
			CUR_PAGE.space = page;
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/space/getFileList",
				dataType : "json",
				data : {"month": DATA_MONTH.space, "pageNum": CUR_PAGE.space, "pageSize": PAGE_SIZE.space, "orderName": ORDER_NAME.space, "orderSort": ORDER_SORT.space},
				success : function(result) {
					if(result.isTrue){
						var totalPage = Math.ceil(result.tag*1.0/PAGE_SIZE.space);
						$('#page_space').initPagination('searchFile', totalPage, CUR_PAGE.space);
						var html = "";
						for(var i=0; i<result.items.length; i++){
							var obj = result.items[i];
							html+="<tr id=\"space_"+obj.id+"\"><td><input type=\"checkbox\" /></td>"
								+"<td style=\"text-align: right;\">"+((CUR_PAGE.space-1)*PAGE_SIZE.space+1+i)+"</td>"
								+"<td style=\"text-align: left;\">"+obj.name+"</td>"
								+"<td style=\"text-align: right;\">"+obj.size+"</td>"
								+"<td>"+obj.type+"</td>"
								+"<td>"+obj.addTime+"</td>"
								+"<td class=\"delete\"><a onclick=\"delFile('"+obj.id+"')\">删除</a></td></tr>";
						}
						if(result.items.length==0) {
							html = "<tr><td colspan=\"10\"><strong>暂无数据</strong></td></tr>";
						}
						$('#space_data').html(html);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		getFileChart = function(){
			$.ajax({
				type : "get",
				url : "/web/member/space/getFileChart",
				dataType : "json",
				data : {"month": DATA_MONTH.space},
				success : function(result) {
					if(result.isTrue){
						var xHtml = "<td>&nbsp;</td>";
						var yHtml = "<th>总计："+result.message+"</th>";
						for(var i=0; i<result.items.length; i++){
							xHtml += "<th scope=\"col\">"+result.items[i]+"</th>";
							yHtml += "<td>"+result.tag[result.items[i]]+"</td>";
						}
						$("#space_chart").find("thead").html("<tr>"+xHtml+"</tr>").end().find("tbody").html("<tr>"+yHtml+"</tr>");
						$.showDiagram($("#space_chart"), "line");
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		changeSpaceSort = function(row){
			ORDER_SORT.space = !ORDER_SORT.space;
			ORDER_NAME.space = row;
			searchFile(1);
		};
		changeSpaceMonth = function(){
			var pre = DATA_MONTH.space;
			DATA_MONTH.space = $("#space_year").val()+"-"+$("#space_month").val();
			if(DATA_MONTH.space!=pre){
				searchFile(1);
				IS_SHOW_CHART.space = false;
				if($("#space_chart").is(":visible")){
					showSpaceChart();
				}
			}
		};
		showSpaceChart = function(){
			if(IS_SHOW_CHART.space){
				$("#space_chart").show();
			} else {
				IS_SHOW_CHART.space = true;
				getFileChart();
			}
		};
		delFile = function(id){
			$.ajax({
				type : "get",
				url : "/web/member/space/delFile",
				dataType : "json",
				data : {"id": id},
				success : function(result) {
					if(result.isTrue){
						if(!result.message.isEmpty()){
							$.showPrompt("warning", "有几项操作失败，请检查后再试！");
						}
						var sucItems = result.tag.split("|");
						for(var i=0; i<sucItems.length; i++){
							$('#space_'+sucItems[i]).remove();
						}
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		delSelSpace = function(){
			var ids = "";
			$('#space_data').find("input:checked").each(function(){
				ids+=$(this).attr("id")+"|";
			});
			if(ids.length>0) {
				delSpace(ids.substring(0, ids.length-1));
			} else {
				$.showPrompt("warning", "请选择至少一项！");
			}
		};
		
		</script> 
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<script type="text/javascript">
				$("#sidebar").load("/resource/member/include/left.html", function(){
					$.setMenu(1, 0);
				});
			</script>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<jsp:include page="/resource/member/include/navigation.html"></jsp:include>
				<div class="clear"></div> <!-- End .clear --> 
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>空间相关</h2>
					</div>		<!-- .block_head ends -->
					<div id="spaceBlock" class="block_content tab_content" style="display:block">
						<div><label>总容量：</label><span>${totalSpace}G</span>(<strong><a href="###" target="_blank">购买空间</a></strong>)</div>
						<div><label>已使用：</label><span>${usedSpace}G</span>(<strong><strong>剩余: ${freeSpace}G</strong></strong>)</div>
						<!--
						<div>
							<label>付费空间：</label><span>0.5G</span>(<span><strong>到期时间: 2012-12-26</strong>&nbsp;&nbsp;&nbsp;<a href="###" target="_blank">续费</a></span>)
						</div>
						<div>
							<label>付费空间：</label><span>0.6G</span>(<span><strong>到期时间: 2013-5-26</strong>&nbsp;&nbsp;&nbsp;<a href="###" target="_blank">续费</a></span>)
						</div>-->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>使用情况</h2>
						<ul>
							<li class="nobg active"><a onclick="$(this).parent().addClass('active').next().removeClass('active');$('#space_chart').hide();$('#space_table').show();">TABLE</a></li>
							<li><a onclick="$(this).parent().addClass('active').prev().removeClass('active');$('#space_table').hide();showSpaceChart();">CHART</a></li>
						</ul>
					</div>		<!-- .block_head ends -->
					<div class="block_content filter" style="border-bottom: 1px solid #ddd; padding: 5px 20px">
						<p>
							<label>月份</label> 
							<select id="space_year" ></select>
							<select id="space_month" ></select>
							<a onclick="changeSpaceMonth();" class="button">确定</a>
						</p>
					</div>
					<div class="block_content" id="space_chart" style="display:none;">
						<table>
							<thead>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>		<!-- .block_content ends -->
					<div class="block_content" id="space_table">
						<table>
							<thead>
								<tr>
									<th width="10"><input id="sel_all_space" type="checkbox" /></th>
									<th style="text-align: right;" width="40">序号</th>
									<th style="text-align: left;"><a onclick="changeSpaceSort('name')">文件名</a></th>
									<th style="text-align: right;"><a onclick="changeSpaceSort('size')">文件大小</a></th>
									<th><a onclick="changeSpaceSort('type')">文件类型</a></th>
									<th><a onclick="changeSpaceSort('time')">充值时间</a></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="space_data">
								<!--  
								<tr>
									<td><input type="checkbox" /></td>
									<td style="text-align: left;">1</td>
									<td style="text-align: right;">20.50</td>
									<td style="text-align: right;">20</td>
									<td>ray001</td>
									<td>网银</td>
									<td>shdjfhsjkdhfsdfkjhsdhf</td>
									<td>192.168.1.188</td>
									<td>2012-05-03 10:23:45</td>
									<td class="delete"><a href="#">删除</a></td>
								</tr>-->
							</tbody>
						</table>
						<div class="tableactions form">
							<input type="button" class="submit tiny" value="删除所选项目" onclick="delSelSpace();" />
						</div>		<!-- .tableactions ends -->
						<div id="page_space" class="pagination right"></div>	
						<!-- .pagination ends -->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
		
			
			
				<jsp:include page="/resource/member/include/footer.html"></jsp:include>
			</div> <!-- End #main-content --> 
		</div>
		
	</body> 
</html> 
