<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link href="<s:url value="/customer/css/css.css"/>" rel="stylesheet" type="text/css" />
<script src="<s:url value="/customer/js/jquery.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/common.js"/>"></script>
<script type="text/javascript" src="<s:url value="/customer/js/pagination.js"/>"></script>
<script type="text/javascript" src="<s:url value="/customer/js/news_push.js"/>"></script>
<script type="text/javascript" src="<s:url value="/customer/js/index_news.js"/>"></script>
<script type="text/javascript" src="<s:url value="/customer/js/index_ad.js"/>"></script>
<script type="text/javascript" src="<s:url value="/customer/js/slider.js"/>"></script>
<script>
$(document).ready(function() {
	showOrHide();
	 $("#scrollDiv").Scroll({line:1,speed:500,timer:1500});
	 $("#scrollDiv1").Scroll({line:1,speed:500,timer:1500});
	 $("#scrollDiv2").Scroll({line:1,speed:500,timer:1500});
});
	$(function(){
		$("#nav li a").click(function(){
			$("#nav li").removeClass("current");
			$(this).parent().addClass("current");
		});
		$(".sideC li:odd").addClass("odd");
		
	});
	
	function showOrHide(){
		$(".showOrHide span").each(function(){
			$(this).bind("click", function(){
				$(this).attr("current", "true");
				showCurrent();
			});
		});
	};

	function showCurrent(){
		$(".showOrHide span").each(function(){
			if($(this).attr("current") == "true"){
				$(this).attr("class", "current");
				$(this).attr("current", "");
			} else {
				$(this).attr("class", "");
			}
		});
	};
</script>
</head>

<body>
<div class="wraper clearfix ">
    <div id="wrap">
		<s:include value="/customer/include/top.jsp"/>       
        <div class="personal border clearfix">
        	<div class="l">
            	<span class="cov">
            	<a href="<s:url value="/customer/logo/viewLogo"/>">
            	
            	<s:if test="#session.currentAtt== 10">
            	<img src="<s:url value="/customer/images/nophoto.jpg"/>"  width="50" height="50"/>
            	</s:if><s:else>
            	<img src="<s:url value='%{#session.currentAtt}'/>" width="50" height="50" ></img>
            	</s:else></a></span>
                <h2><s:property value="%{#session.nameInfo}"></s:property></h2>
                <p>
                <s:if test="%{#session.jaduser.isAuditUser()}">认证会员<img class="vip_blue"
						src="<s:url value="/images/transparent.gif"/>" title="认证会员" />
				</s:if><s:else><a style="float:none;color:#FF7F00;" href="<s:url value="/customer/inputAudict"/>">申请认证</a>
				<img class="apply_vip" src="<s:url value="/images/transparent.gif"/>" title="申请认证" /></s:else></p>
            </div>
            <div class="c"  id="scrollDiv">
            	<ul id="newEnt">
                </ul>
            </div>
            <div class="c"  id="scrollDiv1">
            	<ul id="newProduct">
                </ul>
            </div>
            <div class="d"  id="scrollDiv2">
            	<ul id="newsNew">
                </ul>
            </div>
        </div>
        
        
        <div id="container"  class="clearfix">
        	<div class="clearfix">
                <div class="sideL">
                    <div class="box border">
                        <div class="area border">
                            <h3><span style="float:right"><a href="<s:url value="/customer/news/showIndNews"/>" class="more">更多..</a></span>行业资讯</h3>
                            <ul id="newsShow">
                            </ul>
                        </div>
                    </div>
                    
                    <div class="box border ">
                        <div class="area border">
                           <h3><span style="float:right"><a href="<s:url value="/customer/news/showIndNews"/>" class="more">更多..</a></span>热门资讯</h3>
                           <ul  id="newsHot">
                            </ul>
                        </div>
                    </div>
                    
                </div>
                
                <div class="sideC">
                    <div class="box border trends">
                        <div class="area border">
                        	<h3 class="showOrHide">
                        		<a class="more" href="<s:url value="/customer/concern/more_push.jsp"/>">更多..</a>
                            	<span class="current" onclick="$('#s2').hide();$('#s1').show()">产品资讯</span>
                                <span onclick="$('#s1').hide();$('#s2').show()">新闻资讯</span>								
                            </h3>
                            <ul class="s1" id="s1">
     
                           </ul>
                           <ul style="display:none"  id="s2">
       
                            </ul>                    
                        </div>
                    </div>
                </div>
                
                <div class="sideAd">
                    <div class="banner">
                    	<ul class="rightUpAd" id="rightUpAd">
                    	</ul>
                    </div>
                    <div class="box border">
                        <div class="area border">
                        	<ul id="rightDownSDiv">
                    		</ul>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        
        
        
    </div>
    
</div>
<s:include value="/customer/include/footer.jsp"/> 
</body>
</html>
