<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${path}/resources/css/common.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<title>사이트</title>
</head>
<body>	

	<div id="wrap">
		<header>
			<div>
				<h1>로고</h1>
				<nav>
					<a href="#">게시판</a>					
					<ul>
						<c:if test = "${member==null }">
						<li><a href="${path }/member/login">로그인</a></li>
						<li><a href="${path }/member/signUp">회원가입</a></li>
						</c:if>
						<c:if test = "${member!=null }">
						<li><a href="${path }/member/logout">로그아웃</a></li>
						<li><a href="${path }/member/modify">회원정보수정</a></li>
							<c:if test = "${member.verify==1 }">
								<li><a href="${path }/admin/index">관리자 화면</a></li>
							</c:if>
						</c:if>
					</ul>					
				</nav>
			</div>
		</header>
		
		
		

