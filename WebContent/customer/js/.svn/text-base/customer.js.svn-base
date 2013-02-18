$(function(){
	$("#nav li a").click(function(){
		$("#nav li").removeClass("current");
		$(this).parent().addClass("current")
	})
	$(".sideC li:odd").addClass("odd");
	$(".table tr:even").addClass("odd");
	$(".table tr th:last").addClass("last");
	
});

/**
 * 
 */
var contextPath = function() {   
    var root = window.location.href;   
  
    root = root.replace("http://","").replace("https://","").replace("//","/");   
  
    var first = root.indexOf("/");   
    root = root.substr(first, root.indexOf("/",first+1) - first);   
       
    return "";   
}(); 

/**
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
	var MatchMax =0;
	var NowMatchCon = "";
	var NowClickObj;
	var ulId = inputId+"_matchUL";
	var position = $("#"+inputId+"").position();
	var top = position.top+$("#"+inputId+"").outerHeight();
	var left = position.left;
	var width = $("#"+inputId+"").outerWidth()-2;
	$("body").append("<ul id=\""+ulId+"\" class=\"matchUL\">");
	$("#"+ulId+"").css({"top": top+"px", "left":left+"px", "width":width+"px"});
    if (inputValueId==null || $.trim(inputValueId) == "") 
        isSetValue = false;
    $("#" + inputId + "").attr("autocomplete", "off");
	$("#"+inputId+"").blur(function(){
		$("#"+ulId+"").hide();
	});
    $("#" + inputId + "").keyup(function(e){
        if (e.keyCode == 40) {
            if (MatchIndex == MatchMax) {
                MatchIndex = 0;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
				if(isSetValue)
					$("#"+inputValueId+"").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
            }
            else 
                if (MatchIndex == (MatchMax - 1)) {
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                    MatchIndex++;
                    $("#" + inputId + "").val(NowMatchCon);
					if(isSetValue)
						$("#"+inputValueId+"").val("");
                }
                else {
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                    MatchIndex++;
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                    $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
					if(isSetValue)
						$("#"+inputValueId+"").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
                }
        }
        else if (e.keyCode == 38) {
            if (MatchIndex == MatchMax) {
                MatchIndex--;
                $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
				if(isSetValue)
					$("#"+inputValueId+"").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
            }
            else 
                if (MatchIndex == 0) {
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                    MatchIndex = MatchMax;
                    $("#" + inputId + "").val(NowMatchCon);
					if(isSetValue)
						$("#"+inputValueId+"").val("");
                }
                else {
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").removeClass("on");
                    MatchIndex--;
                    $("#" + ulId + " > li:eq(" + MatchIndex + ")").addClass("on");
                    $("#" + inputId + "").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").text());
					if(isSetValue)
						$("#"+inputValueId+"").val($("#" + ulId + " > li:eq(" + MatchIndex + ")").attr("id"));
                }
        }
        else if (e.keyCode == 13) {
            $("#" + ulId + "").hide();
        }
		else {
			NowMatchCon = $.trim($("#"+inputId+"").val());
			if(NowMatchCon==""){
				$("#"+ulId+"").empty().hide();
			}
			else {
				var DataList = eval(matchFun+ '()');
				MatchMax = DataList.length;
				MatchIndex = MatchMax;
				if(DataList.length==0){
					$("#"+ulId+"").empty().hide();
					return;
				}
				var html="";
				for(var i=0; i<DataList.length; i++){
					var obj = DataList[i];
					html +="<li id=\""+obj[0]+"\">"+obj[1]+"</li>";
				}
				$("#"+ulId+"").html(html).show();
				
				$("#"+ulId+" > li").mousedown(function(){
					$("#"+inputId).val($("#"+ulId+" > li.on").text());
					if(isSetValue)
						$("#"+inputValueId).val($("#"+ulId+" > li.on").attr("id"));
					$("#"+ulId+"").hide();
				});
			    $("#"+ulId+" > li").hover(function(){
					$("#"+ulId+" > li").removeClass("on");
			        $(this).addClass("on");
			    }, function(){
					MatchIndex = MatchMax;
			    });
			}
		}
    });
}
$.request = function(paras){
    var url = window.location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {};
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof(returnValue) == "undefined") {
        return "";
    }
    else {
        return returnValue;
    }
}

$.showAddBg = function(op, zIndex){
    if (op) {
        $("body").append("<div id=\"bgShadeDiv\" style=\"background:#000; position:absolute; filter:alpha(opacity=10);opacity:0.1; left:0; top:0; z-index:99\"></div>");
        $("#bgShadeDiv").css({
            "height": $(document).height() + "px",
            "width": $(document).width() + "px"
        });
        if (zIndex != null) {
            $("#bgShadeDiv").css("zIndex", zIndex);
        }
    }
    else {
        $("#bgShadeDiv").remove();
    }
};

$.showUploadRate = function(parentDiv){
	var html="<div id=\""+parentDiv+"_rate\" style=\"border:1px solid #ccc; float:left; height:20px; width:200px\">"
		+"<div id=\""+parentDiv+"_bg\" style=\"background:#6495ED; float:left; height:100%; width:0%\">"
		+"<span id=\""+parentDiv+"_val\" style=\"float:right; margin-right:-200px; line-height:20px;\">0%</span></div></div>";
	$("#"+parentDiv).html(html);
	$.startUpload(parentDiv, 10, 0);
}

$.startUpload = function(parentDiv, speed, rate){
	var timerID = setInterval(function(){
		if(rate==50){
			clearInterval(timerID);
			$.startUpload(parentDiv, 50, 51);
		}
		else if(rate==98){
			clearInterval(timerID);
		}
		$("#"+parentDiv+"_bg").css("width", rate+"%");
		$("#"+parentDiv+"_val").css("margin-right", (rate*2-200)+"px").text(rate+"%");
		rate++;
	}, speed);
}
$.endUpload = function(parentDiv){
	$("#"+parentDiv+"_bg").css("width", "100%");
	$("#"+parentDiv+"_val").css("margin-right", "0px").text("100%");
}
$.removeUpload = function(parentDiv){
	$("#"+parentDiv+"_rate").remove();
}

/**
 * 验证是否为空
 */
String.prototype.isEmpty = function() {
    return (this==null || this=="");
}
/**
 * 验证数字
 */
String.prototype.isNum = function() {
    var match = this.match(new RegExp(/^[0-9]+$/gi));
    return match != null;
}
/**
*匹配中文
*/
String.prototype.isChinese = function(minLength, maxLength) {
    var patrn = new RegExp("/^[\u4e00-\u9fa5]{" + minLength + "," + maxLength + "}$/");
    return patrn.test(this);
}
/**
*获取中文长度,一个中文相当于两个英文
*/
String.prototype.CHNLength = function() {
    return this.replace(/[^\x00-\xFF]/g, '**').length;
}
/**
 * 去除字符串两端空格
 */
String.prototype.trim = function() { return this.replace(/^\s*/, "").replace(/\s*$/, ""); }
/**
将字符串中的空格去掉
**/
String.prototype.deleteSpace = function() {
    return this.replace(/\s/g, "");
}

