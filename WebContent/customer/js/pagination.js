/**
 * 分页控件
 * @param {Object} pageSize	分页大小
 * @param {Object} page	第几页
 * @param {Object} itemCount	数据总条数
 * @param {Object} pageFun	需要回调的查数据方法，该方法须为两个参数分别是 分页大小，第几页
 */
$.fn.initPagination = function(pageSize, page, itemCount, pageFun){
	var totalPage = Math.ceil(itemCount/pageSize);
	var startPage = 1;
	var endPage = totalPage;
	if(totalPage>5 && totalPage<(page+3)) {
		startPage = totalPage-4;
	} else if(totalPage>5 && totalPage>(page+2)){
		startPage = page-2<1?1:page-2;
		endPage = startPage+4;
	}
	var html="";
	if(startPage>1){
		html+="<a href=\"javascript:"+pageFun+"(1)\" class=\"chn\">&lt;&lt;</a>";
		html+="<a href=\"javascript:"+pageFun+"("+(page-1)+")\" class=\"chn\">&lt;</a>";
	}
	for(var i=startPage; i<=endPage; i++){
		if(i==page) {
			html+="<a href=\"javascript:"+pageFun+"("+i+")\" class=\"current\">"+i+"</a>";
		} else {
			html+="<a href=\"javascript:"+pageFun+"("+i+")\" >"+i+"</a>";
		}
	}
	if(endPage< totalPage){
		html+="<a href=\"javascript:"+pageFun+"("+(page+1)+")\" class=\"chn\">&gt;</a>";
		html+="<a href=\"javascript:"+pageFun+"("+totalPage+")\" class=\"chn\">&gt;&gt;</a>";
	}
	$(this).html(html);
}

