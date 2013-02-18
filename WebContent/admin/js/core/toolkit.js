/**
 * 遮罩层控件
 * op:开关
 * z-index:层级，默认99
 */
$.showAddBg = function(op, zIndex, isLoading){
    if (op) {
    	if($("#BG_SHADE_DIV").length==0){
        	$("body").append("<div id=\"BG_SHADE_DIV\"></div>");
        	$(window).resize(function(){
				$("#BG_SHADE_DIV").css({
		            "height": $(document).height() + "px",
		            "width": $(document).width() + "px"
		       });
			});
    	} 
        $("#BG_SHADE_DIV").css({
            "height": $(document).height() + "px",
            "width": $(document).width() + "px",
            "zIndex": 99
        }).show();
        if (zIndex != null) {
            $("#BG_SHADE_DIV").css("zIndex", zIndex);
        }
        if(isLoading) {
        	$("#BG_SHADE_DIV").html("<div class=\"loading\">&nbsp</div>");
        }
    }
    else {
        $("#BG_SHADE_DIV").hide().empty();
    }
};

/**
 * 显示当前DIV的详细描述
 */
$.showShortCon = function(id, content, length){
	if(content.length>length){
		return content.substr(0, (length-3))+"...<a style=\"margin-left:5px;\" onmouseover=\"showDetail($(this).parent(), '"+id+"')\" >[详细]</a>";
	} else {
		return content;
	}
};
$.showDesc = function(dom, desc){
    if ($("#FLOAT_DESC_DIV").length == 0) {
        $("body").append("<div id=\"FLOAT_DESC_DIV\" onmouseover=\"$(this).show();\" onmouseout=\"$(this).hide();\" style=\"background:#353C44; color:#fff; display:none; "
		+"padding:5px 5px 20px 5px; overflow-x:auto; position:absolute; z-index:98; \"><pre></pre></div>");
    }
    $("#FLOAT_DESC_DIV").css({
        "top": (dom.offset().top + dom.outerHeight()) + "px",
        "left": dom.offset().left + "px",
        "width": ($("body").width()-dom.offset().left-60)+"px"
    }).show().find("pre").html(desc);
};
$.hideDesc = function(){
	$("#FLOAT_DESC_DIV").hide();
};
/**
 * 显示提示卡片
 * msg	提示的内容那个
 * btn	按钮的显示内容
 * fun	点击按钮额外触发的动作
 */
$.showAlert = function(msg, btn, fun){
	$.showAddBg(true, 99998);
	if($("#FLOAT_ALERT_DIV").length!=0) {
		$("#FLOAT_ALERT_DIV").remove();
	}
	$("body").append("<div id=\"FLOAT_ALERT_DIV\" class=\"divAlertCard\">"
			+"<span class=\"btn\">"+btn+"</span>"
			+"<span class=\"pin\"></span>"
			+"<span class=\"text\">"+msg+"</span></div>");
	var self = $("#FLOAT_ALERT_DIV");
	self.slideDown("fast").find("span.btn").bind("click", function(){
		self.slideUp("fast");
		$.showAddBg(false);
		if($.isFunction(fun)) {
			fun();
		}
	});
};

$.changeAlert = function(msg){
	if($("#FLOAT_ALERT_DIV").length!=0) {
		$("#FLOAT_ALERT_DIV").find("span.text").html(msg);
	}
};

$.hideAlert = function(){
	$.showAddBg(false);
	if($("#FLOAT_ALERT_DIV").length!=0) {
		$("#FLOAT_ALERT_DIV").slideUp("fast", function(){
			$(this).remove();
		});
	}
};

