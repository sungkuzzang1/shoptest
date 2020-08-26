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
				<h1>상품보기</h1>
			</div>
			<div class="sub_content">
				<div class="inputArea"> 
				 <label>1차 분류</label>
				 <span class="category1"></span>        
				 <label>2차 분류</label>
				 <span class="category2">${goods.cateCode}</span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsName">상품명</label>
				 <span>${goods.gdsName}</span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsPrice">상품가격</label>
				 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsStock">상품수량</label>
				 <span>${goods.gdsStock}</span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsDes">상품소개</label>
				 <span>${goods.gdsDes}</span>
				</div>
				
				<div class="inputArea">
				 <label for="gdsImg">이미지</label>
				 <p>원본 이미지</p>
				 <img src="${goods.gdsImg}" class="oriImg" style="width:500px"/>
				 
				 <p>썸네일</p>
				 <img src="${goods.gdsThumbImg}" class="thumbImg" style="width:300px"/>
				</div>
				
				<div>
					<ul>
						<li><a href="../goods/modify?gdsNum=${goods.gdsNum }">수정</a></li>
						<li><a href="../goods/delete?gdsNum=${goods.gdsNum }">삭제</a></li>
					</ul>
				</div>
			</div>
		</div>					


<%@ include file="../inc/footer.jsp" %>