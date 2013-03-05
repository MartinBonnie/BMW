
$(function(){
     var len  = $(".num > li").length;
	 var index = 0;
	 var adTimer;
	 $(".slider").height(len*295);
	 $(".num li").mouseover(function(){
		index  =   $(".num li").index(this);
		showImg(index);
	 }).eq(0).mouseover();	

	 $('.ad').hover(function(){
			 clearInterval(adTimer);
		 },function(){
			 adTimer = setInterval(function(){
			    index++;
				if(index==len){index=0;}
				showImg(index);	
			  } , 2000);
	 }).trigger("mouseleave");
	 
	 
	 
	 

	 
	 
	 
	 
	 
})

function showImg(index){
		
        var adHeight = $(".ad").height();
		$(".slider").stop(true,false).animate({top : -adHeight*index},1000);
		$(".num li").removeClass("on")
			.eq(index).addClass("on");
}


 $(this).scroll(function() {  
 var bodyTop = 0;  
 if (typeof window.pageYOffset != 'undefined') {  
 bodyTop = window.pageYOffset;  
 }  
 else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat')  
 {  
 bodyTop = document.documentElement.scrollTop;  
 }  
 else if (typeof document.body != 'undefined') {  
 bodyTop = document.body.scrollTop;  
 }  

  $("#show_position").stop().animate({"top":135+bodyTop},500);
  $(".back").click(function(){
		document.documentElement.scrollTop=0
			
	})
	
 });  
 
