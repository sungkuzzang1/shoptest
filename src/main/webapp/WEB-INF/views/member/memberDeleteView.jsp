<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/header.jsp" %>

	 	
<style>	
	.sub_join_area{width:600px;margin:0 auto;padding-top:50px;position:relative}
	.sub_join_area .join_input{width:100%;margin-bottom:20px;position:relative}
	.sub_join_area .join_input:last-child{margin-bottom:0}
	.sub_join_area .join_input input{width:100%;height:50px;line-height:50px;font-size:15px;box-sizing:border-box;padding:15px;outline:none}
	.sub_join_area .join_input input.btn_join{padding:0;color:#fff;background:#000;border:none;outline:none}
	.error_passchk{display:none;color:red}
	.btn_idChk{position:absolute;top:0;right:-120px;}
	.btn_idChk > button{display:inline-block;background:#000;color:#fff;height:50px;line-height:50px;width:100px;outline:0;font-size:15px}
	.btn_idChk .error_idChk{position:absolute;top:-45px;display:inline-block;background:#000;color:#fff;width:230px;font-size:15px;height:30px;line-height:30px;border-radius:10px;text-align:center;left:10px;display:none}
	.btn_idChk .error_idChk:after{display:inline-block;content:'';border-width: 10px 10px 0 10px;border-style: solid;border-color: #000 transparent transparent transparent;position:absolute;left:20px;bottom:-10px}
</style>
	

	<div class="sub_contents">
		<div class="sub_contents_inner">
			<div class="sub_tit_area">
				<h2>회원 정보 삭제</h2>
			</div>			
			<div class="sub_join_area">				
				<form action="<%=request.getContextPath() %>/member/memberDelete" method="post" id="memdelForm">
					<input type="hidden" name="userId" value="${member.userId}">
					<!--  <div class="join_input">					
						<label class="hide_label" for="userId">ID</label>
						<input name="userId" id="userId" type="text" placeholder="ID" value="${member.userId}" readonly="readonly">						
					</div>-->
					
					<p>${member.userName }님 회원탈퇴를 위해서 비밀번호를 입력 해 주세요</p>
									
					<div class="join_input">					
						<label class="hide_label" for="userPass">Password</label>
						<input name="userPass" id="userPass" type="password" placeholder="Password">
					</div>										
					<div class="join_input">
						<a href="#" id="passd">회원탈퇴</a>
						<input type="submit" value="회원탈퇴" class="btn_join">
					</div>
				</form>				
			</div>
		</div>				
	</div>		
	
	<script>	
		$("#passd").on("click",function(){			
			$.ajax({
				url:"../member/passChk",
				type:"POST",
				dataType:"json",
				data: $("#memdelForm").serializeArray(),
				success:function(data){
					if(data==true){
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#memdelForm").submit();
						}													
					}else{
						alert("패스워드가 틀렸습니다.");
						return;				
					}
				}
			
			});
		});	
	</script>
	
	
	
	
<%@ include file="../inc/footer.jsp" %>	
	