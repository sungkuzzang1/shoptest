<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/header.jsp"%>


<style>
</style>

<div class="sub_contents">
	<div class="sub_contents_inner">
		<div class="sub_tit_area">
			<h2>상품 보기</h2>
		</div>
		<div class="shop_view_wrap">
			<form role="form" method="post">
				<input type="hidden" id="gdsNum" name="gdsNum" value="${view.gdsNum}" />
			</form>

			<div class="goods">
				<div class="goodsImg">
					<img src="${view.gdsImg}">
				</div>

				<div class="goodsInfo">
					<p class="gdsName">
						<span>상품명</span>${view.gdsName}</p>

					<p class="cateName">
						<span>카테고리</span>${view.cateName}</p>

					<p class="gdsPrice">
						<span>가격 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
						원
					</p>

					<p class="gdsStock">
						<span>재고 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
						EA
					</p>

					<p class="cartStock">
						<span>구입 수량</span> <input type="number" cmin="1"
							max="${view.gdsStock}" value="1" class="numBox"/>
					</p>

					<p class="addToCart">
						<button type="button" class="addCart_btn">카트에 담기</button>
					</p>
				</div>

				<div class="gdsDes">${view.gdsDes}</div>
			</div>
			
			<script>
 $(".addCart_btn").click(function(){
  var gdsNum = $("#gdsNum").val();
  var cartStock = $(".numBox").val();
           
  var data = {
    gdsNum : gdsNum,
    cartStock : cartStock
    };
  
  $.ajax({
   url : "/shop/view/addCart",
   type : "post",
   data : data,
   success : function(result){
    
    if(result == 1) {
     alert("카트 담기 성공");
     $(".numBox").val("1");
    } else {
     alert("회원만 사용할 수 있습니다.")
     $(".numBox").val("1");
    }
   },
   error : function(){
    alert("카트 담기 실패");
   }
  });
 });
</script>
			
			
			<div id="reply">

				<c:if test="${member == null }">
					<p>
						소감을 남기시려면 <a href="/member/login">로그인</a>해주세요
					</p>
				</c:if>

				<c:if test="${member != null}">
					<section class="replyForm">
						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="gdsNum" value="${view.gdsNum}">

							<div class="input_area">
								<textarea name="repCon" id="repCon"></textarea>
							</div>

							<div class="input_area">
								<button type="submit" id="reply_btn">소감 남기기</button>
							</div>

						</form>
					</section>
				</c:if>

				<section class="replyList">
					<ol>
						<c:forEach items="${reply}" var="reply">

							<li>
								<div class="userInfo">
									<span class="userName">${reply.userName}</span> <span
										class="date"><fmt:formatDate value="${reply.repDate}"
											pattern="yyyy-MM-dd" /></span>
								</div>
								<div class="replyContent">${reply.repCon}</div>
							</li>
						</c:forEach>
					</ol>
				</section>
			</div>

		</div>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>
