<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/header.jsp" %>

	 	
<style>	
		
</style>

	<div class="sub_contents">
		<div class="sub_contents_inner">
			<div class="sub_tit_area">
				<h2>상품 리스트</h2>
			</div>
			<div class="shop_list_wrap">
				<ul>
					<c:forEach items="${list}" var="list">
					 <li>
					  <div class="goodsThumb">
					   <img src="${list.gdsThumbImg}">
					  </div> 
					  <div class="goodsName">
					   <a href="/shop/view?gdsNum=${list.gdsNum}">${list.gdsName}</a>
					  </div>
					 </li>
					 </c:forEach>
				</ul>
			</div>						
		</div>				
	</div>		
	
<%@ include file="../inc/footer.jsp" %>	
	