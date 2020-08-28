<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/header.jsp" %>

	 	
<style>	
		
</style>

	<div class="sub_contents">
		<div class="sub_contents_inner">
			<div class="sub_tit_area">
				<h2>장바구니 리스트</h2>
			</div>
			<div class="shop_list_wrap">
				<ul>
  <c:forEach items="${cartList}" var="cartList">
  <li>
   <div class="thumb">
    <img src="${cartList.gdsThumbImg}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명 : </span>${cartList.gdsName}<br />
     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /><br />
     <span>구입 수량 : </span>${cartList.cartStock}<br />
     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
    </p>    
   </div>
   <div class="delete">
     <button type="button" class="delete_btn">삭제</button>
    </div>
   
  </li>
  </c:forEach>
 </ul>
			</div>						
		</div>				
	</div>		
	
<%@ include file="../inc/footer.jsp" %>	
	