$.fn.showChoose = function(showList, valueList, clickFun){
	$.showAddBg(true, 99998);
	if($("#FLOAT_CHOOSE_DIV").length==0) {
		$("body").append("<div id=\"FLOAT_CHOOSE_DIV\" class=\"divRateCard\" style=\"height:20px; right:auto;\"></div>");
	}
	var html = "";
	for(var i=0; i<showList.length; i++) {
		html+= "<span class=\"btn\" onclick=\""+clickFun+"('"+valueList[i]+"');\">"+showList[i]+"</span>";
	}
	html+= "<span class=\"cancel\">取消</span>";
	var self = $("#FLOAT_CHOOSE_DIV");
	var position = $(this).offset();
	self.html(html).css({
		"left": (position.left-1)+"px",
		"top": (position.top+$(this).outerHeight())+"px"
	}).slideDown("fast");
	self.find("span").click(function(){
		self.slideUp("fast");
		$.showAddBg(false);
	});
};

/**
 * 设置匹配搜索框 ,只需一开始的时候调用一次
 * @param {Object} inputId	搜索输入框ID
 * @param {Object} enterFun	回车后调用的方法名
 * @param {Object} matchFun	搜索候选值的ajax方法名，控件会自动获取其返回值，此ajax方法参照以下格式：
 * 
 */
$.setMatchList = function(inputId, enterFun, matchFun){
    var tempValue = "";
    var MatchIndex = 0;
    var MatchMax = 0;
    var NowMatchCon = "";
    var ulId = inputId + "_matchUL";
    var iptDOM = $("#" + inputId);
    $("body").append("<ul id=\"" + ulId + "\" class=\"matchUL\">");
    var topDOM = $("#" + ulId);
    topDOM.css({
        "top": (iptDOM.offset().top + iptDOM.outerHeight()) + "px",
        "left": iptDOM.offset().left + "px",
        "width": (iptDOM.outerWidth() - 2) + "px"
    }).attr("autocomplete", "off").blur(function(){
        topDOM.hide();
    }).delegate("li", "mousedown", function(){
        topDOM.hide().css({
	        "top": (iptDOM.offset().top + iptDOM.outerHeight()) + "px",
	        "left": iptDOM.offset().left + "px",
	        "width": (iptDOM.outerWidth() - 2) + "px"
	    });
    	tempValue = $(this).attr("id");
    	enterFun(tempValue);
    	tempValue = "";
    	iptDOM.val("");
	}).delegate("li", "mouseover", function(){
		topDOM.find("li").removeClass('on');
		$(this).addClass("on");
	}).delegate("li", "mouseout", function(){
		MatchIndex = MatchMax;
		tempValue = "";
	});
	
    iptDOM.keyup(function(e){
        if (e.keyCode == 40) {
            if (MatchIndex == MatchMax) {
                MatchIndex = 0;
                topDOM.find("li").eq(MatchIndex).addClass("on");
                iptDOM.val(topDOM.find("li").eq(MatchIndex).html());
                tempValue = topDOM.find("li").eq(MatchIndex).attr("id");
            } else if (MatchIndex == (MatchMax - 1)) {
                topDOM.find("li").eq(MatchIndex).removeClass("on");
                MatchIndex++;
                iptDOM.val(NowMatchCon);
                tempValue = "";
            } else {
                topDOM.find("li").eq(MatchIndex).removeClass("on");
                MatchIndex++;
                topDOM.find("li").eq(MatchIndex).addClass("on");
                iptDOM.val(topDOM.find("li").eq(MatchIndex).html());
                tempValue = topDOM.find("li").eq(MatchIndex).attr("id");
            }
        } else if (e.keyCode == 38) {
            if (MatchIndex == MatchMax) {
                MatchIndex--;
                topDOM.find("li").eq(MatchIndex).addClass("on");
                iptDOM.val(topDOM.find("li").eq(MatchIndex).html());
                tempValue = topDOM.find("li").eq(MatchIndex).attr("id");
            } else if (MatchIndex == 0) {
                topDOM.find("li").eq(MatchIndex).removeClass("on");
                MatchIndex = MatchMax;
                iptDOM.val(NowMatchCon);
                tempValue = "";
            } else {
                topDOM.find("li").eq(MatchIndex).removeClass("on");
                MatchIndex--;
                topDOM.find("li").eq(MatchIndex).addClass("on");
                iptDOM.val(topDOM.find("li").eq(MatchIndex).html());
                tempValue = topDOM.find("li").eq(MatchIndex).attr("id");
            }
        } else if (e.keyCode == 13) {
            topDOM.hide().css({
		        "top": (iptDOM.offset().top + iptDOM.outerHeight()) + "px",
		        "left": iptDOM.offset().left + "px",
		        "width": (iptDOM.outerWidth() - 2) + "px"
		    });
            if($.trim(tempValue).length!=0){
            	enterFun(tempValue);
            	tempValue = "";
            	iptDOM.val("");
            }
        } else {
			tempValue = "";
            NowMatchCon = $.trim(iptDOM.val());
            if (NowMatchCon == "") {
                topDOM.empty().hide();
            } else {
            	if($.trim(iptDOM.val()).length==0){
            		return;
            	}
                var DataList = matchFun($.trim(iptDOM.val()).filterSC());
                MatchMax = DataList.length;
                MatchIndex = MatchMax;
                if (DataList.length == 0) {
                    topDOM.empty().hide();
                    return;
                }
                var html = "";
                for (var i = 0; i < DataList.length; i++) {
                    var obj = DataList[i];
                    html += "<li id=\"" + obj[0] + "\">" + obj[1] + "</li>";
                }
                topDOM.html(html).show();
            }
        }
    });
};

