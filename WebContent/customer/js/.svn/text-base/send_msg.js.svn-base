$(document).ready(function(){
	initMember();
});


initMember = function(){
	$.ajax({
        type: "post",
		async: false,
        url: contextPath+"/user/message/getMemberEnt",
        dataType: "json",
        data: {},
        success: function(result) {
			result = eval('(' +result+ ')');
            if(result.isTrue){
				$("#myMemberListUl").empty();
				for(var i=0; i<result.items.length; i++){
					var obj = result.items[i];
					$("#myMemberListUl").append("<li><a href=\"javascript:void(0)\" onclick=\"addRecv('"
						+obj.entId+"')\">"+obj.entName+"</a></li>");
				}
			}
			else 
				alert(result.message);
        },
        error: function() {
            alert("系统忙，请稍后再试！");
        }
    });
}
