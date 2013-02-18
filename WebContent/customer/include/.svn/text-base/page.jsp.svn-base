<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="page">
	<s:if test="pageList.currentPage!=1">
		<a href="?${actionUrl}page=1" class="chn">&lt;&lt;</a>
		<a href="?${actionUrl}page=${pageList.currentPage-1}" class="chn">&lt;</a>
	</s:if>
	<s:iterator value="pageList.pages" id="pageIndex">
		<a href="?${actionUrl}page=<s:property value="#pageIndex"/>"
			<s:if test="#pageIndex==pageList.currentPage">class="current"</s:if>><s:property
				value="#pageIndex" />
		</a>
	</s:iterator>
	<s:if test="pageList.currentPage!=pageList.pageCount">
		<a href="?${actionUrl}page=${pageList.currentPage+1}" class="chn">&gt;</a>
		<a href="?${actionUrl}page=${pageList.pageCount}" class="chn">&gt;&gt;</a>
	</s:if>
</div>
