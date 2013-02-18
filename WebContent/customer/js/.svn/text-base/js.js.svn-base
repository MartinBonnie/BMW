function form_submit(){
	document.getElementById("login").submit();
}
function form_reset(){
	document.getElementById("login").reset();
}
function reloadcode(){
    var verify=document.getElementById('safecode');
    verify.setAttribute('src','code.php?'+Math.random());
}
function gotoPa(p){
	$("#page").val(p);
	$("#pageForm").submit();
}
function gotoP(){
	$("#pageForm").submit();
}
jQuery().ready(function(){
	$("#reset").click(function(){
		$("input[type=text]").val("");
		$("select").val(-1);
	});
	$("#checkAll").click(function(){
		if($("#checkAll").attr("checked")){
			$("input[type=checkbox]").each(function() {
				$(this).attr("checked", true);
				}); 

		}else{
			$("input[type=checkbox]").each(function() {
				$(this).attr("checked", false);
				}); 
		}
	});
	$("#nav li a").click(function(){
		$("#nav li").removeClass("current");
		$(this).parent().addClass("current");
	});
	$(".sideC li:odd").addClass("odd");
	$(".table tr:even").addClass("odd");
	$(".table tr th:last").addClass("last");
});

function refreshCode(id) {
	id=id||"verifyPic";
	document.getElementById(id).src = document
			.getElementById(id).src
			+ "?" + Math.random();
}


function arrayToJson(o) {
	var r = [];
	if (typeof o == "string")
		return "\""
				+ o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n")
						.replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + arrayToJson(o[i]));
			if (!!document.all
					&& !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/
							.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++) {
				r.push(arrayToJson(o[i]));
			}
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
}
function isChinese(str)
{
   var lst = /[u00-uFF]/;      
   return !lst.test(str);     
}
function strlen(str)
{
   var strlength=0;
   for (i=0;i<str.length;i++)
  {
     if (isChinese(str.charAt(i))==true)
        strlength=strlength + 1;
     else
        strlength=strlength/2 + 1;
  }
return strlength;
}