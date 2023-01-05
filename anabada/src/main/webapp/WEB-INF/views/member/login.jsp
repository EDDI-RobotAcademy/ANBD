<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})
	});
</script>
</head>

<body>
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="id"></label>
				<input type="text" id="id" name="id">
			</div>
		
			<div>
				<label for="userPass"></label>
				<input type="password" id="pass" name="pass">
			</div>
		
			<div>
				<button type="submit">로그인</button>
				<a href="./register">회원가입</a>
			</div>	
		</c:if>
		
		<c:if test="${member != null}">
			<div>
				<p>${member.nick}님 환영합니다.</p>
				<button id="memberUpdateBtn" type="button">회원 정보 수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		
		<c:if test="${msg == false}">
			<p>아이디와 비밀번호를 확인해 주세요.</p>
		</c:if>
	</form>
</body>
</html>