<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>아나바다</title>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		});

		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		});

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		});
	});
	
</script>
<body>
<div>
	<a href="a_board/list">게시판</a>
</div>
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null && id == null}">
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
				<button id="registerBtn" type="button">회원가입</button><br>
			</div>	
			
			<div>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=1cd5f25c91f73f916bf1cf73f7a82141&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code&scope=profile_nickname,profile_image,account_email">
					<img src="<c:url value='/images/kakao_login.png'/>"/>
				</a>
			</div>
		</c:if>
		
		<c:if test="${member != null}">
			<div>
				<p>${member.id}님 로그인 성공하셨습니다.</p>
				<button id="memberUpdateBtn" type="button">회원 정보 수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		
		<c:if test="${id != null }">
			<div>
				<p>${id }님 로그인 성공하셨습니다.</p>
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
