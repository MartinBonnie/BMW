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

String.prototype.isPhone = function(){
	return /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(this);
};

String.prototype.isCell = function(){
	return /^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(this); 
};

String.prototype.isEmpty = function(){
	return (this == null || this.trim().length == 0);
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










