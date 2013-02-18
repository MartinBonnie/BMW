$(document).ready(function(){
	bindElement();
	$("#regForm").submit(function(){
		return checkElement();
	});
});

function checkElement(){
	return checkUserName() && checkPasswd() && checkPasswd2() && checkValcode();
};

function checkUserName(){
	if ($("#username").val() == '') {
		siteState($("#username").attr("id"), "用户名不能为空!", "true false");
		return false;
	} 
	siteState("username", "", "true");
	return true;
}

function checkPasswd(){
	if ($("#newpassword").val().length < 6) {
		siteState($("#newpassword").attr("id"), "长度应该在6-14位之间！", "true false");
		return false;
	} 
	siteState("newpassword", "", "true");
	return true;
	
}

function checkPasswd2() {
	if ($("#newpassword2").val() == '') {
		siteState($("#newpassword2").attr("id"), "密码不能为空!", "true false");
		return false;
	} 
	if ($("#newpassword2").val() != $("#newpassword").val()) {
		siteState($("#newpassword2").attr("id"), "两次输入不一样！", "true false");
		return false;
	} else {
		siteState($("#newpassword2").attr("id"), "", "true");
		return true;
	}
}

function bindElement() {
	$("#username").bind(
			{
				focus : function() {
				input($(this).attr("id"),
					"请输入您的用户名", "true false");
				},
				blur : function(){
					if(checkUserName()){
						siteState("username", "验证中", "onLoad");
						$.getJSON(contextPath+"/user/userValidate?randomNumber="
								+ Math.random(), {
							username : $("#username").val()
						}, function(result) {
							if (result.affectRows != -1) {
								siteState("username", "用户名不存在", "true false");
								return false;
							} else {
								siteState("username", "", "true");
								return true;
							}
						});		
					}
				}
			});
	$("#newpassword").bind(
			{
				focus : function() {
				input($(this).attr("id"),
							"长度6-14位，区分大小写，建议数字、字母、下划线混合！", "true false");
				},
				blur : function(){
					checkPasswd();
				}
			});
	$("#newpassword2").bind( {
		focus : function() {
		input($(this).attr("id"), "再输入一次！", "true false");
		},
		blur : function(){
			checkPasswd2();
		}
	});
	
	$("#valcode").bind( {
			focus : function() {
		input($(this).attr("id"), "请输入图片中的数字！", "true false");
			},
			blur : function(){checkValcode();}
		});
}

function checkValcode() {
	if ($("#valcode").val() == '') {
		siteState($("#valcode").attr("id"), "输入不能为空！", "true false");
		return false;
	}
	siteState($("#valcode").attr("id"), "填写正确", "true");
	return true;
}

function input(obj, text, type) {
	$("#" + obj + "Tip").attr("class", type);
	$("#" + obj + "Tip").html(text);
}

function siteState(obj, text, type) {
	$("#" + obj + "Tip").attr("class", type);
	$("#" + obj + "Tip").html("<i></i>"+text);
}
function validateEmail(email) {
	var patrn = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,4}))$/;
	if (!patrn.exec(email)) {
		return 1;
	} else {
		return 2;
	}
}
function isChn(str){
    var reg = /[^\u4e00-\u9fa5]/;
    if(!reg.test(str)){
     return false;
    }
    return true;
}
function isFh(str){
	var reg = /^[a-zA-Z0-9]+$/;
    if(!reg.test(str)){
     return false;
    }
    return true;
}
