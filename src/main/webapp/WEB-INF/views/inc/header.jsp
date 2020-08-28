<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>사이트</title>
</head>
<body>

<style>
.header_wrap{width:100%;max-width:1600px;margin:0 auto;height:60px}
.header_wrap:after{clear:both;display:block;content:''}
.header_wrap > .logo_wrap{float:left;}
.header_wrap > .gnb_wrap{float:left}
.header_wrap > .gnb_wrap .gnb_list:after{clear:both;display:block;content:''}
.header_wrap > .gnb_wrap .gnb_list > li{display:inline-block}
.header_wrap > .util_menu_wrap{float:right}
.header_wrap > .util_menu_wrap > .util_menu:after{clear:both;display:block;content:''}
.header_wrap > .util_menu_wrap > .util_menu > li{display:inline-block}
</style>

	<div id="wrap">
		<header>
			<div class="header_wrap">
				<div class="logo_wrap">
					<h1>로고</h1>
				</div>
				<div class="gnb_wrap">
					<nav class="gnb">
						<ul class="gnb_list">
							<li>
								<a href="/shop/list?cateCode=100&level=1">무기</a>
								<div class="sub_gnb_box">
									<ul class="sub_gnb_list">
										<li><a href="/shop/list?cateCode=101&level=2">돌격소총</a></li>
										<li><a href="/shop/list?cateCode=102&level=2">기관단총</a></li>
										<li><a href="/shop/list?cateCode=103&level=2">경기관총</a></li>
										<li><a href="/shop/list?cateCode=104&level=2">산탄총</a></li>
										<li><a href="/shop/list?cateCode=105&level=2">지정사수소총</a></li>
										<li><a href="/shop/list?cateCode=106&level=2">저격소총</a></li>
										<li><a href="/shop/list?cateCode=107&level=2">기타</a></li>
									</ul>
								</div>
							</li>
							<li><a href="#">탄약</a></li>
							<li><a href="#">방어구</a></li>
							<li><a href="#">회복제</a></li>							
						</ul>
					</nav>
				</div>
				<div class="util_menu_wrap">
					<ul class="util_menu">
						<c:if test="${member==null }">
							<li><a href="${path }/member/login">로그인</a></li>
							<li><a href="${path }/member/signUp">회원가입</a></li>
						</c:if>
						<c:if test="${member!=null }">
							<li><a href="${path }/member/logout">로그아웃</a></li>
							<li><a href="${path }/member/modify">회원정보수정</a></li>
							<c:if test="${member.verify==1 }">
								<li><a href="${path }/admin/index">관리자 화면</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>				
			</div>
		</header>