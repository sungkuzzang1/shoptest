<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp" %>

<style>
	.sub_container{width:1000px;margin:0 auto;padding-top:50px}
	.admin_content{box-sizing:border-box;border-top:solid 2px #eee}
	.sub_tit_wrap{text-align:center;margin-bottom:30px}
	.sub_tit_wrap > h1{font-size:20px;}	
	</style>
			
	
		<div class="sub_container">
			<div class="sub_tit_wrap">
				<h1>상품목록</h1>
			</div>
			<div class="sub_content">	
				<table>
				 <thead>
				  <tr>
				   <th>썸네일</th>
				   <th>번호</th>
				   <th>이름</th>
				   <th>카테고리</th>
				   <th>가격</th>
				   <th>수량</th>
				   <th>등록날짜</th>
				  </tr>
				 </thead>
				 <tbody>
				  <c:forEach items="${list}" var="list">
				  <tr>
				   <td><img src="${list.gdsThumbImg }"></td>
				   <td>${list.gdsNum}</td>
				   <td><a href="/admin/goods/view?gdsNum=${list.gdsNum }">${list.gdsName}</a></td>
				   <td>${list.cateName}</td>
				   <td>
				   	<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>				   	
				   </td>
				   <td>${list.gdsStock}</td>
				   <td>
				   	<fmt:formatDate value="${list.gdsDate}" pattern="yyy-MM-dd"/>				   	
				   </td>
				  </tr>   
				  </c:forEach>
				 </tbody>
				</table>
									
			</div>
		</div>	
		

<%@ include file="../inc/footer.jsp" %>