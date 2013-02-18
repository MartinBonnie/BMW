$(document).ready(function() {
	addPic();
	selectAlbum();
});

function addPic() {
	var pics = $(".pics li");
	var files = document.getElementsByName("upload");
	var imgs = $(".pics img");
	var i = 0;
	for (i = 0; i < pics.length; i++) {
		var img = imgs[i];
		files[i].onchange = function() {
			var img = this.parentNode.parentNode.firstChild.firstChild;
			if(img.innerHTML!=""){
				var parent = img.parentNode;
				parent.removeChild(img);
				img = document.createElement("img");
				parent.appendChild(img);
				changeFile(this, img);
			} else {				
				changeFile(this, img);
			}
		};
	}
}

function changeFile(obj, img){
	img.setAttribute("src", getFullPath(obj));
}

function getFullPath(obj) {
	if (obj) {
		// ie
		if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
			obj.select();
			return document.selection.createRange().text;
		}
		// firefox
		else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
			if (obj.files) {
				return window.URL.createObjectURL(obj.files[0]);
			}
			return obj.value;
		}
		return obj.value;
	}
}

function selectAlbum(){	
	$("#albumSelect").change(function(){
			if($(this).text()!="请选择相册"){
				var albumId = $(this).val();
				$.ajax({   
					type: "post",   
					dataType: "json",   
					url: contextPath + "/customer/album/listAjaxPhotoAlbum",   
					data: {"albumId":albumId, "pageSize": 12, "page": 1},   
					success: function(result){
						display(result);
						prepage();
						selectPicOrNot();
						nextpage();
					} 
				});
			}
	});
}

function selectPicOrNot(){
	var displayUl = $("#displayPic li");
	displayUl.each(
		function(){
			$(this).bind("click", function(){
				var dateLength = $("#dataList li");
				var img = $(this).find("img");
				var check = checkSelectPic($(this));
				if(dateLength != null && dateLength.length > 5 && !check){
					alert("只能选择小于等于6张图片!");
					return;
				}
				img.attr("check", !check);
				var index = parseInt(img.attr("index"));
				var dataList = $("#dataList");
				var src = img.attr("src");
				if(!check){
					img.css("border","3px solid #f00");
					var insertHtml ="<li class='data_list_" + index + "'><img src = " + src + " />";
					insertHtml += "<input type='hidden' value='"+src+"' name='img' /><div class='delPic'></div></li>";
					if(dateLength == null || dateLength.length == 0){
						dataList.html(insertHtml);
					} else {
						$(insertHtml).insertAfter($("#dataList li:last-child"));
					}
				} else {
					img.css("border","3px solid #e1e1e1");
					var dataNode = $(".data_list_"+index);
					dataNode.remove();
				}
			});
		}
	);
};

function checkSelectPic(node){
	var check = node.find("img").attr("check") == "true";
	return check;
}

var display = function(result){
	result = eval('(' +result+ ')');
	var displayUl = $("#picarea");
	if(result==null || result.length == 0){
		displayUl.attr("class","area clearfix nopic");
		displayUl.html("该相册没有相片");
		var page = $("#page");
		page.html("");
		return;
	}
	displayUl.attr("class","area clearfix");
	var length = result.length;
	if(length==0){
		return;
	}
	var html = "<ul id='displayPic'>";
	for(var i=0; i<length; i++){
		html += "<li><img src=\"" + result[i] + "\" index = " + i + " check=false /></li>";
	}
	displayUl.html(html);
	html = "";
	html += "<input id='prepage' type='button' value='上一页'/>";
	html += "<input id='nextpage' type='button' value='下一页'/>";
	var total = parseInt((length + 11) / 12);
	html += "<span id='pagenum'> 1/" + total + "</span>";
	var page = $("#page");
	page.html(html);
};

function prepage(){
	$("#prepage").bind("click", function(){
		var pagenumStr = $("#pagenum").text();
		var pageArray = pagenumStr.split("/");
		if(parseInt(pageArray[0]) <= 1){
			return;
		}
		var pre = parseInt(pageArray[0]) - 1;
		var text = " " + pre +"/" + pageArray[1];
		$("#pagenum").html(text);
		jumpToPage(pre);
	});
}

function nextpage(){
	$("#nextpage").bind("click", function(){
		var pagenumStr = $("#pagenum").text();
		var pageArray = pagenumStr.split("/");
		if(parseInt(pageArray[0]) >= parseInt(pageArray[1])){
			return;
		}
		var next = parseInt(pageArray[0]) + 1;
		var text = " " + next +"/" + pageArray[1];
		$("#pagenum").html(text);
		jumpToPage(next);
	});
}

function jumpToPage(page){
	var px = -(page-1)*198 + 1 + "px";
	$("#displayPic").css("top",px);
}

function getCssInt(length){
	var index = length.indexOf("p");
	return length.substring(0,index);
}

var contextPath = function() {   
    var root = window.location.href;   
    root = root.replace("http://","").replace("https://","").replace("//","/");   
    var first = root.indexOf("/");   
    root = root.substr(first, root.indexOf("/",first+1) - first);       
    return "";   
}(); 

var sliptPage = function(){
	
};