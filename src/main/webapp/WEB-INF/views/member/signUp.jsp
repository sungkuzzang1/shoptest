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
				<h2>회원가입</h2>
			</div>			
			<div class="sub_join_area">				
				<form action="${path }/member/signUp" method="post">
					<div class="join_input">					
						<label class="hide_label" for="userId">ID</label>
						<input name="userId" id="userId" type="text" placeholder="ID" required="required">
						<div class="btn_idChk">
							<button class="idChk" type="button" id="idChk" onclick="fn_idChk();">중복확인</button>
							<span class="error_idChk">								
							</span>
						</div>
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userPass">Password</label>
						<input name="userPass" id="userPass" type="password" placeholder="Password" required="required">
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userPasschk">비밀번호확인</label>
						<input name="userPasschk" id="userPasschk" type="password" placeholder="비밀번호 확인" class="pass_chk">
						<span class="error_passchk">this passwords didn't match. try again</span>
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userName">name</label>
						<input name="userName" id="userName" type="text" placeholder="name" required="required">
					</div>
					<div class="join_input">					
						<label class="hide_label" for="userPhon">연락처</label>
						<input name="userPhon" id="userPhon" type="text" placeholder="연락처" required="required">
					</div>
					<div class="join_input">
						<input type="submit" value="sign up" class="btn_join">
					</div>
				</form>				
			</div>
		</div>				
	</div>		
	<script>
	function fn_idChk(){
		$.ajax({
			url : "../member/idChk",
			type : "post",
			dataType : "json",
			data : {userId : $("#userId").val()},
			success : function(data){
				var idChk_txt = $('.error_idChk');
				if(data === 1){
					idChk_txt.text('That ID is taken. Try another');
					idChk_txt.fadeIn(500);
				}else if(data === 0){			
					idChk_txt.text('ok');
					idChk_txt.fadeIn(500);							
				}
			}
		})
	}

	
	$(function(){
			$('#userId').blur(function(){
				var userId = $(this).val();
				if(userId == ''){
					$('.error_idChk').hide();
				}
			});
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


	function checkPasswrd() {
		var passcode_input = document.querySelector("#passcode");
		
		if (passcode_input.value != "Ivy") {
			passcode_input.setCustomValidity("Wrong. It's 'Ivy'.");
		} else {
			passcode_input.setCustomValidity(""); // be sure to leave this empty!
			alert("Correct!");
		}
	}
	
	</script>
	
<%@ include file="../inc/footer.jsp" %>	
	