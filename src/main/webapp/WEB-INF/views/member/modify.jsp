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
				<h2>회원 정보 수정</h2>
			</div>			
			<div class="sub_join_area">				
				<form action="<%=request.getContextPath() %>/member/memberUpdate" method="post" id="memmodifyForm">
					<input type="hidden" name="userId" value="${member.userId}">
					<!--  <div class="join_input">					
						<label class="hide_label" for="userId">ID</label>
						<input name="userId" id="userId" type="text" placeholder="ID" value="${member.userId}" readonly="readonly">						
					</div>-->
									
					<div class="join_input">					
						<label class="hide_label" for="userPass">Password</label>
						<input name="userPass" id="userPass" type="password" placeholder="Password">
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userPasschk">비밀번호확인</label>
						<input name="userPasschk" id="userPasschk" type="password" placeholder="비밀번호 확인" class="pass_chk">
						<span class="error_passchk">this passwords didn't match. try again</span>
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userName">name</label>
						<input name="userName" id="userName" type="text" placeholder="name" value="${member.userName }" readonly="readonly">
					</div>
					<div class="join_input">
						<a href="#" id="modifyButton">회원 정보 수정</a>
						<input type="submit" value="sign up" class="btn_join">
					</div>
				</form>				
			</div>
		</div>				
	</div>
			
	<script>	
	$("#modifyButton").on("click",function(){			
		$.ajax({
			url:"../member/passChk",
			type:"POST",
			dataType:"json",
			data: $("#memmodifyForm").serializeArray(),
			success:function(data){
				if(data==true){
					if(confirm("회원 수정을 하시겠습니까?")){
						$("#memmodifyForm").submit();
					}						
				}else{
					alert("패스워드가 틀렸습니다.");
					return;						
				}
			}
		
		});
	});	
	
	$(function(){			
		//비밀번호 확인
			$('#userPasschk').blur(function(){
			   if($('#userPass').val() != $('#userPasschk').val()){
			    	if($('#userPasschk').val()!=''){
				    $('.error_passchk').show();			   		
			       }
			    }else{
			    	$('.error_passchk').hide();
				}
			})  	   
	});

	
	
	</script>
	
<%@ include file="../inc/footer.jsp" %>	
	