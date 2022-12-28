<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
<link rel="manifest" href="<c:url value='/images/manifest.json'/>">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../resources/css/styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		// 유효성 검사
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해 주세요.");
				$("#id").focus();
				return false;
			}

			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#pass").focus();
				return false;
			}

			if ($("#pass2").val() == "") {
				alert("비밀번호를 재확인해 주세요.");
				$("#pass2").focus();
				return false;
			}

			if ($("#name").val() == "") {
				alert("이름을 입력해 주세요.");
				$("#name").focus();
				return false;
			}

			if ($("#nick").val() == "") {
				alert("닉네임을 입력해 주세요.");
				$("#nick").focus();
				return false;
			}

			if ($("#tel").val() == "") {
				alert("전화번호를 입력해 주세요.");
				$("#tel").focus();
				return false;
			}

			if ($("#email").val() == "") {
				alert("이메일을 입력해 주세요.");
				$("#email").focus();
				return false;
			}

			if ($("#loca").val() == "") {
				alert("지역을 선택해 주세요.");
				$("#loca").focus();
				return false;
			}
			
		})
	
		// 비밀번호 재확인
		$("#pass2").focusout(function() {
			if ($("#pass").val() == $("#pass2").val()) {
				$('#submit').prop('disabled', false);
				$("#warning").text(" ");
	            $("#warning").attr("style", "color:#0C6BBC");
			} else {
				$('#submit').prop('disabled', true);
	            $("#warning").attr("style", "color:#FF0000; padding-left: 5px;");
	            $("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		})
	});
	
	// 아이디 중복 확인
	$(function() {
		// 아이디가 빈 칸일 때
		$('#id').keyup(function() {
			if ($(this).val() == "") {
				$("#idChk").attr("style", "color:#FF0000; padding-left: 5px;");
	            $("#idChk").text("아이디를 입력해 주세요.");
			
	            // 아이디 중복 체크
			} else {
				$.ajax({
		 			url : "/member/idChk",
		 			type : "post",
		 			dataType : "json",
		 			data : {"id" : $("#id").val()},
		 			success : function(data){
		 				if (data == 1) {
		 					$("#idChk").attr("style", "color:#FF0000; padding-left: 5px;");
		 		            $("#idChk").text("사용 중인 아이디입니다.");
		 					return false;
		 				} else if (data == 0) {
		 					$("#idChk").text("사용 가능한 아이디입니다.");
		 		            $("#idChk").attr("style", "color:#0C6BBC; padding-left: 5px;");
		 				}
		 			}
				})
			}
		})
	})
	
	// 닉네임 중복 확인
		$(function() {
		// 닉네임이 빈 칸일 때
		$('#nick').keyup(function() {
			if ($(this).val() == "") {
				$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
	            $("#nickChk").text("닉네임을 입력해 주세요.");
			
	            // 아이디 중복 체크
			} else {
				$.ajax({
		 			url : "/member/nickChk",
		 			type : "post",
		 			dataType : "json",
		 			data : {"nick" : $("#nick").val()},
		 			success : function(data){
		 				if (data == 1) {
		 					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
		 		            $("#nickChk").text("사용 중인 닉네임입니다.");
		 					return false;
		 				} else if (data == 0) {
		 					$("#nickChk").text("사용 가능한 닉네임입니다.");
		 		            $("#nickChk").attr("style", "color:#0C6BBC; padding-left: 5px;");
		 				}
		 			}
				})
			}
		})
	})
</script>
</head>

<body style="background-color: #F9F9F9;">
	<section class="regicon">
		<form action="/member/register" method="post">
			<div class="regcenter">
				<div class="reg-logo">
					<a href="/"><img src="../resources/images/reglogo.png"></a>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="id">아이디</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="id" name="id" required autofocus />
					</div>
					<div>
						<font id="idChk" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass">비밀번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass" name="pass" required />
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass2">비밀번호 재확인</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass2" name="pass2" required />
					</div>
					<div>
						<font id="warning" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="name">이름</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="name" name="name" required />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="nick">닉네임</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="nick" name="nick" required />
					</div>
					<div>
						<font id="nickChk" size="2"></font>
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="tel">휴대폰 번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="tel" id="tel" name="tel" required />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="email">이메일</label><br />
					<div class="reg-box">
						<input class="reg-in" type="email" id="email" name="email" required />
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="loca">지역</label><br />
					<select class="reg-select" id="loca" name="loca">
						<option value="강원">강원</option>
						<option value="경기">경기</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="부산">부산</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주">제주</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
					</select>
				</div>
				
				<div>
					<button class="reg-but" type="submit" id="submit">회원가입</button>
				</div>
				
				<div class="reg-corp">
					Copyright <b>ANABADA Corp.</b> All Rights Reserved.
				</div>
			</div>
		</form>
	</section>
</body>
</html>