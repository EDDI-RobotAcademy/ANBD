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
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
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
	<!-- nav 영역 -->
	<nav class="navbar navbar-border">
		<form class="container" name='homeForm' method="post" action="/member/login">
			<c:if test="${member == null}">
					<div class="nav-right">
						<ul class="profile">
							<li class="pro-li"><a href="/member/login">로그인</a></li>
							<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
						</ul>
					</div>
			</c:if>
				
			<c:if test="${member != null}">
				<div class="nav-right">
					<ul class="profile">
						<li class="pro-li">쪽지</li>
						<li class="pro-li"><a href="/member/memberUpdateView"><b>${member.nick}</b> 님</a></li>
						<li class="pro-li"><a href="/member/logout">로그아웃</a></li>
						<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
					</ul>
				</div>
			</c:if>
		</form>
	</nav>
</body>
</html>