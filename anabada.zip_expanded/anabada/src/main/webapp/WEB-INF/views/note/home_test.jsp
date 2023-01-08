<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="manifest" href="resources/images/manifest.json">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<div>
		<jsp:include page="../includes/nav.jsp" />
	</div>
	
	<div>
		<jsp:include page="../includes/header.jsp" />
	</div>
	
	<section class="container">
		<div class="mcont" style="text-align: center;">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			아나바다닷컴 파이팅 ~.~ <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<form action="/resume/my_resume" method="get">
      		<input type="submit" value="내가 지원한 알바 목록">
   		</form>
		<form action="/note/product_note" method="get">
      		<input type="submit" value="쪽지한 사람들 목록 보러 가기">
   		</form>
		<form action="/job/job_insert" method="get">
      		<input type="submit" value="알바 구인 공고 쓰러가기">
   		</form>
   		<form action="/job/job_list" method="get">
      		<input type="submit" value="알바 구인 게시판">
   		</form>
   		<form action="/job/my_job" method="get">
      		<button type="submit" id="show_writeList">내 알바글 목록으로 돌아가기</button>
   		</form>
   		<form action="/note/note_list" method="get">
      		<button type="submit">내 쪽지함</button>
   		</form>
   		id=${id }<br>
   		<a href="/member/login">로그인</a></li>
   		
		
	</section>
	
	<div id="footer">
        <jsp:include page="../includes/footer.jsp" />
    </div>
</body>


</html>