/**
 * 显示进度条
 */
$.showUploadRate = function(parentDiv){
    var html = "<div id=\"" + parentDiv + "_rate\" style=\"border:1px solid #008EE8; float:left; height:20px; width:200px\">" +
    "<div id=\"" +
    parentDiv +
    "_bg\" style=\"background:#6495ED; float:left; height:100%; width:0%\">" +
    "<span id=\"" +
    parentDiv +
    "_val\" style=\"float:right; margin-right:-200px; line-height:20px;\">0%</span></div></div>";
    $("#" + parentDiv).html(html);
    $.startUpload(parentDiv, 10, 0);
};
$.startUpload = function(parentDiv, speed, rate) {
	var timer = null;
	timer = window.setInterval(function() {
		if(rate == 50) {
			window.clearInterval(timer);
			$.startUpload(parentDiv, 50, 51);
		} else if(rate == 98) {
			window.clearInterval(timer);
		}
		$("#" + parentDiv + "_bg").css("width", rate + "%");
		$("#" + parentDiv + "_val").css("margin-right", (rate * 2 - 200) + "px").text(rate + "%");
		rate++;
	}, speed);
}; 
$.endUpload = function(parentDiv){
    $("#" + parentDiv + "_bg").css("width", "100%");
    $("#" + parentDiv + "_val").css("margin-right", "0px").text("100%");
};
$.removeUpload = function(parentDiv){
    $("#" + parentDiv + "_rate").remove();
};

/**
 * 分页控件
 * funName:分页点击后调用的方法，参数必须为当前跳转页面
 * totalPage:总页数
 * curPage:当前页码
 */
