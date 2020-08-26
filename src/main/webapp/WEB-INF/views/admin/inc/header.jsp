<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${path}/resources/css/common.css" rel="stylesheet"/>
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<title>관리자화면</title>
</head>
<body>	
	
		
	<div id="wrap">
		<header>
			<div>
				<h1>로고</h1>
				<nav>
					<div class="admin_menu_wrap">
						<ul class="admin_menu">
							<li><a href="/admin/goods/register">상품 등록</a></li>
							<li><a href="/admin/goods/list">상품 목록</a></li>
							<li><a href="#">상품 소감</a></li>
							<li><a href="#">유저 목록</a></li>
						</ul>									
						<ul>						
							<c:if test = "${member!=null }">
							<li><a href="${path }/">일반화면</a></li>
							<li><a href="${path }/member/logout">로그아웃</a></li>													
							</c:if>
						</ul>
					</div>									
				</nav>
			</div>
		</header>
		
		
		

