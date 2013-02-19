/**
 * @index: 一级菜单序号
 * @subIndex:二级菜单序号
 * @titleObj: 左边栏显示的欢迎信息
 * 效果：只添加动态滑动效果，当前选项的样式不变；
 * 没有子菜单的直接跳转，有子菜单的一级菜单点击查看，二级菜单跳转；
 */
$.setMenu = function(index, subIndex) {
	var navDOM = $("#main-nav");
	if(index == 0) {
		navDOM.find("li:eq(0)").find("a").addClass("current");
	} else {
		var targetLi = navDOM.children("li").eq(index);
		targetLi.children("a").addClass("current");
		targetLi.find("ul").show().find("li").eq(subIndex).children("a").addClass("current");
	}
	navDOM.find("a.nav-top-item").click(function() {// When a top menu item is clicked...
		$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
		$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
		return false;
	}).hover(function() {
		$(this).stop().animate({
			paddingRight : "25px"
		}, 200);
	}, function() {
		$(this).stop().animate({
			paddingRight : "15px"
		});
	});
	navDOM.find("a.no-submenu").click(function() {// When a menu item with no sub menu is clicked...
		window.location.href = $(this).attr("href");
		return false;
	});
	$.ajax({
		type : "get",
		async: false,
		url : "/web/member/account/getLeftView",
		dataType : "json",
		data : {},
		success : function(result) {
			if(result.isTrue){
				$("#helloTag").html(result.tag.hello);
				$("#userName").html(result.tag.name);
				var _msg = result.tag.msg.split("_");
			    $("#msgNum").html(parseInt(_msg[0], 10)+parseInt(_msg[1], 10));
			    if(index==0 || index==5) {
			    	$(document).ready(function(){
				    	$("#msg_num_psn").html(_msg[0]);
				    	$("#msg_num_sys").html(_msg[1]);
			    	});
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

/**
 * @conDOM 容器ID
 * @chartType 图标类型:line, bar, area
 * 效果：根据容器内的数据显示相应的图表
 */
$.showDiagram = function(conDOM, chartType){
	var tableDOM = conDOM.find("table");
	conDOM.find("div.visualize").remove();
	conDOM.show();
	tableDOM.hide().visualize({
		type: chartType,	// 'bar', 'area', 'pie', 'line'
		width: conDOM.width()-60,
		height: '240px',
		colors: ['#6fb9e8', '#ec8526', '#9dc453', '#ddd74c'],
		lineDots: 'double',
		interaction: chartType=="bar"?false:true,
		multiHover: 20,
		tooltip: true,
		tooltiphtml: function(data) {
			var html ='';
			for(var i=0; i<data.point.length; i++){
				html += '<p class="chart_tooltip"><strong>'+data.point[i].value+'</strong></p>';
			}	
			return html;
		}
	});
};

/**
 * 遮罩层控件
 * op:开关
 * z-index:层级，默认99
 */
$.showAddBg = function(op, zIndex, isLoading){
    if (op) {
    	if($("#BG_SHADE_DIV").length==0){
        	$("body").append("<div id=\"BG_SHADE_DIV\" style=\"background:#000; position:absolute; filter:alpha(opacity=10);opacity:0.1; left:0; top:0; z-index:99\"></div>");
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
 * 显示提示框
 * type:error|warning
 * eg. $.showPrompt("error", "this is s error msg!");
 */
$.showPrompt = function(type, message){
	if($("#PROMPT").length==0){
		$("body").append("<div style=\"z-index:200\" id=\"PROMPT\" class=\""+type+"\"><p>"+message
			+"</p><span onclick=\"$('#PROMPT').hide();\" onmouseover=\"$(this).addClass('hover');\" onmouseout=\"$(this).removeClass('hover');\"></span></div>");
	} 
	var temp_dom = $("#PROMPT");
	temp_dom.attr("class", type).find("p").html(message);
	temp_dom.show();
	window.setTimeout(function(){
		temp_dom.hide();
	}, 3000);
};

/**
 *显示确认框
 * callback:回调函数的方法名，非字符串
 * data:回调函数的参数，变量，可不传
 * eg. $.showConfirm("this is s confirm msg!", goonFun, {"key": "value"});
 */
$.showConfirm = function(message, callback, data){
	$.showAddBg(true, 99);
	if($("#CONFIRM").length==0){
		$("body").append("<div style=\"z-index:200\" id=\"CONFIRM\"><p>"+message+"</p><span>"
			+"<a class=\"button\">确定</a><a onclick=\"$('#CONFIRM').hide().find('a');$.showAddBg(false);\" class=\"button\">取消</a></span></div>");
	} 
	var temp_dom = $("#CONFIRM");
	temp_dom.find("p").html(message);
	temp_dom.show();
	temp_dom.find("a").eq(0).one("click", function(){
		temp_dom.hide().find("a").unbind();
		$.showAddBg(false);
		callback(data);
	});
	temp_dom.find("a").eq(1).one("click", function(){
		temp_dom.hide().find("a").unbind();
		$.showAddBg(false);
	});
};

/**
 * 显示当前DIV的详细描述
 */
$.fn.showDesc = function(desc, width){
    if ($("#floatDescDiv").html() == null) {
		if(width==null) width=150;
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
};

/*
 * 设置匹配搜索框 ,只需一开始的时候调用一次
 * @param {Object} inputId	搜索输入框ID
 * @param {Object} inputValueId	放置已选匹配条目ID的隐藏input框ID，如果没有这个需求，则传null
 * @param {Object} matchFun		搜索候选值的ajax方法名，控件会自动获取其返回值，此ajax方法参照以下格式：
 */
$.setMatchList = function(inputId, inputValueId, matchFun){
    var isSetValue = true;
    var MatchIndex = 0;
    var MatchMax = 0;
    var NowMatchCon = "";
    var ulId = inputId + "_matchUL";
    var position = $("#" + inputId + "").position();
    var top = position.top + $("#" + inputId + "").outerHeight();
    var left = position.left;
    var width = $("#" + inputId + "").outerWidth() - 2;
    $("body").append("<ul id=\"" + ulId + "\" class=\"matchUL\">");
    $("#" + ulId + "").css({
        "top": top + "px",
        "left": left + "px",
        "width": width + "px"
    });
    if (inputValueId == null || $.trim(inputValueId) == "") 
        isSetValue = false;
    $("#" + inputId + "").attr("autocomplete", "off");
    $("#" + inputId + "").blur(function(){
        $("#" + ulId + "").hide();
    });
    $("#" + inputId + "").keyup(function(e){
        if (e.keyCode == 40) {
            if (MatchIndex == MatchMax) {
                MatchIndex = 0;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
                if (isSetValue) {
					$("#" + inputValueId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
				}
                    
            } else if (MatchIndex == (MatchMax - 1)) {
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                MatchIndex++;
                $("#" + inputId + "").val(NowMatchCon);
                if (isSetValue) {
					$("#" + inputValueId + "").val("");
				}
            } else {
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                MatchIndex++;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
                if (isSetValue) {
					$("#" + inputValueId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
				}
            }
        } else if (e.keyCode == 38) {
            if (MatchIndex == MatchMax) {
                MatchIndex--;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
                if (isSetValue) {
					$("#" + inputValueId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
				}
            } else if (MatchIndex == 0) {
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                MatchIndex = MatchMax;
                $("#" + inputId + "").val(NowMatchCon);
                if (isSetValue) {
					$("#" + inputValueId + "").val("");
				}
            } else {
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                MatchIndex--;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
                if (isSetValue) {
					$("#" + inputValueId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
				}
            }
        } else if (e.keyCode == 13) {
            $("#" + ulId + "").hide();
        } else {
			$("#" + inputValueId + "").val(" ");
            NowMatchCon = $.trim($("#" + inputId + "").val());
            if (NowMatchCon == "") {
                $("#" + ulId + "").empty().hide();
            } else {
                var DataList = eval(matchFun + '()');
                MatchMax = DataList.length;
                MatchIndex = MatchMax;
                if (DataList.length == 0) {
                    $("#" + ulId + "").empty().hide();
                    return;
                }
                var html = "";
                for (var i = 0; i < DataList.length; i++) {
                    var obj = DataList[i];
                    html += "<li id=\"" + obj[0] + "\">" + obj[1] + "</li>";
                }
                $("#" + ulId + "").html(html).show();
                
                $("#" + ulId + " > li").mousedown(function(){
                    $("#" + inputId).val($("#" + ulId + " > li.on").text());
                    if (isSetValue) 
                        $("#" + inputValueId).val($("#" + ulId + " > li.on").attr("id"));
                    $("#" + ulId + "").hide();
                });
                $("#" + ulId + " > li").hover(function(){
                    $("#" + ulId + " > li").removeClass("on");
                    $(this).addClass("on");
                }, function(){
                    MatchIndex = MatchMax;
                });
            }
        }
    });
};

/**
 * 显示进度条
 */
$.showUploadRate = function(parentDiv){
    var html = "<div id=\"" + parentDiv + "_rate\" style=\"border:1px solid #ccc; float:left; height:20px; width:200px\">" +
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
 * 创建下拉菜单框
 * options: json类型，参数值，可传{}
 * defaultVal: 缺省显示内容
 * showList: 选项的显示内容
 * valList: 选项的值，点击后自动赋值到input寄主
 * desc:根据defaultVal参数将自动匹配候选项，如果匹配不到则默认为候选项第一个，然后自动触发onchange事件
 */
$.fn.select = function(options, defaultVal, showList, valList){
	var target = $(this);
	var params = $.extend({
		width: $(this).width(), //width of select - defaults to table height
		size: 10, //height of select - defaults to table height
		lineHeight: $(this).height(),
		zIndex: 9999
	}, options);
	params.topDOM = $(document);
	params.bodyDOM = $("body");
	if($("#select_plugin_bg").length==0){
		params.bodyDOM.append("<div id=\"select_plugin_bg\" style=\"background:#000; cursor:default; display:none; position:absolute; filter:alpha(opacity=0);opacity:0; height:"
			+params.topDOM.height()+"px; width:"+params.topDOM.width()+"px; left:0; top:0; z-index:"+(params.zIndex+1)+"\" ></div>");
	}
	params.mouseBg = $("#select_plugin_bg");
    params.showMouseBg = function(op){
        if (op) {
        	params.mouseBg.css({"height": params.topDOM.height()+"px", "width": params.topDOM.width()+"px"}).show();
        } else {
            params.mouseBg.hide();
        }
    };
	if(target.data("key")){
		$("#select_head_"+target.data("key")).remove();
		$("#select_content_"+target.data("key")).remove();
	} 
	params.offset = target.offset();
	target.data("key", Math.uuid());
	params.key = target.data("key");
	params.bodyDOM.append("<div id=\"select_head_"+params.key+"\" style=\"border:1px solid #999; width:"
		+params.width+"px; height:"+params.lineHeight+"px; left:"+params.offset.left+"px; top:"+params.offset.top+"px; position: absolute; z-index: "+params.zIndex+" \">"
		+"<a style=\"border-left:1px solid #999; cursor:default; float: right; width:18px; height: 100%; text-align: center; line-height: "
		+params.lineHeight+"px;\">＋</a><span style=\"float:left; line-height:"+params.lineHeight+"px; height:"+params.lineHeight+"px; width:"
		+(params.width-2-18-1)+"px; overflow:hidden; padding-left:2px; \" ></span></div>");
	params.bodyDOM.append("<div id=\"select_content_"+params.key+"\" style=\"display:none; background:#FFF; border: 1px solid #999; border-top:0px; width:"
		+params.width+"px; max-height:"+(params.lineHeight*params.size)+"px; left:"+params.offset.left+"px; top:"
		+(params.offset.top+params.lineHeight+2)+"px; overflow: hidden; position: absolute; z-index: "+params.zIndex+" \"></div>");
	params.headDOM = $("#select_head_"+params.key);
	params.contentDOM = $("#select_content_"+params.key);
	params.listWidth = params.width;
	if(showList.length>params.size){
		params.listWidth = params.listWidth-18-1;
		var scrollHeight = params.size*params.lineHeight*params.size/showList.length;
		params.contentDOM.append("<div style=\"border-left:1px solid #999; background:#D3D3D3; float: right; width:18px; height: "+params.size*params.lineHeight+"px; \">"
		+"<span class=\"scroll\" style=\"border-top:1px solid #999; background:#F5F5F5; float:right; border-bottom:1px solid #999; margin-top:-1px; width:100%; height: "
		+scrollHeight+"px; \" ></span></div>");
	}
	params.data = {};
	var listLi="";
	for(var i=0; i<showList.length; i++){
		listLi+="<li id=\"value_"+valList[i]+"\" title=\""+showList[i]+"\" style=\"cursor:pointer; float:left; line-height:"+params.lineHeight+"px; height:"+params.lineHeight+"px; width:"+params.listWidth+"px; overflow:hidden; padding-left:2px;\">"+showList[i]+"</li>";
		params.data[valList[i]] = showList[i];
	}
	if(params.data[defaultVal]!=null) {
		target.val(defaultVal).change();
		params.headDOM.find("span").html(params.data[defaultVal]);
	} else {
		target.val(valList[0]).change();
		params.headDOM.find("span").html(showList[0]);
	}
	params.contentDOM.append("<ul style=\"float:left; width:"+params.listWidth+"px; overflow:hidden;\" >"+listLi+"</ul>");
	params.headDOM.find("a").click(function(){
		var self = $(this);
		self.data("key", params.key);
		params.contentDOM.slideToggle("fast", function(){
			if($(this).is(":hidden")){
				self.html("＋");
			} else {
				self.html("－");
				params.topDOM.one("click", function(e){
					if(self.html()=="－" && $(e.srcElement).data("key")!=self.data("key"))
						self.triggerHandler("click");
				});
			}
		});
	});
	params.contentDOM.find("ul").mousedown(function(){
		params.showMouseBg(true);
		params.topDOM.one("mouseup", function(){
			params.showMouseBg(false);
		});
	}).delegate("li", "click", function(){
		var self = $(this);
		params.headDOM.find("span").html(self.html());
		params.headDOM.find("a").triggerHandler("click");
		target.val(self.attr("id").substring(6)).change();
	}).delegate("li", "mouseover", function(){
		$(this).css("background", "#D3D3D3");
	}).delegate("li", "mouseout", function(){
		$(this).css("background", "#FFF");
	});
	if(params.contentDOM.find("span").size()){
		var scrollDOM = params.contentDOM.find("span");
		var listDOM = params.contentDOM.find("ul");
		scrollDOM.mousedown(function(e){
			params.showMouseBg(true);
			e.preventDefault();
			var startY = e.pageY;
			var startM = scrollDOM.css("margin-top");
			startM = parseInt(startM.substring(0, (startM.length-2)), 10);
			var maxMar = params.size*params.lineHeight - scrollDOM.height();
			params.topDOM.one("mouseup", function(){
				params.showMouseBg(false);
				params.topDOM.unbind("mousemove");
			});
			params.topDOM.bind("mousemove", function(e){
				var marginVal = e.pageY-startY+startM;
				if(marginVal>maxMar) {
					scrollDOM.css("margin-top", maxMar+"px");
					listDOM.css("margin-top", "-"+((showList.length-params.size)*params.lineHeight)+"px");
				} else if(marginVal<0) {
					scrollDOM.css("margin-top", "-1px");
					listDOM.css("margin-top", "-"+0+"px");
				} else {
					scrollDOM.css("margin-top", marginVal+"px");
					var moveVal = (showList.length-params.size)*params.lineHeight * marginVal/maxMar;
					listDOM.css("margin-top", "-"+moveVal+"px");
				}
			});
		});
		params.contentDOM.mousewheel(function(event, delta) {
			var startM = scrollDOM.css("margin-top");
			startM = parseInt(startM.substring(0, (startM.length-2)), 10);
			var maxMar = params.size*params.lineHeight - scrollDOM.height();
			delta = delta<0?params.lineHeight:(-1*params.lineHeight);
			var marginVal = delta*showList.length/params.size/2+startM;
			if(marginVal>maxMar) {
				scrollDOM.css("margin-top", maxMar+"px");
				listDOM.css("margin-top", "-"+((showList.length-params.size)*params.lineHeight)+"px");
			} else if(marginVal<0) {
				scrollDOM.css("margin-top", "-1px");
				listDOM.css("margin-top", "-"+0+"px");
			} else {
				scrollDOM.css("margin-top", marginVal+"px");
				var moveVal = (showList.length-params.size)*params.lineHeight * marginVal/maxMar;
				listDOM.css("margin-top", "-"+moveVal+"px");
			}
			return false; // prevent default
		});
	}
};
$.fn.select_close = function(){
	var key = $(this).data("key");
	$("#select_head_"+key).remove();
	$("#select_content_"+key).remove();
	$(this).removeData('key');
};
$.fn.select_move = function(){
	var offset = $(this).offset();
	var key = $(this).data("key");
	var headDOM = $("#select_head_"+key);
	headDOM.css({"left": offset.left+"px", "top": offset.top+"px"});
	$("#select_content_"+key).css({"left": offset.left+"px", "top": (offset.top+headDOM.height()+2)+"px"});
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
            	PageHtml += "<a class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
        	} else {
            	PageHtml += "<a onclick=\"" + funName+"("+i+");\">" + i + "</a>";
        	}
        }
    } else {
    	if(CurrentPageNum<=4){
    		for (var i = 1; i < 9; i++) {
            	if(i==CurrentPageNum) {
	            	PageHtml += "<a class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
            }
            PageHtml += "<a onclick=\"" + funName+"("+(CurrentPageNum+10>TotalPageNum?TotalPageNum:CurrentPageNum+10)+");\">...</a>";
    		PageHtml += "<a onclick=\"" + funName+"("+TotalPageNum+");\">&raquo;"+TotalPageNum+"</a>";
    	} else if(TotalPageNum-CurrentPageNum<=7) {
    		PageHtml += "<a onclick=\"" + funName+"(1);\">1&laquo;</a>";
    		PageHtml += "<a onclick=\"" + funName+"("+(CurrentPageNum-10<1?1:CurrentPageNum-10)+");\">...</a>";
    		for (var i = (TotalPageNum-8); i <= TotalPageNum; i++) {
            	if(i==CurrentPageNum) {
	            	PageHtml += "<a class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
            }
    	} else {
    		PageHtml += "<a onclick=\"" + funName+"(1);\">1&laquo;</a>";
    		PageHtml += "<a onclick=\"" + funName+"("+(CurrentPageNum-10<1?1:CurrentPageNum-10)+");\">...</a>";
    		for(var i=CurrentPageNum-2; i<=CurrentPageNum+5; i++){
    			if(i==CurrentPageNum) {
	            	PageHtml += "<a class=\"active\" onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	} else {
	            	PageHtml += "<a onclick=\"" + funName+"("+i+");\">" + i + "</a>";
	        	}
    		}
    		PageHtml += "<a onclick=\"" + funName+"("+(CurrentPageNum+10>TotalPageNum?TotalPageNum:CurrentPageNum+10)+");\">...</a>";
    		PageHtml += "<a onclick=\"" + funName+"("+TotalPageNum+");\">&raquo;"+TotalPageNum+"</a>";
    	}
    }
    $(this).html(PageHtml);
};

$.fn.showYear = function(date){
	var html = "";
	for(var i=2010; i<date.getFullYear(); i++) {
		html+="<option value=\""+i+"\">"+i+"</option>";
	}
	html+="<option value="+date.getFullYear()+" selected=\"selected\">"+date.getFullYear()+"</option>";
	$(this).html(html);
};
$.fn.showMonth = function(date){
	var html = "";
	for(var i=0; i<ARRAY_MONTH.length; i++) {
		html+="<option value=\""+ARRAY_MONTH[i]+"\">"+ARRAY_MONTH[i]+"</option>";
	}
	$(this).html(html).val(date.getMonth()+1);
};

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







