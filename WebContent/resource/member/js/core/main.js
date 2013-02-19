$(document).ready(function(){
    $.setMenu();
    $.showDiagram($('#days'), "line");
    $("ul.tabs").delegate("li", "click", function(){
        $(this).parent().find("li.active").removeClass("active");
        $(this).addClass("active");
    });
	$('#wysiwyg').wysiwyg();
	$('input.date_picker').date_input();
	$("select.styled").select_skin();
	$('.block input[type=file]').addClass('file');
	$("input[type=file]").filestyle({ 
	    image: "/resource/member/images/upload.gif",
	    imageheight : 30,
	    imagewidth : 80,
	    width : 250
	});
	$("#fileupload").mouseover(function(){
		$('#uploadmsg').addClass('loading').text('Uploading...');
	});
	$("#fileupload").mouseout(function(){
		$('#uploadmsg').removeClass('loading').text("Complete...");
	});
	$("ul.tabs li").click(function() {
		$(this).parent().find('li').removeClass("active");
		$(this).addClass("active");
		$(this).parents('.block').find(".tab_content").hide();
		$($(this).find("a").attr("href")).show();
	});
	$("ul.sidemenu li").click(function() {
		$(this).parent().find('li').removeClass("active");
		$(this).addClass("active");
		$(this).parents('.block').find(".sidebar_content").hide();		
		$($(this).find("a").attr("href")).show();
	});	
});

$.setMenu = function(){
	var navDOM = $("#main-nav");
	navDOM.find("ul").hide();
	navDOM.find("a.current").parent().find("ul").slideToggle("slow"); // Slide down the current menu item's sub menu
	navDOM.find("a.nav-top-item").click( // When a top menu item is clicked...
		function () {
			$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
			$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
			return false;
		}
	).hover(
		function () {
			$(this).stop().animate({ paddingRight: "25px" }, 200);
		}, 
		function () {
			$(this).stop().animate({ paddingRight: "15px" });
		}
	);
	navDOM.find("#a.no-submenu").click( // When a menu item with no sub menu is clicked...
		function () {
			window.location.href=(this.href); // Just open the link instead of a sub menu
			return false;
		}
	); 
}

$.showDiagram = function(conDOM, chartType){
	// Web stats
	var tableDOM = conDOM.find("table");
	conDOM.show();
	var isInteraction = true;
	if(chartType=="bar")
		isInteraction = false;
	if(!$.data(tableDOM[0], "isHas")){
		tableDOM.css("margin", "2000px 0 0 2000px").show();
		tableDOM.hide().visualize({
			type: chartType,	// 'bar', 'area', 'pie', 'line'
			width: conDOM.width()-60,
			height: '240px',
			colors: ['#6fb9e8', '#ec8526', '#9dc453', '#ddd74c'],
			lineDots: 'double',
			interaction: isInteraction,
			multiHover: 20,
			tooltip: true,
			tooltiphtml: function(data) {
				var html ='';
				for(var i=0; i<data.point.length; i++){
					html += '<p class="chart_tooltip"><strong>'+data.point[i].value+'</strong> '+data.point[i].yLabels[0]+'</p>';
				}	
				return html;
			}
		});
		$.data(tableDOM[0], "isHas", true);
	}
}
