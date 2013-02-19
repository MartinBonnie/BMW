<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Account Index</title> 
		<jsp:include page="/resource/member/include/js_css.html"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#viewTabUl").find("li").click(function(){
				$(this).parent().find("li").removeClass("active");
				$(this).addClass("active");
			});
			$.showDiagram($('#adView'), "line");
			initSpaceBlock();
		});

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
		</script> 
	</head> 
  
	<body>
		<div id="body-wrapper">
			<div id="sidebar">
			</div> <!-- End #sidebar --> 
			<script type="text/javascript">
				$("#sidebar").load("/resource/member/include/left.html", function(){
					$.setMenu(0, 0);
				});
			</script>
			<div id="main-content"> <!-- Main Content Section with everything --> 
				<!-- Page Head --> 
				<jsp:include page="/resource/member/include/navigation.html"></jsp:include>
				<div class="clear"></div> <!-- End .clear --> 
			
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>账户相关</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div><label>登录名：</label><span>${account}</span>(<strong><a href="###" target="_blank" title="什么是${type}">${type}</a></strong>)</div>
						<div><label>账户等级：</label><span>${level}</span>(<strong><a href="###" target="_blank">升级</a></strong>)</div>
						<div><label>账户积分：</label><span>${integral}</span></div>
						<div><label>账户余额：</label><span>${amount}</span>(<strong><a href="###" target="_blank">充值</a></strong>)</div>
						<div><label>上次登录：</label><span>${lastTime}</span>(<strong><strong>IP: ${lastIP}</strong></strong>)</div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block" style="display: ${entDisplay}">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>企业相关</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content tab_content" style="display:block">
						<div><label>企业名：</label><span>浙江淘宝网络有限公司</span>(<strong><a href="###" target="_blank" title="前往查看">www.taobao.com</a></strong>)</div>
						<div><label>创建时间：</label><span>2012-05-29 20:09:23</span></div>
						<div><label>上次更新时间：</label><span>2012-05-29 22:09:23</span></div>
						<div><label>总产品数量：</label><span>99</span>(<strong><a href="###" target="_blank">管理</a></strong>)</div>
						<div><label>总资讯数量：</label><span>45</span>(<strong><a href="###" target="_blank">管理</a></strong>)</div>
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
				
				<div class="block" style="background:none; padding-bottom:0px;">
					<div class="message info" style="margin:0px;">
						<p>您有<a href="###" id="msg_num_psn" title="前往查收">0</a>条个人消息和<a href="###" id="msg_num_sys" title="前往查收">0</a>条系统消息未读</p>
						<span class="close" onmouseover="$(this).addClass('hover');" onmouseout="$(this).removeClass('hover');" onclick="$(this).parent().parent().slideUp();"></span>
					</div>		<!-- .block_content ends -->
				</div>		<!-- .block ends -->
				
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
				
				<div class="block withsidebar">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>广告相关</h2>
					</div>		<!-- .block_head ends -->
					<div class="block_content">
						<div class="sidebar">
							<ul class="sidemenu">
								<li class="active"><a>广告标题一</a></li>
								<li><a>广告标题二</a></li>
								<li><a>广告标题三</a></li>
							</ul>
							<p><strong>如何投放广告.</strong>
								<br />广告投入可以让您的公司被更多的客户看到.</p>
						</div>		<!-- .sidebar ends -->
						<div class="sidebar_content" style="display:block">
							<div>
								<label>广告类型：</label><span>图文广告</span>(<strong><a href="###" target="_blank">什么是图文广告</a></strong>)
							</div>
							<div>
								<label>广告位置：</label><strong><a href="###" target="_blank">首页中央</a></strong>
							</div>
							<div>
								<label>广告价格：</label><span>1000/月</span>(<strong><a href="###" target="_blank">如何购买</a></strong>)
							</div>
							<div>
								<label>生效时间：</label><span>2012-12-26</span>
							</div>
							<div>
								<label>到期时间：</label><span>2012-12-26</span>(<strong><a href="###" target="_blank">续费</a></strong>)
							</div>
							<div>
								<label>广告内容：</label>
							</div>
						</div>		<!-- .sidebar_content ends -->
						<div class="sidebar_content">
							<div>
								<label>广告类型：</label><span>大字报</span>(<strong><a href="###" target="_blank">什么是图文广告</a></strong>)
							</div>
							<div>
								<label>广告位置：</label><span><a href="###" target="_blank">首页中间</a></span>
							</div>
							<div>
								<label>广告价格：</label><span>300/月</span>(<strong><a href="###" target="_blank">如何购买</a></strong>)
							</div>
							<div>
								<label>生效时间：</label><span><strong>2012-12-26</strong></span>
							</div>
							<div>
								<label>到期时间：</label><span><strong>2012-12-26</strong></span>(<strong><a href="###" target="_blank">续费</a></strong>)
							</div>
							<div>
								<label>广告内容：</label><span><a href="###" target="_blank">这是我的大字报内容</a></span>
							</div>
						</div>		<!-- .sidebar_content ends -->
						<div class="sidebar_content">
							<div>
								<label>广告类型：</label><span>大字报</span>(<strong><a href="###" target="_blank">什么是图文广告</a></strong>)
							</div>
							<div>
								<label>广告位置：</label><span><a href="###" target="_blank">首页中间</a></span>
							</div>
							<div>
								<label>广告价格：</label><span>300/月</span>(<strong><a href="###" target="_blank">如何购买</a></strong>)
							</div>
							<div>
								<label>生效时间：</label><span><strong>2012-12-26</strong></span>
							</div>
							<div>
								<label>到期时间：</label><span><strong>2012-12-26</strong></span>(<strong><a href="###" target="_blank">续费</a></strong>)
							</div>
							<div>
								<label>广告内容：</label><span><a href="###" target="_blank">这是我的大字报内容</a></span>
							</div>
						</div>		<!-- .sidebar_content ends -->
					</div>		<!-- .block_content ends -->
					<div class="bendl"></div>
					<div class="bendr"></div>
				</div>		<!-- .block ends -->
		
				<div class="block">
					<div class="block_head">
						<div class="bheadl"></div>
						<div class="bheadr"></div>
						<h2>点击统计</h2>
						<ul id="viewTabUl">
							<li class="nobg active"><a onclick="$.showDiagram($('#adView'), 'line');$('#otherView').hide();">广告</a></li>
							<li><a onclick="$.showDiagram($('#otherView'), 'line');$('#adView').hide();">其它</a></li>
						</ul>
					</div>		<!-- .block_head ends -->
					<div class="block_content" id="adView">
						<table>
							<thead>
								<tr>
									<td>&nbsp;</td>
									<th scope="col">01.03</th>
									<th scope="col">02.03</th>
									<th scope="col">03.03</th>
									<th scope="col">04.03</th>
									<th scope="col">05.03</th>
									<th scope="col">06.03</th>
									<th scope="col">07.03</th>
									<th scope="col">08.03</th>
									<th scope="col">09.03</th>
									<th scope="col">10.03</th>
									<th scope="col">11.03</th>
									<th scope="col">12.03</th>
									<th scope="col">13.03</th>
									<th scope="col">14.03</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>Page views</th>
									<td>50</td>
									<td>90</td>
									<td>40</td>
									<td>120</td>
									<td>180</td>
									<td>280</td>
									<td>320</td>
									<td>220</td>
									<td>100</td>
									<td>120</td>
									<td>40</td>
									<td>70</td>
									<td>20</td>
									<td>60</td>
								</tr>
								<tr>
									<th>Unique visitors</th>								
									<td>30</td>
									<td>50</td>
									<td>15</td>
									<td>90</td>
									<td>140</td>
									<td>160</td>
									<td>230</td>
									<td>170</td>
									<td>50</td>
									<td>90</td>
									<td>30</td>
									<td>50</td>
									<td>10</td>
									<td>40</td>
								</tr>
							</tbody>
						</table>
					</div>		<!-- .block_content ends -->
					<div class="block_content" id="otherView" style="display:none">
						<table>
							<thead>
								<tr>
									<td>&nbsp;</td>
									<th scope="col">JAN</th>
									<th scope="col">FEB</th>
									<th scope="col">MAR</th>
									<th scope="col">APR</th>
									<th scope="col">MAY</th>
									<th scope="col">JUN</th>
									<th scope="col">JUL</th>
									<th scope="col">AUG</th>
									<th scope="col">SEP</th>
									<th scope="col">OCT</th>
									<th scope="col">NOV</th>
									<th scope="col">DEC</th>
									<th scope="col">JAN</th>
									<th scope="col">FEB</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Page views</th>
									<td>1800</td>
									<td>900</td>
									<td>700</td>
									<td>1200</td>
									<td>600</td>
									<td>2800</td>
									<td>3200</td>
									<td>500</td>
									<td>2200</td>
									<td>1000</td>
									<td>1200</td>
									<td>700</td>
									<td>650</td>
									<td>800</td>
								</tr>
								<tr>
									<th scope="row">Unique visitors</th>								
									<td>1600</td>
									<td>650</td>
									<td>550</td>
									<td>900</td>
									<td>500</td>
									<td>2300</td>
									<td>2700</td>
									<td>350</td>
									<td>1700</td>
									<td>600</td>
									<td>1000</td>
									<td>500</td>
									<td>400</td>
									<td>700</td>
								</tr>
							</tbody>
						</table>	
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