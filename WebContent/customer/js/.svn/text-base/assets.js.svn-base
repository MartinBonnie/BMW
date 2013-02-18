var MonthList=["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
var MyProductList = new Array();
var AssetsMonth="", BusinessMonth="";
$(document).ready(function(){
    initGlobalProduct();
	initBgData();
});
initGlobalProduct = function(){
    $.ajax({
        type: "post",
        url: contextPath + "/account/assetsGlobalProduct",
        dataType: "json",
		async: false,
        data: { },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.isTrue) {
				$("#totalProduct").text(result.tag+"件");
				var totalWorth = 0.00;
				var html="";
				for(var i=0; i<result.items.length; i++){
					var obj = result.items[i];
					var totalValue = parseFloat(obj.price)*parseFloat(obj.stock);
					html+="<tr>";
					html+="<td>"+obj.prodId+"</td>";
					html+="<td>"+obj.name+"</td>";
					html+="<td>"+obj.stock+"</td>";
					html+="<td>"+obj.price+"</td>";
					html+="<td>"+obj.mallPrice+"</td>";
					html+="<td>"+totalValue.toFixed(2)+"</td>";
					html+="</tr>";
					totalWorth += totalValue;
					MyProductList.push(obj.prodId+","+obj.name);
				}
				$("#dataList").html(html);
				$("#totalWorth").text(totalWorth.toFixed(2));
				initMyProduct();
			} else {
				alert(result.message);
			}
        },
        error: function(){
            alert("系统忙，请稍后再试！");
        }
    });
}

initBgData = function(){
	var now = new Date();
	var html="";
	for(var i=2011; i<2020; i++){
		html+="<option value="+i+">"+i+"</option>";
	}
	$("#business_year").html(html).val(now.getFullYear());
	$("#assets_year").html(html).val(now.getFullYear());
	html="";
	for(var i=0; i< MonthList.length; i++){
		html+="<option value="+i+">"+ MonthList[i]+"</option>";
	}
	$("#business_month").html(html).val(now.getMonth());
	$("#assets_month").html(html).val(now.getMonth());
    $("#business_page").html("<option value=20>20</option><option value=50>50</option><option value=100>100</option><option value=100000>所有</option>").val(20);
    $("#assets_page").html("<option value=20>20</option><option value=50>50</option><option value=100>100</option><option value=100000>所有</option>").val(20);
	initBusiness(1);
	initAssets(1);
}

initMyProduct = function(){
	var html="<option value=\"\">全部</option>";
	for(var i=0; i< MyProductList.length; i++){
		var obj = MyProductList[i].split(",");
		html+="<option value=\""+obj[0]+"\">"+obj[1]+"</option>";
	}
	$("#business_product").html(html).val("");
}

