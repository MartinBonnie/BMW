$(document).ready(function(){
	checkRadio();
	bindElement();
	$("#regForm").submit(function(){
		return checkElement();
	});
});

function checkElement(){
	return checkEmail()&& checkUserName() && checkPasswd() && checkPasswd2()
			&& checkEntName() && checkPhone() && checkCellphone() 
			&& checkName() && checkValcode();
};

function selectedEnt(){
	var select = $(":radio:checked").val();
	return "ent" == select;
}

function checkRadio(){
	if(selectedEnt()){
		$(".entNameLabel").show();
		$("#pri_name").hide();
	} else {
		$(".entNameLabel").hide();
		$("#pri_name").show();
	};
	$("#radio").bind( {
		click : function() {
		$(".entNameLabel").hide();
		$("#pri_name").show();
		}
	});
	$("#radio2").bind( {
		click : function() {
		$(".entNameLabel").show();
		$("#pri_name").hide();
	}
	});
}

function checkEmail(){
	if ($("#email").val() == '') {
		siteState($("#email").attr("id"), "email不能为空!", "true false");
		return false;
	} 
	if (validateEmail($("#email").val()) == 1) {
		siteState($("#email").attr("id"), "不是有效的email", "true false");
		return false;
	}
	siteState("email", "填写正确", "true");
	return true;
}

function checkUserName(){
	if ($("#username").val() == '') {
		siteState($("#username").attr("id"), "用户名不能为空!", "true false");
		return false;
	} 
	if ($("#username").val().length < 4) {
		siteState($("#username").attr("id"), "用户名不能小于4位!", "true false");
		return false;
	}
	if(!isChn($("#username").val())){
		siteState($("#username").attr("id"), "用户名不能为中文!", "true false");
		return false;
	}
	if(!isFh($("#username").val())){
		siteState($("#username").attr("id"), "用户名只能为数字跟字符!", "true false");
		return false;
	}
	if ($("#username").val().indexOf(" ") != -1
		|| $("#username").val().indexOf("_") != -1|| $("#username").val().indexOf(".") != -1) {
		siteState($("#username").attr("id"), "用户名不能包括空格、小数点或者下划线!", "true false");
		return false;
	}	
	siteState("username", "填写正确", "true");
	return true;
}

function checkPasswd(){
	if ($("#password").val().length < 6) {
		siteState($("#password").attr("id"), "长度应该在6-14位之间！", "true false");
		return false;
	} 
	siteState("password", "填写正确", "true");
	return true;
	
}

function checkPasswd2() {
	if ($("#password2").val() == '') {
		siteState($("#password2").attr("id"), "密码不能为空!", "true false");
		return false;
	} 
	if ($("#password2").val() != $("#password").val()) {
		siteState($("#password2").attr("id"), "两次输入不一样！", "true false");
		return false;
	} else {
		siteState($("#password2").attr("id"), "填写正确", "true");
		return true;
	}
}

function checkName() {
	if(selectedEnt()){
		return true;
	}
	if ($("#name").val() == '') {
		siteState($("#name").attr("id"), "输入不能为空！", "true false");
		return false;
	} 
	if ($("#name").val().length > 20) {
		siteState($("#name").attr("id"), "最多可输入20个字！", "true false");
		return false;
	}
	siteState($("#name").attr("id"), "填写正确", "true");
	return true;
}

function bindElement() {
	$("#email").bind(
	{
		focus : function() {
			input($(this).attr("id"), "请输入您的email", "true false");
		},
		blur : function() {
			if(checkEmail()){
				siteState("email", "验证中", "onLoad");
				$.getJSON(contextPath+"/user/emailValidate?randomNumber=" + Math.random(), {
					email : $("#email").val()
				}, function(result) {
					if (result.affectRows == -1) {
						siteState("email", "email已经存在", "true false");
					} else {
						siteState("email", "填写正确", "true");
						success = true;
					}
				});
			}
		}
	});

	$("#username").bind(
			{
				focus : function() {
				input($(this).attr("id"),
							"请输入您的用户名,由4-20个组成，不能有包含中文、小数点,空格,_", "true false");
				},
				blur : function(){
					if(checkUserName()){
						siteState("username", "验证中", "onLoad");
						$.getJSON(contextPath+"/user/userValidate?randomNumber="
								+ Math.random(), {
							username : $("#username").val()
						}, function(result) {
							if (result.affectRows == -1) {
								siteState("username", "用户名已经存在", "true false");
								return false;
							} else {
								siteState("username", "填写正确", "true");
								return true;
							}
						});		
					}
				}
			});
	$("#password").bind(
			{
				focus : function() {
				input($(this).attr("id"),
							"长度6-14位，区分大小写，建议数字、字母、下划线混合！", "true false");
				},
				blur : function(){
					checkPasswd();
				}
			});
	$("#password2").bind( {
		focus : function() {
		input($(this).attr("id"), "再输入一次！", "true false");
		},
		blur : function(){
			checkPasswd2();
		}
	});
	
	
	$("#name").bind( {
		focus : function() {
		input($(this).attr("id"), "请您输入您的姓名，最多可输入20个字！", "true false");
		},
		blur : function(){checkName();}
	});
	
	$("#entName").bind( {
		focus : function() {
		input($(this).attr("id"), "请您输入贵公司名称，最多可输入20个字！", "true false");
		},
		blur : function(){checkEntName();}
	});
	
	$("#phone").bind( {
		focus : function() {
		input($(this).attr("id"), "请输入数字，如0571-12345678！", "true false");
		},
		blur : function(){checkPhone();}
	});
	$("#cellphone").bind( {
		focus : function() {
		input($(this).attr("id"), "请输入数字，如13100000000！", "true false");
		},
		blur : function(){checkCellphone();}
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

function checkCellphone() {
	if ($("#cellphone").val() == '') {
		siteState($("#cellphone").attr("id"), "输入不能为空！", "true false");
	} else if ($("#cellphone").val().length != 11) {
		siteState($("#cellphone").attr("id"), "输入错误！", "true false");
	} else {
		siteState($("#cellphone").attr("id"), "填写正确", "true");
		return true;
	}
	return false;
}

function checkPhone() {
	if ($("#phone").val() == '') {
		siteState($("#phone").attr("id"), "输入不能为空！", "true false");
		return false;
	} else if ($("#phone").val().length < 7) {
		siteState($("#phone").attr("id"), "输入错误！", "true false");
		return false;
	} else {
		siteState($("#phone").attr("id"), "填写正确", "true");
		return true;
	}
}

function checkEntName() {
	if(!selectedEnt()){
		return true;
	}
	if ($("#entName").val() == '') {
		siteState($("#entName").attr("id"), "输入不能为空！", "true false");
		return false;
	} 
	if ($("#entName").val().length > 20) {
		siteState($("#entName").attr("id"), "最多可输入20个字！", "true false");
		return false;
	}
	siteState($("#entName").attr("id"), "填写正确", "true");
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
	var patrn = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
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