$.fn.initPagination = function(funName, totalPage, curPage) {
    var PageHtml = "";
    var TotalPageNum = parseInt(totalPage, 10);
    var CurrentPageNum = parseInt(curPage, 10);
    if (TotalPageNum <= 10) {
    	for(var i=1; i<=TotalPageNum; i++) {
        	if(i==CurrentPageNum) {
            	PageHtml += "<a href=\"###\" class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
        	} else {
            	PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
        	}
        }
    } else {
    	if(CurrentPageNum<=4){
    		for (var i = 1; i < 9; i++) {
            	if(i==CurrentPageNum) {
	            	PageHtml += "<a href=\"###\" class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
            }
            PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+(CurrentPageNum+10>TotalPageNum?TotalPageNum:CurrentPageNum+10)+");\">...</a>";
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+TotalPageNum+");\">&raquo;"+TotalPageNum+"</a>";
    	} else if(TotalPageNum-CurrentPageNum<=7) {
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"(1);\">1&laquo;</a>";
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+(CurrentPageNum-10<1?1:CurrentPageNum-10)+");\">...</a>";
    		for (var i = (TotalPageNum-8); i <= TotalPageNum; i++) {
            	if(i==CurrentPageNum) {
	            	PageHtml += "<a href=\"###\" class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
            }
    	} else {
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"(1);\">1&laquo;</a>";
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+(CurrentPageNum-10<1?1:CurrentPageNum-10)+");\">...</a>";
    		for(var i=CurrentPageNum-2; i<=CurrentPageNum+5; i++){
    			if(i==CurrentPageNum) {
	            	PageHtml += "<a href=\"###\" class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
    		}
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+(CurrentPageNum+10>TotalPageNum?TotalPageNum:CurrentPageNum+10)+");\">...</a>";
    		PageHtml += "<a href=\"###\" onclick=\"" + funName+"("+TotalPageNum+");\">&raquo;"+TotalPageNum+"</a>";
    	}
    }
    $(this).html(PageHtml);
};

String.prototype.trim = function(){
	return $.trim(this);
};
/**
 * 转换数字到日期字符串
 * @param {Object} type	1:"yyyy-MM-dd HH:mm:ss"; 2:"yyyy-MM-dd"; 3:"yyyy-MM-dd HH:mm"; 4:"yyyy-MM"; 5:"array"
 */
Number.prototype.date = function(type){
	var date = new Date(this);
	var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var min = date.getMinutes();
    var sec = date.getSeconds();
    if (month < 10) 
        month = "0" + month;
    if (day < 10) 
        day = "0" + day;
    if (hour < 10) 
        hour = "0" + hour;
    if (min < 10) 
        min = "0" + min;
    if (sec < 10) 
        sec = "0" + sec;
    switch(type) {
    	case 1:
    		return year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec;
    	case 2:
			return year + "-" + month + "-" + day;
    	case 3:
			return year + "-" + month + "-" + day + " " + hour + ":" + min;
    	case 4:
			return year + "-" + month;
    	case 5:
			return new Array(year, month, day, hour, min, sec);
		default:
    		return year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec;
    }
};

/**
 * 转换字符串到日期对象
 * @param {Object} type 1:"yyyy-MM-dd"; 2:"yyyy-MM-dd HH:mm:ss"; 
 */
String.prototype.toDate = function(type){
    switch(type) {
    	case 1:
			var y_m_d = this.split("-");
			return new Date(y_m_d[0], (parseInt(y_m_d[1], 10)-1), y_m_d[2]);
    	case 2:
    		var y_m_d = this.split(" ")[0].split("-");
    		var h_m_s = this.split(" ")[1].split(":");
			return new Date(y_m_d[0], (parseInt(y_m_d[1], 10)-1), y_m_d[2], h_m_s[0], h_m_s[1], h_m_s[2]);
		default:
			var y_m_d = this.split("-");
			return new Date(y_m_d[0], (parseInt(y_m_d[1], 10)-1), y_m_d[2]);
    }
};

String.prototype.betweenTime = function(){
	var target = this.toDate(2);
	var between = target.getTime() - new Date().getTime();
	var day = parseInt(between/(3600*24*1000));
	between = between - day*3600*24*1000;
	var hour = parseInt(between/(3600*1000));
	between = between - hour*3600*1000;
	var min = parseInt(between/60000);
	return day+"天"+hour+"小时"+min+"分钟";
};

Number.prototype.duration = function(){
	var between = this;
	var day = parseInt(between/(3600*24*1000));
	between = between - day*3600*24*1000;
	day = day==0?"":day+"天";
	var hour = parseInt(between/(3600*1000));
	between = between - hour*3600*1000;
	hour = (hour==0&&day=="")?"":hour+"小时";
	var min = parseInt(between/60000);
	min = min+"分钟";
	return day+hour+min;
};

Number.prototype.gender = function(){
	if(this==0) {
		return "女";
	} else {
		return "男";
	}
};

Number.prototype.deploy = function(){
	if(this==1) {
		return "已配置";
	} else {
		return '<font style="color:#999;">未配置</font>';
	}
};

Number.prototype.vstatus = function(){
	if(this==1) {
		return "已有任务";
	} else {
		return '<font style="color:#999;">暂无任务</font>';
	}
};

String.prototype.status = function(){
	switch(this.toString()) {
		case "00":
			return "未执行";
		case "01":
			return "<font style=\"color:crimson;\">执行中</font>";
		case "09":
			return "<font style=\"color:#999;\">已结束</font>";
		default:
			return "";
	}
};

String.prototype.remind = function(){
	switch(this.toString()) {
		case "00":
			return "手机和终端";
		case "01":
			return "仅手机";
		case "02":
			return "仅终端";
		case "09":
			return "不发送";
		default:
			return "";
	}
};

String.prototype.msg = function(){
	switch(this.toString()) {
		case "00":
			return "实时短信";
		case "01":
			return "定时短信";
		case "02":
			return "循环短信";
		default:
			return "";
	}
};

String.prototype.sendTime = function(msgType, addTime){
	switch(msgType) {
		case "00":
			return addTime.date();
		case "01":
			return this.replace("_", " ");
		case "02":
			var result = "星期";
			var day = this.split("_")[0].split(",");
			for(var i=0; i<day.length; i++){
				result+=GLOBAL.WEEK_SHOW[day[i]];
			}
			return result+"的"+this.split("_")[1];
		default:
			return "";
	}
};

String.prototype.mileType = function(){
	switch(this.toString()) {
		case "00":
			return "按天统计";
		case "01":
			return "按月统计";
		case "10":
			return "按年统计";
		default:
			return "全部";
	}
};

String.prototype.logtype = function(){
	switch(this.toString()) {
		case "00":
			return "账号相关";
		case "03":
			return "客户数据";
		case "04":
			return "司机数据";
		case "05":
			return "车辆数据";
		case "06":
			return "终端数据";
		case "07":
			return "调度操作";
		case "08":
			return "报表操作";
		case "09":
			return "任务操作";
		case "11":
			return "车辆配置";
		default:
			return "未知类型";
	}
};


// A more performant, but slightly bulkier, RFC4122v4 solution.  We boost performance
// by minimizing calls to random()
Math.uuid = function() {
	var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split(''), uuid = new Array(36), rnd = 0, r;
	for(var i = 0; i < 36; i++) {
		if(i == 8 || i == 13 || i == 18 || i == 23) {
			uuid[i] = '-';
		} else if(i == 14) {
			uuid[i] = '4';
		} else {
			if(rnd <= 0x02)
				rnd = 0x2000000 + (Math.random() * 0x1000000) | 0;
			r = rnd & 0xf;
			rnd = rnd >> 4;
			uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
		}
	}
	return uuid.join('');
};

$.fn.hour = function(start, value){
	var html = "";
	for(var i=start; i<24; i++){
		var temp = i;
		if(i<10) {
			temp = "0"+i;
		}
		html += "<option value=\""+temp+"\">"+temp+"</option>";
	}
	$(this).html(html).val(value);
};
$.fn.minute = function(start, value){
	var html = "";
	for(var i=start; i<60; i++){
		var temp = i;
		if(i<10) {
			temp = "0"+i;
		}
		html += "<option value=\""+temp+"\">"+temp+"</option>";
	}
	$(this).html(html).val(value);
};

$.formatObj = function(obj){
	for (var key in obj) {
		if(obj[key]==null) {
			obj[key]="";
		}
	};
	return obj;
};






























