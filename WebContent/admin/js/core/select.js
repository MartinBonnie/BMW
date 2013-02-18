(function($) {

var types = ['DOMMouseScroll', 'mousewheel'];

if ($.event.fixHooks) {
    for ( var i=types.length; i; ) {
        $.event.fixHooks[ types[--i] ] = $.event.mouseHooks;
    }
}

$.event.special.mousewheel = {
    setup: function() {
        if ( this.addEventListener ) {
            for ( var i=types.length; i; ) {
                this.addEventListener( types[--i], handler, false );
            }
        } else {
            this.onmousewheel = handler;
        }
    },
    
    teardown: function() {
        if ( this.removeEventListener ) {
            for ( var i=types.length; i; ) {
                this.removeEventListener( types[--i], handler, false );
            }
        } else {
            this.onmousewheel = null;
        }
    }
};

$.fn.extend({
    mousewheel: function(fn) {
        return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
    },
    
    unmousewheel: function(fn) {
        return this.unbind("mousewheel", fn);
    }
});


function handler(event) {
    var orgEvent = event || window.event, args = [].slice.call( arguments, 1 ), delta = 0, returnValue = true, deltaX = 0, deltaY = 0;
    event = $.event.fix(orgEvent);
    event.type = "mousewheel";
    
    // Old school scrollwheel delta
    if ( orgEvent.wheelDelta ) { delta = orgEvent.wheelDelta/120; }
    if ( orgEvent.detail     ) { delta = -orgEvent.detail/3; }
    
    // New school multidimensional scroll (touchpads) deltas
    deltaY = delta;
    
    // Gecko
    if ( orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS ) {
        deltaY = 0;
        deltaX = -1*delta;
    }
    
    // Webkit
    if ( orgEvent.wheelDeltaY !== undefined ) { deltaY = orgEvent.wheelDeltaY/120; }
    if ( orgEvent.wheelDeltaX !== undefined ) { deltaX = -1*orgEvent.wheelDeltaX/120; }
    
    // Add event and delta to the front of the arguments
    args.unshift(event, delta, deltaX, deltaY);
    
    return ($.event.dispatch || $.event.handle).apply(this, args);
}
})(jQuery);

/**
 * 创建下拉菜单框
 * options: json类型，参数值，可传{}
 * defaultVal: 缺省显示内容
 * showList: 选项的显示内容
 * valList: 选项的值，点击后自动赋值到input寄主
 * changeFun: 数值改变后触发的方法
 * desc:根据defaultVal参数将自动匹配候选项，如果匹配不到则默认为候选项第一个，然后自动触发onchange事件
 */
