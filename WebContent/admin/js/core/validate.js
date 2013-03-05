String.prototype.isMail = function(){
	return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(this);
};

String.prototype.isUrl = function(){
	return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(this);
};

String.prototype.isNum = function(){
	return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(this);
};

String.prototype.isDigit = function(){
	return /^\d+$/.test(this);
};

String.prototype.isCN = function(){
	return /^[\u4e00-\u9fa5]+$/i.test(this);
};

String.prototype.isAcc = function(){
	return /^[a-z|A-Z|0-9]+$/i.test(this);
};

String.prototype.isPhone = function(){
	return /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(this);
};

String.prototype.isCell = function(){
	return /^(?:13\d|15[036789]|18[6789])-?\d{5}(\d{3}|\*{3})$/.test(this); 
};

String.prototype.isEmpty = function(){
	return (this == null || this.length == 0);
};

String.prototype.ltLen = function(max){
	return this.trim().length <= max;
};

String.prototype.eqLen = function(len){
	return this.trim().length == len;
};

String.prototype.gtLen = function(min){
	return this.trim().length >= min;
};

String.prototype.rangeLen = function(min, max){
	return this.trim().length >= min && this.trim().length <= max;
};

Number.prototype.ltVal = function(max){
	return this <= max;
};

Number.prototype.eqVal = function(val){
	return this == val;
};

Number.prototype.gtVal = function(min){
	return this >= min;
};

Number.prototype.rangeVal = function(min, max){
	return this >= min && this <= max;
};

String.prototype.isIdCard = function() {
    var sex = 1; 
    var birthday = "";
    if (this.length == 15) {
        var Match = this.match(new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/));
        if (Match != null) {
            var D = new Date("19" + Match[3] + "/" + Match[4] + "/" + Match[5]);
            IsValid = D.getYear() == Match[3] && (D.getMonth() + 1) == Match[4] && D.getDate() == Match[5];
            if (IsValid) {
                birthday = "19" + Match[3] + "-" + Match[4] + "-" + Match[5];
                sex = (Match[6] % 2 == 1);
            }
            return birthday+"|"+sex;
        } else {
            return "";
        }
    }
    else if (this.length == 18) {
        var Match = this.match(new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d|[a-zA-Z])$/));
        if (Match != null) {
            var D = new Date(Match[3] + "/" + Match[4] + "/" + Match[5]);
            IsValid = D.getFullYear() == Match[3] && (D.getMonth() + 1) == Match[4] && D.getDate() == Match[5];
            if (IsValid) {
                if (CalculatePaperNum(this) == "X") { if (Match[7] != "x" && Match[7] != "X") { IsValid = false; } }
                else { if (Match[7] != CalculatePaperNum(this)) { IsValid = false; } }
            }
            if (IsValid) {
                birthday = Match[3] + "-" + Match[4] + "-" + Match[5];
                sex = (Match[6] % 2 == 1);
            }
            return birthday+"|"+sex;
        } else {
            return "";
        }
    } else {
        return "";
    }
};
CalculatePaperNum = function(str) {
    var PaperNumPowerArray = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
    var Sum = 0;
    for (var i = 0; i < 17; i++) {
        Sum += PaperNumPowerArray[i] * parseInt(str.substring(i, i + 1));
    }
    var Index = 12 - Sum % 11;
    if (Index > 10) { Index = Index - 11; }
    if (Index == 10) { return "X"; } else { return "" + Index; }
};

//增加一个名为 IsPicture 的函数作为
//String 构造函数的原型对象的一个方法。
String.prototype.isPicture = function() {
	//判断是否是图片 - strFilter必须是小写列举
	var strFilter = ".jpeg|.gif|.jpg|.png|.bmp|.pic|.JPEG|.GIF|.JPG|.PNG|.BMP|.PIC|";
	if(this.indexOf(".") > -1) {
		var p = this.lastIndexOf(".");
		var strPostfix = this.substring(p, this.length) + '|';
		strPostfix = strPostfix.toLowerCase();
		if(strFilter.indexOf(strPostfix) > -1) {
			return true;
		}
	}
	return false;
}; 


