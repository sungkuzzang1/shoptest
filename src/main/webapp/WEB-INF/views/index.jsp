<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./inc/header.jsp" %>
<style>
	.container{position: absolute;width:600px;height:720px;left:0;right:0;top:0;bottom:0;margin:auto}
	.content{width:600px;margin:0 auto;box-sizing:border-box;padding:60px 100px;background:#eee}
	.logo_wrap{text-align:center;margin-bottom:30px}
	.id_pw_area > div{margin-bottom:15px}
	.id_pw_area > div:last-child{margin-bottom:0}
	.id_pw_area .idpw_input{width:100%;height:45px;border:0;font-size:15px;padding:15px;box-sizing:border-box;color:#000}
	.id_pw_area .idpw_btn{border:0;outline:0;background:#000;color:#fff;font-size:15px;height:45px;line-height:45px;width:100%}
	
	.idpw_link_area{margin-top:20px}
	.idpw_link_area > p{margin-bottom:5px}
	</style>
	
		<div class="container">
			<div class="logo_wrap">
				<h1>로고</h1>
			</div>
			<div class="content">
				<c:if test="${member == null}">				
				<div class="login_wrap">
					<form action="${path }/member/login" method="post">
						<div class="id_pw_area">
							<div class="id_wrap">
								<label for="userId" class="hide_txt">아이디</label>
								<input type="text" name="userId" id="userId" class="idpw_input" placeholder="id">
							</div>
							<div class="pw_wrap">
								<label for="userPass" class="hide_txt">비밀번호</label>
								<input type="password" name="userPass" id="userPass" class="idpw_input" placeholder="pw">
							</div>
							<div class="idpwbtn_wrap">
								<input type="submit" value="로그인" class="idpw_btn">
							</div>
						</div>
					</form>
					<div class="idpw_link_area">
						<p><a href="${path}/member/signUp">회원가입</a></p>
						<p><a href="#">forgot my id</a></p>
						<p><a href="#">forgot my pw</a></p>
					</div>
				</div>
				</c:if>
				<c:if test="${member != null}">
					<p>${member.userName}님 환영 합니다.</p>
					<a href="${path }/member/logout" class="logout">로그아웃</a>
					<div><a href="${path }/member/modify" class="logout">회원정보수정</a></div>
					<div><a href="${path }/member/memberDeleteView" class="logout">회원탈퇴</a></div>
				</c:if>
				<c:if test="${msg == false}">
					<script>
						alert('로그인 실패!');
					</script>
				</c:if>
			</div>
		</div>	
	
	<script>
		$(document).ready(function() {
		  $('body').css('display', 'none');
		  $('body').fadeIn(2000);

		  $('.link').click(function() {
		    event.preventDefault();

		    newLocation = this.href;
		    $('body').fadeOut(1000, newPage);
		  });

		  function newPage() {
		    window.location = newLocation;
		  }
		});
	</script>

<%@ include file="./inc/footer.jsp" %>