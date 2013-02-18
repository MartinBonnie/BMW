<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<script type="text/javascript" src="<s:url value="/js/xheditor/xheditor-zh-cn.min.js"/>"></script>
<script type="text/javascript">
	$(function() {
		$(".ckeditor")
				.xheditor(
						{
							tools : 'Link,Source,Table,Img,Flash,FontColor,BackColor,Strikethrough,Underline,Italic,Bold,FontSize,Fontface',
							skin : 'vista',
							layerShadow : 2,
							html5Upload : false,
							upBtnText : '浏览',
							upLinkExt : 'jpg,png,bmp',
							upImgUrl : '<s:url value="/fileUpload/uploadByJson"/>',
							upFlashUrl:'<s:url value="/fileUpload/uploadByJson"/>',
							upFlashExt:"swf"
						});
	});
</script>