$.fn.select = function(options, defaultVal, showList, valList, changeFun){
	var target = $(this);
	var params = $.extend({
		width: target.width(), //width of select - defaults to table height
		size: 10, //height of select - defaults to table height
		lineHeight: target.height(),
		zIndex: 9999
	}, options);
	params.offset = target.offset();
	target.hide();
	params.topDOM = $(document);
	params.bodyDOM = $("body");
	if($("#SELECT_PLUGIN_BG").length==0){
		params.bodyDOM.append("<div id=\"SELECT_PLUGIN_BG\" style=\"background:#000; cursor:default; display:none; position:absolute; filter:alpha(opacity=0);opacity:0; height:"
			+params.topDOM.height()+"px; width:"+params.topDOM.width()+"px; left:0; top:0; z-index:"+(params.zIndex+1)+"\" ></div>");
	}
	params.mouseBg = $("#SELECT_PLUGIN_BG");
    params.showMouseBg = function(op){
        if (op) {
        	params.mouseBg.css({"height": params.topDOM.height()+"px", "width": params.topDOM.width()+"px"}).show();
        } else {
            params.mouseBg.hide();
        }
    };
	if(target.data("key")){
		$("#SELECT_HEAD_"+target.data("key")).remove();
		$("#SELECT_CONTENT_"+target.data("key")).remove();
	} 
	target.data("key", Math.uuid());
	params.key = target.data("key");
	params.bodyDOM.append("<div id=\"SELECT_HEAD_"+params.key+"\" style=\"border:1px solid #999; width:"
		+params.width+"px; height:"+params.lineHeight+"px; left:"+params.offset.left+"px; top:"+params.offset.top+"px; position: absolute; z-index: "+params.zIndex+" \">"
		+"<a style=\"border-left:1px solid #999; cursor:default; float: right; width:18px; height: 100%; text-align: center; line-height: "
		+params.lineHeight+"px;\">＋</a><span style=\"float:left; line-height:"+params.lineHeight+"px; height:"+params.lineHeight+"px; width:"
		+(params.width-2-18-1)+"px; overflow:hidden; padding-left:2px; \" ></span></div>");
	params.bodyDOM.append("<div id=\"SELECT_CONTENT_"+params.key+"\" style=\"display:none; background:#FFF; border: 1px solid #999; border-top:0px; width:"
		+params.width+"px; max-height:"+(params.lineHeight*params.size)+"px; left:"+params.offset.left+"px; top:"
		+(params.offset.top+params.lineHeight+2)+"px; overflow: hidden; position: absolute; z-index: "+(params.zIndex+2)+" \"></div>");
	params.headDOM = $("#SELECT_HEAD_"+params.key);
	params.contentDOM = $("#SELECT_CONTENT_"+params.key);
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
		target.val(defaultVal);
		params.headDOM.find("span").html(params.data[defaultVal]);
	} else {
		target.val(valList[0]);
		params.headDOM.find("span").html(showList[0]);
	}
	params.contentDOM.append("<ul style=\"float:left; width:"+params.listWidth+"px; overflow:hidden;\" >"+listLi+"</ul>");
	params.headDOM.find("a").click(function(){
		var self = $(this);
		params.contentDOM.slideToggle("fast", function(){
			if($(this).is(":hidden")){
				self.html("＋");
				params.topDOM.unbind("click");
			} else {
				self.html("－");
				params.topDOM.click(function(e){
					if(!(self.html()=="＋" || $.contains(params.headDOM[0], e.srcElement) || $.contains(params.contentDOM[0], e.srcElement))) {
						params.topDOM.unbind("click");
						self.html("＋");
						params.contentDOM.slideUp("fast");
					} 
				});
			}
		});
	});
	params.contentDOM.find("ul").delegate("li", "mousedown", function(){
		var self = $(this);
		params.headDOM.find("span").html(self.html());
		params.headDOM.find("a").triggerHandler("click");
		target.val(self.attr("id").substring(6));
		if($.isFunction(changeFun)) {
			changeFun();
		}
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
	$("#SELECT_HEAD_"+key).remove();
	$("#SELECT_CONTENT_"+key).remove();
	$(this).removeData('key');
};
$.fn.select_move = function(){
	var offset = $(this).offset();
	var key = $(this).data("key");
	var headDOM = $("#SELECT_HEAD_"+key);
	headDOM.css({"left": offset.left+"px", "top": offset.top+"px"});
	$("#SELECT_CONTENT_"+key).css({"left": offset.left+"px", "top": (offset.top+headDOM.height()+2)+"px"});
};


$.fn.selectArea = function(options, defaultVal, showList, valueList){
	var target = $(this);
	var params = $.extend({
		width: 450, 	//width of the area
		maxHeight: 220,	//height of the area
		zIndex: 999,	
		isSingle: true, 	//single or multiple
		changeFun: null, 	//the function of the value changed
		confirmFun: null	//the function of the confirm button on the scene of multiple
	}, options);
	params.bodyDOM = $("body");
	if($("#TOOLKIT_SELECT_AREA").length==0){
		params.bodyDOM.append("<div id=\"TOOLKIT_SELECT_AREA\" style=\"display:none; background: #FFFFFF; border:1px solid #999; padding:5px; position: absolute;"
		+"width:"+params.width+"px; z-index: "+params.zIndex+"\" ></div>");
	} 
	params.offset = target.offset();
	params.areaDOM = $("#TOOLKIT_SELECT_AREA");
	params.areaDOM.css({
		left: params.offset.left+"px",
		top: (params.offset.top+target.outerHeight(true)+1)+"px"
	}).empty();
	params.headerHTML = "";
	if(!params.isSingle) {
		params.headerHTML += '<span style="float:right;">'
		+'<input type="button" class="btn clear" style="margin-right:10px;" title="清除" />'
		+'<input type="button" class="btn scancel" style="margin-right:4px;" title="取消" />'
		+'<input type="button" class="btn sconfirm" title="确定" /></span>';
	} else {
		params.headerHTML += '<span style="float:right;">'
		+'<input type="button" class="btn clear" style="margin-right:4px;" title="清除" />'
		+'<input type="button" class="btn scancel" title="取消" /></span>';
	}
	params.headerHTML += '<span style="float:left"><label>检索:</label><input id="TOOLKIT_SELECT_IPT" type="text" class="text small" /></span>';
	params.headerHTML = '<div style="border-bottom: 2px solid #0078CC; clear:both; float:left; padding-bottom:4px; width:100%; ">'+params.headerHTML+'</div>';
	params.areaDOM.append(params.headerHTML);
	params.searchDOM = $("#TOOLKIT_SELECT_IPT");
	params.contentHTML = "";
	var temp = defaultVal==null?new Array():defaultVal.toString().split(",");
	params.defaultValMap = {};
	for(var i=0; i<temp.length; i++) {
		params.defaultValMap[temp[i]] = 1;
	}
	if(showList.length==0) {
		params.contentHTML = '<div style="float:left; padding-top:4px; text-align:center; width:100%;"><a class="url">暂无数据！</a></div>';
		params.areaDOM.append(params.contentHTML);
	} else {
		for(var i=0; i<showList.length; i++) {
			var className = "button";
			if(params.defaultValMap[valueList[i]]==1) {
				className = "button on";
			}
			params.contentHTML+='<li style="margin:4px 4px 0 0; float:left;">'
				+'<a class="'+className+'">'+showList[i]+'</a><input type="hidden" value="'+valueList[i]+'" /></li>';
		}
		params.contentHTML = '<ul id="TOOLKIT_SELECT_UL" style="width:100%; float:left; max-height:'+params.maxHeight+'px; overflow:auto;" >'+params.contentHTML+'</ul>';
		params.areaDOM.append(params.contentHTML);
		params.contentDOM = $("#TOOLKIT_SELECT_UL");
	}
	params.areaDOM.slideDown("fast").undelegate("click");
	
	params.searchDOM.keyup(function(){
		var searchKey = $(this).val();
		var liList = params.contentDOM.find("li");
		for(var i=0; i<showList.length; i++) {
			if(showList[i].indexOf(searchKey)<0) {
				liList.eq(i).hide();
			} else {
				liList.eq(i).show();
			}
		}
	});
	if(params.isSingle) {
		params.areaDOM.delegate("li", "click", function(){
			var temp = target.data("value");
			params.areaDOM.slideUp("fast");
			target.val($(this).find("a").html());
			target.data("value", $(this).find("input").val());
			if(temp!=target.data("value") && $.isFunction(params.changeFun)) {
				params.changeFun();
			}
		});
		params.areaDOM.find("input.clear").click(function(){
			params.areaDOM.slideUp("fast");
			target.val("").removeData("value");
			if($.isFunction(params.changeFun)) {
				params.changeFun();
			}
		});
		params.areaDOM.find("input.scancel").click(function(){
			params.areaDOM.slideUp("fast");
		});
	} else {
		params.areaDOM.delegate("a", "click", function(){
			$(this).toggleClass('on');
		});
		params.areaDOM.find("input.clear").click(function(){
			params.areaDOM.slideUp("fast");
			target.empty().removeData("value");
			if($.isFunction(params.changeFun)) {
				params.changeFun();
			}
		});
		params.areaDOM.find("input.scancel").click(function(){
			params.areaDOM.slideUp("fast");
		});
		params.areaDOM.find("input.sconfirm").click(function(){
			params.areaDOM.slideUp("fast");
			var selectedShowList = new Array();
			var selectedValueList = new Array();
			params.areaDOM.find("a.on").each(function(){
				selectedShowList.push($(this).html());
				selectedValueList.push($(this).next().val());
			});
			params.confirmFun(selectedShowList, selectedValueList);
		});
	}
};

$.fn.selectArea_isClose = function(){
	if($("#TOOLKIT_SELECT_AREA").length==0 || $("#TOOLKIT_SELECT_AREA").is(":hidden")){
		return true;
	}
	return false;
};

$.fn.selectArea_close = function(){
	if($("#TOOLKIT_SELECT_AREA").length>0){
		$("#TOOLKIT_SELECT_AREA").slideUp("fast");
	}
};


















