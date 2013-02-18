/*
 *
 */
var contextPath = function(){
    var root = window.location.href;
    
    root = root.replace("http://", "").replace("https://", "").replace("//", "/");
    
    var first = root.indexOf("/");
    root = root.substr(first, root.indexOf("/", first + 1) - first);
    
    return "";
}();

/*
 * 设置匹配搜索框 ,只需一开始的时候调用一次
 * @param {Object} inputId	搜索输入框ID
 * @param {Object} inputValueId	放置已选匹配条目ID的隐藏input框ID，如果没有这个需求，则传null
 * @param {Object} matchFun		搜索候选值的ajax方法名，控件会自动获取其返回值，此ajax方法参照以下格式：
 initAdMatch = function(){
 var dataResult = new Array();
 ...
 $.ajax({
 type: "post",
 async: false,
 ...
 success: function(result) {
 ...
 dataResult=result;
 }
 });
 return dataResult;
 }
 */
$.setMatchList = function(inputId, inputValueId, matchFun){
    var isSetValue = true;
    var MatchIndex = 0;
    var MatchMax = 0;
    var NowMatchCon = "";
    // var NowClickObj;
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
$.request = function(paras){
    var url = window.location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {};
	var i,j;
    for (i = 0; i<paraString.length; i++) {
		j = paraString[i];
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof(returnValue) == "undefined") {
        return "";
    }
    else {
        return returnValue;
    }
};

$.showAddBg = function(op, zIndex){
    if (op) {
        $("body").append("<div id=\"bgShadeDiv\" style=\"background:#000; position:absolute; filter:alpha(opacity=10);opacity:0.1; left:0; top:0; z-index:99\"></div><iframe id=\"bgShadeiframe\" style=\"background:#000;position:absolute;width:100%;left:0;filter:alpha(opacity=0);opacity:0;top:0;width:100%;height:100%\"></iframe>");
        $("#bgShadeDiv").css({
            "height": $(document).height() + "px",
            "width": $(document).width() + "px"
        });
        $("#bgShadeiframe").height($(document).height());
        $("#bgShadeiframe").width($(document).height());
        if (zIndex != null) {
            $("#bgShadeDiv").css("zIndex", zIndex);
        }
    }
    else {
        $("#bgShadeDiv").remove();
        $("#bgShadeiframe").remove();
    }
};

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

$.startUpload = function(parentDiv, speed, rate){
    var timerID = setInterval(function(){
        if (rate == 50) {
            clearInterval(timerID);
            $.startUpload(parentDiv, 50, 51);
        }
        else 
            if (rate == 98) {
                clearInterval(timerID);
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

/**
 * 转换日期到字符串
 * @param {Object} date
 * @param {Object} type	1:"yyyy-MM-dd"; 2:"yyyy-MM-dd HH:mm:ss"; 3:"yyyy-MM-dd HH:oo"; 4:"yyyy-MM"
 */
formatDate = function(date, type){
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
    if (type == 1) {
        return year + "-" + month + "-" + day;
    }
    else if (type == 2) {
            return year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec;
    }
    else if (type == 3) {
            return year + "-" + month + "-" + day + " " + hour + ":00";
    }
    else if (type == 4) {
            return year + "-" + month;
    }
    else {
        return "";
    }
};

/*
 * 验证是否为空
 */
String.prototype.isEmpty = function(){
    return (this == null || this.trim() == "");
};
/*
 * 验证数字
 */
String.prototype.isNum = function(){
    var match = this.match(new RegExp(/^[0-9]+$/gi));
    return match != null;
};
/*
 * 验证带小数点的数字
 */
String.prototype.isMoney = function(){
    var match = this.match(new RegExp(/^[0-9.]+$/gi));
    return match != null;
};
/*
 *匹配中文
 */
String.prototype.isChinese = function(minLength, maxLength){
    var patrn = new RegExp("/^[\u4e00-\u9fa5]{" + minLength + "," + maxLength + "}$/");
    return patrn.test(this);
};
/*
 *获取中文长度,一个中文相当于两个英文
 */
String.prototype.CHNLength = function(){
    return this.replace(/[^\x00-\xFF]/g, '**').length;
};
/*
 * 去除字符串两端空格
 */
String.prototype.trim = function(){
	if(this==null){
		return "";
	} else {
		return this.replace(/^\s*/, "").replace(/\s*$/, "");
	}
};
/*
 将字符串中的空格去掉
 **/
String.prototype.deleteSpace = function(){
    return this.replace(/\s/g, "");
};