initBusiness = function(page){
	var product = $("#business_product").val();
	var month = $("#business_year").val()+$("#business_month").val();
	var pageSize = $("#business_page").val();
	if(BusinessMonth!=month){
		BusinessMonth = month;
		initBusinessGlobal();
	}
	$.ajax({
        type: "post",
        url: contextPath + "/account/assetsBusiness",
        dataType: "json",
		async: false,
        data: {"businessProduct": product, "selMonth": month, "pageSize": pageSize, "page": page },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.isTrue) {
				if(result.tag==0){
					$("#businessPage").initPagination(pageSize, page, 1, "initBusiness");
					$("#business_data").html("<tr><td colspan=\"9\" style=\"text-align:center\">暂无数据！</td></tr>");
					$("#business_subtotal").html("<td>0件</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td>");
					return;
				}
                $("#businessPage").initPagination(pageSize, page, result.tag, "initBusiness");
                var totalNum = 0, totalAmount = 0, totalLogi = 0, toInvoice = 0, beInvoice = 0, toSettle = 0, beSettle = 0;
                var html = "";
				for(var i=0; i<result.items.length; i++){
					var obj = result.items[i];
					html+="<tr>";
					html+="<td title=\"产品编号："+obj.prodId+"\">"+obj.name+"</td>";
					html+="<td>"+obj.fromTar+"</td>";
					html+="<td>"+obj.price+"</td>";
					html+="<td>"+obj.num+"</td>";
					html+="<td>"+obj.amount+"</td>";
					html+="<td>"+obj.logistics+"</td>";
					if(obj.dealState=="已支付待发货" || obj.dealState=="提醒缺货"){
						var desc = "支付时间："+obj.payTime;
						html+="<td onmouseover=\"$(this).showDesc('"+desc+"')\">"+obj.dealState+"</td>";
					} else if(obj.dealState=="已发货待确认" || obj.dealState=="申请退货" ||  obj.dealState=="批准退货"){
						var desc = "支付时间："+obj.payTime+"<br />发货时间："+obj.diliverTime;
						html+="<td onmouseover=\"$(this).showDesc('"+desc+"')\">"+obj.dealState+"</td>";
					} else if(obj.dealState=="已收货"){
						toSettle += parseFloat(obj.amount);
						var desc = "支付时间："+obj.payTime+"<br />发货时间："+obj.diliverTime+"<br />收货时间"+obj.rechargeTime;
						html+="<td onmouseover=\"$(this).showDesc('"+desc+"')\">"+obj.dealState+"</td>";
					} else if(obj.dealState=="已退货"){
						var desc = "支付时间："+obj.payTime+"<br />发货时间："+obj.diliverTime+"<br />退货时间"+obj.returnTime;
						html+="<td onmouseover=\"$(this).showDesc('"+desc+"')\">"+obj.dealState+"</td>";
					} else if(obj.dealState=="已结算"){
						toSettle += parseFloat(obj.amount);
						beSettle += parseFloat(obj.amount);
						var desc = "支付时间："+obj.payTime+"<br />发货时间："+obj.diliverTime+"<br />收货时间"+obj.rechargeTime+"<br />结算时间："+obj.settleTime;
						html+="<td onmouseover=\"$(this).showDesc('"+desc+"')\">"+obj.dealState+"</td>";
					} else {
						html+="<td>"+obj.dealState+"</td>";
					}
					if(obj.invoiceState=="未要求开发票"){
						html+="<td><font color=\"#ccc\">无需开发票</font></td>";
					} else if(obj.invoiceState=="需开发票待开"){
						toInvoice += parseFloat(obj.amount);
						html+="<td><font color=\"red\">待开发票</font></td>";
					} else {
						toInvoice += parseFloat(obj.amount);
						beInvoice += parseFloat(obj.amount);
						html+="<td title=\""+obj.invoiceState.split(",")[1]+"\">"+obj.invoiceState.split(",")[0]+"</td>";
					}
					html+="<td>"+obj.orderTime+"</td>";
					html+="</tr>";
					totalNum += parseFloat(obj.num);
					totalAmount += parseFloat(obj.amount);
					totalLogi += parseFloat(obj.logistics);
				}
				$("#business_data").html(html);
				$("#business_subtotal").html("<td>"+totalNum+"件</td>"
				+"<td>"+ totalAmount.toFixed(2)+"</td>"
				+"<td>"+ totalLogi.toFixed(2)+"</td>"
				+"<td>"+ toInvoice.toFixed(2)+"</td>"
				+"<td>"+ beInvoice.toFixed(2)+"</td>"
				+"<td>"+ toSettle.toFixed(2)+"</td>"
				+"<td>"+ beSettle.toFixed(2)+"</td>");
			} else {
				alert(result.message);
			}
        },
        error: function(){
            alert("系统忙，请稍后再试！");
        }
    });
}

initBusinessGlobal = function(){
	$.ajax({
        type: "post",
        url: contextPath + "/account/assetsBusinessGlobal",
        dataType: "json",
		async: false,
        data: {"selMonth": BusinessMonth },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.isTrue) {
				$("#business_total").html("<td>"+result.tag.totalNum+"件</td>"
				+"<td>"+ parseFloat(result.tag.totalAmount).toFixed(2)+"</td>"
				+"<td>"+ parseFloat(result.tag.totalLogi).toFixed(2)+"</td>"
				+"<td>"+ parseFloat(result.tag.toInvoice).toFixed(2)+"</td>"
				+"<td>"+ parseFloat(result.tag.beInvoice).toFixed(2)+"</td>"
				+"<td>"+ parseFloat(result.tag.toSettle).toFixed(2)+"</td>"
				+"<td>"+ parseFloat(result.tag.beSettle).toFixed(2)+"</td>");
			} else {
				alert(result.message);
			}
        },
        error: function(){
            alert("系统忙，请稍后再试！");
        }
    });
}

