var ARRAY_YEAR = new Array("2011", "2012");
var ARRAY_MONTH = new Array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");
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

// A more performant, but slightly bulkier, RFC4122v4 solution.  We boost performance
// by minimizing calls to random()
Math.uuid = function() {
	var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split(''), uuid = new Array(36), rnd = 0, r;
	for(var i = 0; i < 36; i++) {
		if(i == 8 || i == 13 || i == 18 || i == 23) {
			uuid[i] = '-';
		} else if(i == 14) {
			uuid[i] = '4';
		} else {
			if(rnd <= 0x02)
				rnd = 0x2000000 + (Math.random() * 0x1000000) | 0;
			r = rnd & 0xf;
			rnd = rnd >> 4;
			uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
		}
	}
	return uuid.join('');
};

//获取中文长度,一个中文相当于两个英文
String.prototype.CHNLength = function(){
    return this.replace(/[^\x00-\xFF]/g, '**').length;
};

//去掉字符串中的所有html标签
String.prototype.DelAllHtmlTag = function() {
    return this.replace(/<\/?.+?>/g, "");
};
//将两个或者两个以上的空格合并成一个
String.prototype.mergeSpace = function() {
    return this.replace(/\s{2,}/g, " ");
};

/**
 * javascriot 日期格式化
 * @param format
 * @returns
 */
Date.prototype.format = function(format) //author: meizz
{
	var o = {
		"M+" : this.getMonth() + 1, //month
		"d+" : this.getDate(), //day
		"h+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter
		"S" : this.getMilliseconds()
	//millisecond
	};
	f(/(y+)/.test(format));
	format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
	return format;
};