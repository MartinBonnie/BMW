<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>交易记录</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#sel_all_recharge').bind('click', function () {
				if($(this).prop("checked")) {
					$('#recharge_data').find('input').prop("checked", true);
				} else {
					$('#recharge_data').find('input').prop("checked", false);
				}
			});
			$('#sel_all_expense').bind('click', function () {
				if($(this).prop("checked")) {
					$('#expense_data').find('input').prop("checked", true);
				} else {
					$('#expense_data').find('input').prop("checked", false);
				}
			});
			var today = new Date();
			DATA_MONTH.recharge = DATA_MONTH.expense = today.getFullYear()+"-"+ARRAY_MONTH[today.getMonth()];
			searchRecharge(1);
			searchExpense(1);
			$("#recharge_year").showYear(today);
			$("#recharge_month").showMonth(today);
			$("#expense_year").showYear(today);
			$("#expense_month").showMonth(today);
		});
		var PAGE_SIZE = {"recharge": 10, "expense": 10};
		var CUR_PAGE = {"recharge": 1, "expense": 1};
		var ORDER_NAME = {"recharge": "addTime", "expense": "addTime"};
		var ORDER_SORT = {"recharge": true, "expense": true};
		var DATA_MONTH = {"recharge": "", "expense": ""};
		var IS_SHOW_CHART = {"recharge": false, "expense": false};
		searchRecharge = function(page){
			CUR_PAGE.recharge = page;
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/account/getRechargeList",
				dataType : "json",
				data : {"month": DATA_MONTH.recharge, "pageNum": CUR_PAGE.recharge, "pageSize": PAGE_SIZE.recharge, "orderName": ORDER_NAME.recharge, "orderSort": ORDER_SORT.recharge},
				success : function(result) {
					if(result.isTrue){
						var totalPage = Math.ceil(result.tag*1.0/PAGE_SIZE.recharge);
						$('#page_recharge').initPagination('searchRecharge', totalPage, CUR_PAGE.recharge);
						var html = "";
						for(var i=0; i<result.items.length; i++){
							var obj = result.items[i];
							html+="<tr id=\"recharge_"+obj.id+"\"><td><input type=\"checkbox\" /></td>"
								+"<td style=\"text-align: right;\">"+((CUR_PAGE.recharge-1)*PAGE_SIZE.recharge+1+i)+"</td>"
								+"<td style=\"text-align: right;\">"+obj.amount+"</td>"
								+"<td style=\"text-align: right;\">"+obj.score+"</td>"
								+"<td>"+obj.account+"</td>"
								+"<td>"+obj.type+"</td>"
								+"<td>"+obj.code+"</td>"
								+"<td>"+obj.ip+"</td>"
								+"<td>"+obj.addTime+"</td>"
								+"<td class=\"delete\"><a onclick=\"delRecharge('"+obj.id+"')\">删除</a></td></tr>";
						}
						if(result.items.length==0) {
							html = "<tr><td colspan=\"10\"><strong>暂无数据</strong></td></tr>";
						}
						$('#recharge_data').html(html);
						$("#expense_year").select_move();
						$("#expense_month").select_move();
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		getRechargeChart = function(){
			$.ajax({
				type : "get",
				url : "/web/member/account/getRechargeChart",
				dataType : "json",
				data : {"month": DATA_MONTH.recharge},
				success : function(result) {
					if(result.isTrue){
						var xHtml = "<td>&nbsp;</td>";
						var yHtml = "<th>总计："+result.message+"</th>";
						for(var i=0; i<result.items.length; i++){
							xHtml += "<th scope=\"col\">"+result.items[i]+"</th>";
							yHtml += "<td>"+result.tag[result.items[i]]+"</td>";
						}
						$("#recharge_chart").find("thead").html("<tr>"+xHtml+"</tr>").end().find("tbody").html("<tr>"+yHtml+"</tr>");
						$.showDiagram($("#recharge_chart"), "line");
						$('#expense_year').select_move();
						$('#expense_month').select_move();
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		changeRechargeSort = function(row){
			ORDER_SORT.recharge = !ORDER_SORT.recharge;
			ORDER_NAME.recharge = row;
			searchRecharge(1);
		};
		changeRechargeMonth = function(){
			var pre = DATA_MONTH.recharge;
			DATA_MONTH.recharge = $("#recharge_year").val()+"-"+$("#recharge_month").val();
			if(DATA_MONTH.recharge!=pre){
				searchRecharge(1);
				IS_SHOW_CHART.recharge = false;
				if($("#recharge_chart").is(":visible")){
					showRechargeChart();
				}
			}
		};
		showRechargeChart = function(){
			if(IS_SHOW_CHART.recharge){
				$("#recharge_chart").show();
			} else {
				IS_SHOW_CHART.recharge = true;
				getRechargeChart();
			}
		};
		delRecharge = function(id){
			$.ajax({
				type : "get",
				url : "/web/member/account/delRecharge",
				dataType : "json",
				data : {"id": id},
				success : function(result) {
					if(result.isTrue){
						if(!result.message.isEmpty()){
							$.showPrompt("warning", "有几项操作失败，请检查后再试！");
						}
						var sucItems = result.tag.split("|");
						for(var i=0; i<sucItems.length; i++){
							$('#recharge_'+sucItems[i]).remove();
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
		delSelRecharge = function(){
			var ids = "";
			$('#recharge_data').find("input:checked").each(function(){
				ids+=$(this).attr("id")+"|";
			});
			if(ids.length>0) {
				delRecharge(ids.substring(0, ids.length-1));
			} else {
				$.showPrompt("warning", "请选择至少一项！");
			}
		};
		searchExpense = function(page){
			CUR_PAGE.expense = page;
			$.ajax({
				type : "get",
				async: false,
				url : "/web/member/account/getExpenseList",
				dataType : "json",
				data : {"month": DATA_MONTH.expense, "pageNum": CUR_PAGE.expense, "pageSize": PAGE_SIZE.expense, "orderName": ORDER_NAME.expense, "orderSort": ORDER_SORT.expense},
				success : function(result) {
					if(result.isTrue){
						var totalPage = Math.ceil(result.tag*1.0/PAGE_SIZE.expense);
						$('#page_expense').initPagination('searchExpense', totalPage, CUR_PAGE.expense);
						var html = "";
						for(var i=0; i<result.items.length; i++){
							var obj = result.items[i];
							html+="<tr id=\"recharge_"+obj.id+"\"><td><input type=\"checkbox\" /></td>"
								+"<td style=\"text-align: right;\">"+((CUR_PAGE.expense-1)*PAGE_SIZE.expense+1+i)+"</td>"
								+"<td style=\"text-align: right;\">"+obj.amount+"</td>"
								+"<td style=\"text-align: right;\">"+obj.score+"</td>"
								+"<td>"+obj.type+"</td>"
								+"<td>"+obj.code+"</td>"
								+"<td>"+obj.ip+"</td>"
								+"<td>"+obj.addTime+"</td>"
								+"<td class=\"delete\"><a onclick=\"delExpense('"+obj.id+"')\">删除</a></td></tr>";
						}
						if(result.items.length==0) {
							html = "<tr><td colspan=\"9\"><strong>暂无数据</strong></td></tr>";
						}
						$('#expense_data').html(html);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		getExpenseChart = function(){
			$.ajax({
				type : "get",
				url : "/web/member/account/getExpenseChart",
				dataType : "json",
				data : {"month": DATA_MONTH.expense},
				success : function(result) {
					if(result.isTrue){
						var xHtml = "<td>&nbsp;</td>";
						var yHtml = "<th>总计："+result.message+"</th>";
						for(var i=0; i<result.items.length; i++){
							xHtml += "<th scope=\"col\">"+result.items[i]+"</th>";
							yHtml += "<td>"+result.tag[result.items[i]]+"</td>";
						}
						$("#expense_chart").find("thead").html("<tr>"+xHtml+"</tr>").end().find("tbody").html("<tr>"+yHtml+"</tr>");
						$.showDiagram($("#expense_chart"), "line");
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		changeExpenseSort = function(row){
			ORDER_SORT.expense = !ORDER_SORT.expense;
			ORDER_NAME.expense = row;
			searchExpense(1);
		};
		changeExpenseMonth = function(){
			var pre = DATA_MONTH.expense;
			DATA_MONTH.expense = $("#expense_year").val()+"-"+$("#expense_month").val();
			if(DATA_MONTH.recharge!=pre){
				searchExpense(1);
				IS_SHOW_CHART.expense = false;
				if($("#expense_chart").is(":visible")){
					showExpenseChart();
				}
			}
		};
		showExpenseChart = function(){
			if(IS_SHOW_CHART.expense){
				$("#expense_chart").show();
			} else {
				IS_SHOW_CHART.expense = true;
				getExpenseChart();
			}
		};
		delExpense = function(id){
			$.ajax({
				type : "get",
				url : "/web/member/account/delExpense",
				dataType : "json",
				data : {"id": id},
				success : function(result) {
					if(result.isTrue){
						if(!result.message.isEmpty()){
							$.showPrompt("warning", "有几项操作失败，请检查后再试！");
						}
						var sucItems = result.tag.split("|");
						for(var i=0; i<sucItems.length; i++){
							$('#expense_'+sucItems[i]).remove();
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
		delSelExpense = function(){
			var ids = "";
			$('#expense_data').find("input:checked").each(function(){
				ids+=$(this).attr("id")+"|";
			});
			if(ids.length>0) {
				delRecharge(ids.substring(0, ids.length-1));
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
			<script type="text/javascript">
				$.setMenu(6, 1);
			</script>
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<jsp:include page="/resource/member/include/navigation.html"></jsp:include>
				<div class="clear"></div> <!-- End .clear --> 
			
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>基本资料</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div><label>账户余额：</label><span>${amount}</span>(<strong><a href="###" target="_blank">充值</a></strong>)</div>
						<div><label>积分：</label><span>${integral}</span></div>
						<div><label>总充值金额：</label><span>${totalRecharge}</span></div>
						<div><label>总消费金额：</label><span>${totalExpense}</span></div>
						<div><label>本月充值金额：</label><span>${monthRecharge}</span></div>
						<div><label>本月消费金额：</label><span>${monthExpense}</span></div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>充值记录</h2>
						<ul>
							<li class="nobg active"><a onclick="$(this).parent().addClass('active').next().removeClass('active');$('#recharge_chart').hide();$('#recharge_table').show();$('#expense_year').select_move();	$('#expense_month').select_move();">TABLE</a></li>
							<li><a onclick="$(this).parent().addClass('active').prev().removeClass('active');$('#recharge_table').hide();showRechargeChart();">CHART</a></li>
						</ul>
					</div>		<!-- .block_head ends -->
					<div class="block_content filter" style="border-bottom: 1px solid #ddd; padding: 5px 20px">
						<p>
							<label>月份</label> 
							<select id="recharge_year"></select>
							<select id="recharge_month"></select>
							<a onclick="changeRechargeMonth();" class="button">确定</a>
						</p>
					</div>
					<div class="block_content" id="recharge_chart" style="display:none;">
						<table>
							<thead>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>		<!-- .block_content ends -->
					<div class="block_content" id="recharge_table">
						<table>
							<thead>
								<tr>
									<th width="10"><input id="sel_all_recharge" type="checkbox" /></th>
									<th>序号</th>
									<th><a onclick="changeRechargeSort('rechargeAmount')">充值金额</a></th>
									<th>转换积分</th>
									<th>充值帐号</th>
									<th><a onclick="changeRechargeSort('rechargeType')">充值类型</a></th>
									<th>充值凭证</th>
									<th>充值IP</th>
									<th><a onclick="changeRechargeSort('addTime')">充值时间</a></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="recharge_data">
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
							<input type="button" class="submit tiny" value="删除所选项目" onclick="delSelRecharge();" />
						</div>		<!-- .tableactions ends -->
						<div id="page_recharge" class="pagination right"></div>	
						<!-- .pagination ends -->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>消费记录</h2>
						<ul>
							<li class="nobg active"><a onclick="$(this).parent().addClass('active').next().removeClass('active');$('#expense_chart').hide();$('#expense_table').show();">TABLE</a></li>
							<li><a onclick="$(this).parent().addClass('active').prev().removeClass('active');$('#expense_table').hide();showExpenseChart();">CHART</a></li>
						</ul>
					</div>		<!-- .block_head ends -->
					<div class="block_content filter" style="border-bottom: 1px solid #ddd; padding: 5px 20px">
						<p>
							<label>月份</label> 
							<select id="expense_year"></select>
							<select id="expense_month"></select>
							<a onclick="changeExpenseMonth();" class="button">确定</a>
						</p>
					</div>
					<div class="block_content" id="expense_chart" style="display:none;">
						<table>
							<thead>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>		<!-- .block_content ends -->
					<div class="block_content">
						<table>
							<thead>
								<tr>
									<th width="10"><input id="sel_all_expense" type="checkbox" /></th>
									<th>序号</th>
									<th><a onclick="changeExpenseSort('amount')">消费金额</a></th>
									<th>转换积分</th>
									<th><a onclick="changeExpenseSort('type')">消费类型</a></th>
									<th>消费记录</th>
									<th>消费IP</th>
									<th><a onclick="changeExpenseSort('time')">消费时间</a></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="expense_data">
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
							<input type="button" class="submit tiny" value="删除所选项目" onclick="delSelExpense();" />
						</div>		<!-- .tableactions ends -->
						<div id="page_expense" class="pagination right"></div>	
						<!-- .pagination ends -->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<jsp:include page="/resource/member/include/footer.html"></jsp:include>
				<!-- End #footer --> 
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
</html> 