initAssets = function(page){
	var month = $("#assets_year").val()+$("#assets_month").val();
	var pageSize = $("#assets_page").val();
	if(AssetsMonth!=month){
		AssetsMonth = month;
		initAssetsGlobal();
	}
	$.ajax({
        type: "post",
        url: contextPath + "/account/assetsAssets",
        dataType: "json",
		async: false,
        data: {"selMonth": month, "pageSize": pageSize, "page": page },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.isTrue) {
				if(result.tag==0){
					$("#assetsPage").initPagination(pageSize, page, 1, "initAssets");
					$("#assets_data").html("<tr><td colspan=\"6\" style=\"text-align:center\">暂无数据！</td></tr>");
					return;
				}
                var html = "";
				for(var i=0; i<result.items.length; i++){
					var obj = result.items[i];
					html+="<tr>";
					html+="<td>"+obj.rechargeFlag+"</td>";
					html+="<td>"+obj.amount+"</td>";
					if(obj.upBank.length!=0){
						html+="<td onmouseover=\"$(this).showDesc('充值银行："+obj.upBank+"')\">"+obj.upType+"</td>";
					} else {
						html+="<td>"+obj.upType+"</td>";
					}
					html+="<td>"+obj.upEvidence+"</td>";
					if(obj.orderTar.length!=0){
						html+="<td onmouseover=\"$(this).showDesc('订单号："+obj.orderTar+"')\">"+obj.orderProduct+"</td>";
					} else {
						html+="<td>"+obj.orderProduct+"</td>";
					}
					html+="<td>"+obj.addTime+"</td>";
				}
				$("#assets_data").html(html);
                $("#assetsPage").initPagination(pageSize, page, result.tag, "initAssets");
			} else {
				alert(result.message);
			}
        },
        error: function(){
            alert("系统忙，请稍后再试！");
        }
    });
}

initAssetsGlobal = function(){
	$.ajax({
        type: "post",
        url: contextPath + "/account/assetsAssetsGlobal",
        dataType: "json",
		async: false,
        data: {"selMonth": AssetsMonth },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.isTrue) {
				$("#totalIn").html(parseFloat(result.tag.totalIn).toFixed(2));
				$("#totalOut").html(parseFloat(result.tag.totalOut).toFixed(2));
			} else {
				alert(result.message);
			}
        },
        error: function(){
            alert("系统忙，请稍后再试！");
        }
    });
}

showTab = function(index){
	var tabObj = $("#tabUl");
	tabObj.find("li").removeClass("current").eq(index).addClass("current");
	tabObj.parent().nextAll().hide().eq(index).show();
}

resetBusiness = function(){
	var now = new Date();
	$("#business_product").val("");
	$("#business_year").val(now.getFullYear());
	$("#business_month").val(now.getMonth());
	$("#business_page").val(20);
}

resetAssets = function(){
	var now = new Date();
	$("#assets_year").val(now.getFullYear());
	$("#assets_month").val(now.getMonth());
	$("#assets_page").val(20);
}

$.fn.showDesc = function(desc, width){
    if ($("#floatDescDiv").html() == null) {
		if(width==null) width=180;
        $("body").append("<div id=\"floatDescDiv\" style=\"border:1px solid #ccc; background:#000; color:#fff; display:none; "
		+"padding:2px 4px; position:absolute; width:"+width+"px; z-index:99999; \"></div>");
    }
    var position = $(this).position();
    $("#floatDescDiv").css({
        "top": position.top + "px",
        "left": (position.left + $(this).outerWidth()) + "px"
    }).html(desc).show();
    $(this).one("mouseout", function(){
        $("#floatDescDiv").hide();
    });
}


