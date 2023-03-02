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
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<!-- <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

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
	<nav class="navbar">
		<form class="container" name='homeForm' method="post" action="/member/login">
			<c:if test="${id == null}">
					<div class="nav-right">
						<ul class="profile">
							<li class="pro-li"><a href="/member/login">로그인</a></li>
							<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
						</ul>
					</div>
			</c:if>
				
			<c:if test="${id != null}">
				<div class="nav-right">
					<ul class="profile">
						<li class="pro-li"><a href="/note/note_list">쪽지</a></li>
						<c:choose>
							<c:when test="${member.id == 'admin'}">
								<li class="pro-li"><a href="/member/memberListView"><b style="color: #555555" >${member.nick}</b> 님</a></li>
							</c:when>
							<c:otherwise>
								<li class="pro-li"><a href="/member/myPage"><b style="color: #555555" >${member.nick}</b> 님</a></li>
							</c:otherwise>
						</c:choose>
						<li class="pro-li"><a href="/member/logout">로그아웃</a></li>
						<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
						<c:if test="${member.id == 'admin'}">
							<li class="pro-li"><a href="http://localhost:8081/complaint-all-view/">신고게시글</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
		</form>
	</nav>
	
	<div style="min-width: 1000px; width: 100%; border-bottom: 1px solid #f1f2f5;"></div>
</body>
</html>
