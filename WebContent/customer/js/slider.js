var IsFixMap = {};
$(document).ready(function(){
	$("#home").click(function(){
        $("#topMenuList li").hide();
        $("#topMenu li").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenu_li"]){	//判断浏览器是否是ie6.0， 并判断里面的img是否已经做过png滤镜处理
			$("#topMenu li img").each(function(){													//对条件范围内的img对象进行遍历处理
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenu_li"]=true;																//将滤镜处理状态设置为已处理，避免下一次重复处理
		}
    });
    $("#prod").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.chanpin").show();
        $("#topMenuList li.xiangce").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.chanpin"]){
			$("#topMenuList li.chanpin img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.chanpin"]=true;
		}
    });
    $("#ent").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.gongsi").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.gongsi"]){
			$("#topMenuList li.gongsi img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.gongsi"]=true;
		}
    });
    $("#customer").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.kehu").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.kehu"]){
			$("#topMenuList li.kehu img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.kehu"]=true;
		}
    });
    $("#tx").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.jiaoyi").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.jiaoyi"]){
			$("#topMenuList li.jiaoyi img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.jiaoyi"]=true;
		}
    });
    $("#winport").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenu li.xiangce").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenu_li.xiangce"]){
			$("#topMenu li.xiangce img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenu_li.xiangce"]=true;
		}
    });
    $("#news").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.xinxi").show();
        $("#topMenuList li.guanzhu").show();
        $("#topMenuList li.zixun").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.zixun"]){
			$("#topMenuList li.xinxi img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			$("#topMenuList li.guanzhu img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			$("#topMenuList li.zixun img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.zixun"]=true;
		}
    });
    $("#bank").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.yinhang").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.yinhang"]){
			$("#topMenuList li.yinhang img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.yinhang"]=true;
		}
    });
    $("#acc").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.zhanghao").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.zhanghao"]){
			$("#topMenuList li.zhanghao img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.zhanghao"]=true;
		}
    });
    $("#vip").click(function(){
        $("#topMenu li").hide();
        $("#topMenuList li").hide();
        $("#topMenuList li.vip").show();
		if($.browser.msie && $.browser.version=="6.0" && !IsFixMap["topMenuList_li.vip"]){
			$("#topMenuList li.vip img").each(function(){
				DD_belatedPNG.fixPng($(this)[0]);
			});
			IsFixMap["topMenuList_li.vip"]=true;
		}
    });
});

(function($){
    $.fn.Scroll = function(opt, callback){
        //参数初始化
        
        var self = this;
        this.timerID;
        if (!opt) var opt = {};
        var _this = this.eq(0).find("ul:first");
        this.lineH = _this.find("li:first").height(); //获取行高
        this.line = opt.line ? parseInt(opt.line, 10) : parseInt(this.height() / lineH, 10); //每次滚动的行数，默认为一屏，即父容器高度
        this.speed = opt.speed ? parseInt(opt.speed, 10) : 500; //卷动速度，数值越大，速度越慢（毫秒）
        this.timer = opt.timer ? parseInt(opt.timer, 10) : 3000; //滚动的时间间隔（毫秒）
        this.colsize = opt.colsize ? opt.colsize : 1;
        if (self.line == 0) self.line = 1;
        this.upHeight = 0 - self.line * self.lineH;
        //滚动函数
        this.scrollUp = function(){
            self.lineH = _this.find("li:first").height();
            self.upHeight = 0 - self.line * self.lineH;
            _this.animate({
                marginTop: self.upHeight
                // marginTop:self.upHeight
            }, self.speed, function(){
                for (i = 1; i <= self.line; i++) {
                    _this.find("li").slice(0, self.colsize).appendTo(_this);
                }
                _this.css("marginTop", 0);
            });
        }
        //鼠标事件绑定
        _this.hover(function(){
            clearInterval(self.timerID);
        }, function(){
            self.timerID = setInterval(function(){
                self.scrollUp();
            }, self.timer);
        }).mouseout();
    };
})(jQuery);
