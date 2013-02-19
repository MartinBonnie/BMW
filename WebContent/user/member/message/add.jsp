<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>站内信列表</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$.setMenu(5, 0);
			$('#sel_all_msg_sys').bind('click', function () {
				if($(this).prop("checked")) {
					$('#msg_data_sys').find('input').prop("checked", true);
				} else {
					$('#msg_data_sys').find('input').prop("checked", false);
				}
			});
			$('#sel_all_msg_psn').bind('click', function () {
				if($(this).prop("checked")) {
					$('#msg_data_psn').find('input').prop("checked", true);
				} else {
					$('#msg_data_psn').find('input').prop("checked", false);
				}
			});
			searchMsgSys(1);
			searchMsgPsn(1);
		});
		var PAGE_SIZE = {"sys": 10, "psn": 10};
		var CUR_PAGE = {"sys": 1, "psn": 10};
		var ORDER_NAME = {"sys": "addTime", "psn": "addTime"};
		var ORDER_SORT = {"sys": true, "psn": true};

		searchMsgSys = function(page){
			CUR_PAGE.sys = page;
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/message/getSysMsgList",
				dataType : "json",
				data : {"pageNum": CUR_PAGE.sys, "pageSize": PAGE_SIZE.sys, "orderName": ORDER_NAME.sys, "orderSort": ORDER_SORT.sys},
				success : function(result) {
					if(result.isTrue){
						var totalPage = Math.ceil(result.tag*1.0/PAGE_SIZE.sys);
						$('#page_msg_sys').initPagination('searchMsgSys', totalPage, CUR_PAGE.sys);
						var html = "";
						for(var i=0; i<result.items.length; i++){
							var obj = result.items[i];
							html+="<tr id=\"msg_sys_"+obj.id+"\"><td><input type=\"checkbox\" /></td>"
								+"<td style=\"text-align: right;\">"+((CUR_PAGE.sys-1)*PAGE_SIZE.sys+1+i)+"</td>"
								+"<td style=\"text-align: left;\">"+obj.title+"</td>"
								+"<td style=\"text-align: left;\">"+obj.content+"</td>"
								+"<td>"+obj.sender+"</td>"
								+"<td>"+obj.addTime+"</td>"
								+"<td class=\"delete\"><a onclick=\"delMsgSys('"+obj.id+"')\">删除</a></td></tr>";
						}
						if(result.items.length==0) {
							html = "<tr><td colspan=\"7\"><strong>暂无数据</strong></td></tr>";
						}
						$('#msg_data_sys').html(html);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		changeMsgSortSys = function(row){
			ORDER_SORT.sys = !ORDER_SORT.sys;
			ORDER_NAME.sys = row;
			searchMsgSys(1);
		};
		delMsgSys = function(id){
			$.ajax({
				type : "get",
				url : "/web/member/message/delSysMsg",
				dataType : "json",
				data : {"id": id},
				success : function(result) {
					if(result.isTrue){
						if(!result.message.isEmpty()){
							$.showPrompt("warning", "有几项操作失败，请检查后再试！");
						}
						var sucItems = result.tag.split("|");
						for(var i=0; i<sucItems.length; i++){
							$('#msg_sys_'+sucItems[i]).remove();
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
		delSelMsgSys = function(){
			var ids = "";
			$('#msg_data_sys').find("input:checked").each(function(){
				ids+=$(this).attr("id")+"|";
			});
			if(ids.length>0) {
				delMsgSys(ids.substring(0, ids.length-1));
			} else {
				$.showPrompt("warning", "请选择至少一项！");
			}
		};
		

		searchMsgPsn = function(page){
			CUR_PAGE.psn = page;
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/message/getPsnMsgList",
				dataType : "json",
				data : {"pageNum": CUR_PAGE.psn, "pageSize": PAGE_SIZE.psn, "orderName": ORDER_NAME.psn, "orderSort": ORDER_SORT.psn},
				success : function(result) {
					if(result.isTrue){
						var totalPage = Math.ceil(result.tag*1.0/PAGE_SIZE.psn);
						$('#page_msg_psn').initPagination('searchMsgPsn', totalPage, CUR_PAGE.psn);
						var html = "";
						for(var i=0; i<result.items.length; i++){
							var obj = result.items[i];
							html+="<tr id=\"msg_psn_"+obj.id+"\"><td><input type=\"checkbox\" /></td>"
								+"<td style=\"text-align: right;\">"+((CUR_PAGE.psn-1)*PAGE_SIZE.psn+1+i)+"</td>"
								+"<td style=\"text-align: left;\">"+obj.title+"</td>"
								+"<td style=\"text-align: left;\">"+obj.content+"</td>"
								+"<td>"+obj.sender+"</td>"
								+"<td>"+obj.addTime+"</td>"
								+"<td class=\"delete\"><a onclick=\"delMsgSys('"+obj.id+"')\">删除</a></td></tr>";
						}
						if(result.items.length==0) {
							html = "<tr><td colspan=\"7\"><strong>暂无数据</strong></td></tr>";
						}
						$('#msg_data_psn').html(html);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		changeMsgSortPsn = function(row){
			ORDER_SORT.psn = !ORDER_SORT.psn;
			ORDER_NAME.psn = row;
			searchMsgPsn(1);
		};
		delMsgPsn = function(id){
			$.ajax({
				type : "get",
				url : "/web/member/message/delPsnMsg",
				dataType : "json",
				data : {"id": id},
				success : function(result) {
					if(result.isTrue){
						if(!result.message.isEmpty()){
							$.showPrompt("warning", "有几项操作失败，请检查后再试！");
						}
						var sucItems = result.tag.split("|");
						for(var i=0; i<sucItems.length; i++){
							$('#msg_psn_'+sucItems[i]).remove();
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
		delSelMsgPsn = function(){
			var ids = "";
			$('#msg_data_psn').find("input:checked").each(function(){
				ids+=$(this).attr("id")+"|";
			});
			if(ids.length>0) {
				delMsgPsn(ids.substring(0, ids.length-1));
			} else {
				$.showPrompt("warning", "请选择至少一项！");
			}
		};
		
		</script> 
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<jsp:include page="/resource/member/include/left.html"></jsp:include>
			</div> <!-- End #sidebar --> 
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<jsp:include page="/resource/member/include/navigation.html"></jsp:include>
				<div class="clear"></div> <!-- End .clear --> 
			
				<div class="block" style="background:none; padding-bottom:0px;">
					<div class="message info" style="margin:0px;">
						<p>您有<a id="msg_num_psn">5</a>条个人消息和<a id="msg_num_sys">11</a>条系统消息未读</p>
					</div>		<!-- .block_content ends -->
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>系统站内信列表</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content">
						<table>
							<thead>
								<tr>
									<th width="10"><input id="sel_all_msg_sys" type="checkbox" /></th>
									<th>序号</th>
									<th><a onclick="changeMsgSortSys('title')">标题</a></th>
									<th>内容</th>
									<th><a onclick="changeMsgSortSys('type')">发送人</a></th>
									<th><a onclick="changeMsgSortSys('time')">消息日期</a></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="msg_data_sys">
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
							<input type="button" class="submit tiny" value="删除所选项目" onclick="delSelMsgSys();" />
						</div>		<!-- .tableactions ends -->
						<div id="page_msg_sys" class="pagination right"></div>	
						<!-- .pagination ends -->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>个人站内信列表</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content">
						<table>
							<thead>
								<tr>
									<th width="10"><input id="sel_all_msg_psn" type="checkbox" /></th>
									<th>序号</th>
									<th><a onclick="changeMsgSortPsn('title')">标题</a></th>
									<th>内容</th>
									<th><a onclick="changeMsgSortPsn('type')">发送人</a></th>
									<th><a onclick="changeMsgSortPsn('time')">消息日期</a></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="msg_data_psn">
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
							<input type="button" class="submit tiny" value="删除所选项目" onclick="delSelMsgPsn();" />
						</div>		<!-- .tableactions ends -->
						<div id="page_msg_psn" class="pagination right"></div>	
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