$.fn.checkIpt = function(type){
	var self = $(this);
	var value = self.val().trim();
	switch(type) {
		case "username":
			if(!value.rangeLen(1, 20)) {
				self.addClass("err").nextAll(".err").html("用户名的长度为1到20个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "name":
			if(!value.rangeLen(1, 20)) {
				self.addClass("err").nextAll(".err").html("姓名的长度为1到20个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "age":
			if(!value.isEmpty() && !value.isDigit()) {
				self.addClass("err").nextAll(".err").html("年龄必须为数字！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "company":
			if(!value.rangeLen(0, 64)) {
				self.addClass("err").nextAll(".err").html("公司名称最多为64个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "email":
			if(!value.isEmpty() && !value.isMail()) {
				self.addClass("err").nextAll(".err").html("请填写正确格式的Email地址！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "qq":
			if(!value.isEmpty() && !value.isDigit()) {
				self.addClass("err").nextAll(".err").html("QQ号码为纯数字格式！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "phone":
			if(!value.isEmpty() && !value.isPhone()) {
				self.addClass("err").nextAll(".err").html("固定号码格式为区号-号码(0571-12345678)！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "cellphone":
			if(!value.isCell()) {
				self.addClass("err").nextAll(".err").html("请填写正确的手机号码！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "tno":
			if(!value.rangeLen(1, 16)) {
				self.addClass("err").nextAll(".err").html("编号的长度为1到16个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "price":
			if(!value.isEmpty() && !value.isDigit()) {
				self.addClass("err").nextAll(".err").html("金额必须为整数！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "gradeName":
			if(!value.rangeLen(1, 50)) {
				self.addClass("err").nextAll(".err").html("车牌的长度为1到50个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "vmodel":
			if(!value.rangeLen(1, 16)) {
				self.addClass("err").nextAll(".err").html("型号的长度为1到16个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "tname":
			if(!value.rangeLen(1, 16)) {
				self.addClass("err").nextAll(".err").html("名称的长度为1到64个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "desname":
			if(!value.rangeLen(1, 128)) {
				self.addClass("err").nextAll(".err").html("地点的长度为1到128个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "minute":
			if(!value.isNum()) {
				self.addClass("err").nextAll(".err").html("分钟数必须为整数！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "adminname":
			if(!value.rangeLen(1, 16)) {
				self.addClass("err").nextAll(".err").html("账号名称长度为1到16个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "pwdchk":
			if(value!=$("#add_pwd0").val().trim()) {
				self.addClass("err").nextAll(".err").html("密码确认不一致 ！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "account":
			if(!value.isAcc() || !value.rangeLen(1, 32)) {
				self.addClass("err").nextAll(".err").html("登陆账号必须为字母或数字，且长度为1到32个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "factoryname":
			if(!value.rangeLen(1, 16)) {
				self.addClass("err").nextAll(".err").html("长度为1到16个字符！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
		case "duration":
			if(value.isEmpty() || !value.isDigit() || value<1) {
				self.addClass("err").nextAll(".err").html("周期必须为大于0的整数！");
			} else {
				self.removeClass("err").nextAll(".err").empty();
			}
			break;
			
			
		case "pwd":
			if(!value.isAcc() || !value.rangeLen(1, 32)) {
				self.addClass("err").next().find(".err").html("登陆密码必须为字母或数字，且长度在1和32个字符之间！").end().slideDown("fast");
			} else {
				self.removeClass("err").next().slideUp("fast").find(".err").empty();
			}
			break;
		case "address":
			if(!value.rangeLen(0, 128)) {
				self.addClass("err").next().find(".err").html("住址最多为128个字符！").end().slideDown("fast");
			} else {
				self.removeClass("err").next().slideUp("fast").find(".err").empty();
			}
			break;
		case "memo":
			if(!value.rangeLen(0, 256)) {
				self.addClass("err").next().find(".err").html("备注最多为256个字符！").end().slideDown("fast");
			} else {
				self.removeClass("err").next().slideUp("fast").find(".err").empty();
			}
			break;
		case "msg":
			if(!value.rangeLen(1, 128)) {
				self.addClass("err").nextAll("div").find(".err").html("短信内容长度为1到128个字符！").end().slideDown("fast");
			} else {
				self.removeClass("err").nextAll("div").slideUp("fast").find(".err").empty();
			}
			break;
		case "ip":
			if(value.length>15 || value.length<7){
				self.addClass("err").nextAll(".err").html("ip地址长度为7到15个字符！");
				break;
			}else{
				var patrn =/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;//正则表达式，\d为数字,{1,3}一位或为三位. 
		        if(!patrn.exec(value)){ 
		        	self.addClass("err").nextAll(".err").html("您输入的IP格式不正确，必须是000.000.000.000格式");
		        	break;
		        }
		        var laststr; 
		        laststr= value.split(".");    //用.把字符串str分开 
		        if(parseInt(laststr[0])>255||parseInt(laststr[1])>255||parseInt(laststr[2])>255||parseInt(laststr[3])>255){ //判断IP每位的大小 
		        	self.addClass("err").nextAll(".err").html("您输入的IP范围不正确，必须是0~255之间");
		        	break;
		        }
			}
			break;
		default:
			break;
	}
};









