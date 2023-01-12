<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<!-- 네비바 -->
	<div>
		<%@ include file="../includes/nav.jsp" %>
	</div>

	<!-- 헤더 -->
	<div>
		<%@ include file="../includes/miniHeader.jsp" %>
	</div>
	
	<div>
		<section class="container">
			<!-- 메뉴 -->
			<div class="sidemenu2">
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
					<li class="side-li">비밀번호 변경</li>
					<br/>
					<li class="side-li">나의 걸음수</li>
				</ul>
			</div>
		
			<div class="minicon">
				<h1>마이 페이지 ~.~</h1>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>