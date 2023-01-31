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
<script>
$(window).onload(function() {
	alert("hi-load");
});
</script>
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
<%-- 				<img src="<c:url value='/images/lev_1.png'/>" style="width: 90px; height: 90px;"> --%>
<%-- 				<img src="<c:url value='/images/lev_2.png'/>" style="width: 90px; height: 90px;"> --%>
<%-- 				<img src="<c:url value='/images/lev_3.png'/>" style="width: 90px; height: 90px;"> --%>
				<img src="<c:url value='/images/lev_4.png'/>" style="width: 90px; height: 90px;">
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<br>
					<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
					<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>

					<br><hr><br>
					<li class="side-li"><a href="/userProduct/myStore">내 상점 보기</a></li>
					<li class="side-li"> <a href="/userProduct/myHeartList" >내 찜 목록 보기</a> </li>
					<li class="side-li">참여한 이벤트</li>
					<br><hr><br>
					<li class="side-li"><a href="/a_board/myWriteList">내가 쓴 게시글</a></li>
					<li class="side-li">내가 쓴 댓글</li>
					<br><hr><br>
					<li class="side-li"><a href="/job/my_job">아르바이트 공고</a></li>
					<li class="side-li"><a href="/resume/my_resume">아르바이트 지원</a></li>
					<li class="side-li"><a href="/job/my_heart">아르바이트 찜</a></li>
					<br><hr><br>
					<li class="side-li">나의 걸음수</li>
					<br><hr><br>

					<li class="side-li"><a href="/member/memberDeleteView">회원 탈퇴</a></li>
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