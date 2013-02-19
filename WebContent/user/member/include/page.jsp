<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div class="pagination right">
	<c:if test="${ps.currentPage!=1}">
		<a href="?page=1">&laquo;</a>
	</c:if>
	<c:forEach var="index" begin="1" end="${ps.pageCount}" step="1">
		<a href="?page=${index}"
			<c:if test="${ps.currentPage==index}">class="active"</c:if>>${index}</a>
	</c:forEach>
	<c:if test="${ps.currentPage!=ps.pageCount}">
		<a href="?page=${ps.pageCount}">&raquo;</a>
	</c:if>
</div>
<!-- .pagination ends -->