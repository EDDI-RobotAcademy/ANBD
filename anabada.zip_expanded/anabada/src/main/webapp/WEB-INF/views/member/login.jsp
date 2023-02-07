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
<title>아나바다</title>
<link href="../resources/css/r_styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "member/registerAgree";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})
		
		var formObj = $("form[name='homeForm]");
		
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				$("#Chk").attr("style", "color:#FF0000;");
	            $("#Chk").text("아이디와 비밀번호를 확인해 주세요.");
	            $("#id").focus();
	            return false;
			
			} else if ($("#pass").val() == "") {
				$("#Chk").attr("style", "color:#FF0000;");
	            $("#Chk").text("아이디와 비밀번호를 확인해 주세요.");
	            $("#pass").focus();
	            return false;
			}
			
			formObj.attr("action", "/member/login");
			formObj.submit();
		})
	});
</script>
</head>

<body style="background-color: #F9F9F9;">
	<form name='homeForm' method="post" class="regicon">
		<div class="regcenter">
			<div class="login-logo">
				<a href="/"><img src="../resources/images/reglogo.png" style="width: 200px; height: 57px;" /></a>
			</div>
			
			<div class="login-box">
				<input class="login-in" type="text" id="id" name="id" placeholder="아이디">
			</div>
		
			<div class="login-box2">
				<input class="login-in2" type="password" id="pass" name="pass" placeholder="비밀번호">
			</div>
			
			<div>
				<font id="Chk" size="2">
					<c:if test="${msg == false}">
						<font style="color:#FF0000;">아이디와 비밀번호를 확인해 주세요.</font>
					</c:if>
				</font>
			</div>

			<div>
				<button class="login-but" type="submit" id="submit">로그인</button>
			</div>
			
			<div style="text-align: center; font-size: 13px; color: #555555;">
				<a href="./findId">아이디 찾기</a> │
				<a href="./findPass">비밀번호 찾기</a> │
				<a href="./registerAgree">회원가입</a>
			</div>
			
			<div class="reg-corp" style="margin: 20px auto 20px auto;">
				© ANABADA Corp.
			</div>
		</div>
	</form>
</body>
</html>