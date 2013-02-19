<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Account Index</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			/*
			$("#viewTabUl").find("li").click(function(){
				$(this).parent().find("li").removeClass("active");
				$(this).addClass("active");
			});
			$.showDiagram($('#adView'), "line");
			initSpaceBlock();
			*/
		});
		
		modifyUserName = function(value){
			if(value.isCN() && value.rangeLen(2, 10)) {
				modifyUserInfo("username", value);
			} else {
				$.showPrompt("waring", "姓名为2到10位中文字符！");
			}
		};
		
		modifyAddress = function(value){
			if(value.rangeLen(1, 50)) {
				modifyUserInfo("address", value);
			} else {
				$.showPrompt("waring", "详细地址为1到50位字符！");
			}
		};
		
		modifyZipcode = function(value){
			if(value.isDigit() && value.eqLen(6)) {
				modifyUserInfo("zipcode", value);
			} else {
				$.showPrompt("waring", "邮编为6为数字！");
			}
		};
		
		modifyQQ = function(value){
			if(value.isEmpty() || value.isDigit()) {
				modifyUserInfo("qq", value);
			} else {
				$.showPrompt("waring", "QQ格式有误！");
			}
		};
		
		modifyMSN = function(value){
			if(value.isEmpty() || value.isMail()) {
				modifyUserInfo("msn", value);
			} else {
				$.showPrompt("waring", "MSN格式有误！");
			}
		};
		
		modifyPhone = function(value){
			if(value.isPhone()) {
				modifyUserInfo("phone", value);
			} else {
				$.showPrompt("waring", "电话格式为010-12345678！");
			}
		};
		
		modifyCell = function(value){
			if(value.isCell()) {
				modifyUserInfo("cell", value);
			} else {
				$.showPrompt("waring", "手机格式有误！");
			}
		};
		
		modifyFax = function(value){
			if(value.isPhone()) {
				modifyUserInfo("fax", value);
			} else {
				$.showPrompt("waring", "传真格式有误！");
			}
		};
		
		modifyUserInfo = function(key, value){
			$.ajax({
				type : "post",
				url : "/web/member/account/modifyUserInfo",
				dataType : "json",
				data : {"key": key, "value": value},
				success : function(result) {
					if(result.isTrue){
						$("#user_"+key).html(value).show().next().hide();
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		
		modifyUserPCD = function(){
			var pcdItems = new Array();
			var parent = $("#user_PCD");
			parent.find("input").each(function(){
				pcdItems.push($(this).val());
			});
			$.ajax({
				type : "post",
				url : "/web/member/account/modifyUserInfo",
				dataType : "json",
				data : {"key": "pcd", "value": pcdItems.join("_")},
				success : function(result) {
					if(result.isTrue){
						parent.find("span").eq(1).html(pcdItems.join(" "));
						parent.find("a").last().click();
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		closePCDContainer = function(){
			$("#user_PCD").find("input").each(function(){
				$(this).select_close();
			});
		};
		initUserPCD = function(){
			var nodeList = $("#user_PCD").find("input");
			$.ajax({
				type : "post",
				url : "/web/getProvince",
				dataType : "json",
				data : {},
				success : function(result) {
					if(result.isTrue){
						nodeList.eq(0).select({size:15}, nodeList.eq(0).val(), result.tag.provinceList, result.tag.provinceList);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		refreshCity = function(){
			var nodeList = $("#user_PCD").find("input");
			$.ajax({
				type : "post",
				url : "/web/getCityByProvince",
				dataType : "json",
				data : {"province": nodeList.eq(0).val()},
				success : function(result) {
					if(result.isTrue){
						nodeList.eq(1).select({size:15}, nodeList.eq(1).val(), result.tag.cityList, result.tag.cityList);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		refreshDist = function(city){
			var nodeList = $("#user_PCD").find("input");
			$.ajax({
				type : "post",
				url : "/web/getDistByCity",
				dataType : "json",
				data : {"city": nodeList.eq(1).val()},
				success : function(result) {
					if(result.isTrue){
						nodeList.eq(2).select({size:15}, nodeList.eq(2).val(), result.tag.distList, result.tag.distList);
					} else {
						eval('(' + result.message + ')');
					}
				},
				error : function() {
					alert("网络繁忙，请稍后再试！");
				}
			});
		};
		</script> 
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
				<jsp:include page="/resource/member/include/left.html"></jsp:include>
			</div> <!-- End #sidebar --> 
			<script type="text/javascript">
					$.setMenu(6, 0);
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
						<div><label>登录名：</label><span>${account}</span></div>
						<div><label>类型：</label><span>${type}</span></div>
						<div><label>状态：</label><span>${state}</span></div>
						<div><label>积分：</label><span>${integral}</span></div>
						<div><label>用户级别：</label><span>${level}</span>(<strong><a href="###" target="_blank">升级</a></strong>)</div>
						<div><label>剩余空间：</label><span>${freeSpace}G</span>(<strong><a href="###" target="_blank">购买</a></strong>)</div>
						<div><label>账户余额：</label><span>${amount}</span>(<strong><a href="###" target="_blank">充值</a></strong>)</div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>个人信息</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div>
							<label>姓名：</label>
							<span><span id="user_username">${username}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${username}" onkeyup="if(event.keyCode == 13) modifyUserName($(this).val());" />
								<a onclick="modifyUserName($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div id="user_PCD"><label>省份城市：</label>
							<span><span>${province} ${city} ${dist}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();initUserPCD();">编辑</a></strong>)</span>
							<span style="display: none;">
								<input type="text" value="${province}" style="visibility: hidden;" onchange="refreshCity();" />
								<input type="text" value="${city}" style="visibility: hidden;" onchange="refreshDist();" />
								<input type="text" value="${dist}" style="visibility: hidden;" />
								<a onclick="modifyUserPCD();" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();closePCDContainer();" class="button">取消</a></span></div>
						<div>
							<label>详细地址：</label>
							<span><span id="user_address">${address}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${address}" onkeyup="if(event.keyCode == 13) modifyAddress($(this).val());" />
								<a onclick="modifyAddress($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>邮政编码：</label>
							<span><span id="user_zipcode">${zipcode}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${zipcode}" onkeyup="if(event.keyCode == 13) modifyZipcode($(this).val());" />
								<a onclick="modifyZipcode($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>QQ：</label>
							<span><span id="user_qq">${qq}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${qq}" onkeyup="if(event.keyCode == 13) modifyQQ($(this).val());" />
								<a onclick="modifyQQ($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>MSN：</label>
							<span><span id="user_msn">${msn}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${msn}" onkeyup="if(event.keyCode == 13) modifyMSN($(this).val());" />
								<a onclick="modifyMSN($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>电话：</label>
							<span><span id="user_phone">${phone}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${phone}" onkeyup="if(event.keyCode == 13) modifyPhone($(this).val());" />
								<a onclick="modifyPhone($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>手机：</label>
							<span><span id="user_cell">${cell}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${cell}" onkeyup="if(event.keyCode == 13) modifyCell($(this).val());" />
								<a onclick="modifyCell($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
						<div>
							<label>传真：</label>
							<span><span id="user_fax">${fax}</span>(<strong><a onclick="$(this).parent().parent().hide().next().show();">编辑</a></strong>)</span>
							<span style="display: none;"><input type="text" value="${fax}" onkeyup="if(event.keyCode == 13) modifyFax($(this).val());" />
								<a onclick="modifyFax($(this).prev().val());" class="button">确定</a>
								<a onclick="$(this).parent().hide().prev().show();" class="button">取消</a></span></div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>企业信息</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div><label>企业名：</label><a href="www.taobao.com" target="_blank">浙江淘宝网络有限公司</a></div>
						<div><label>企业域名：</label><a href="http://www.taobao.com" target="_blank">taobao.com</a></div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>安全信息</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div><label>登录密码：</label><span>******</span>(<strong><a href="###" target="_blank">修改</a></strong>)</div>
						<div><label>支付密码：</label><span>******</span>(<strong><a href="###" target="_blank">修改</a></strong>)</div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<jsp:include page="/resource/member/include/footer.html"></jsp:include>
				<!-- End #footer --> 
			</div> <!-- End #main-content --> 
		</div>
		
	</body> 
</html> 