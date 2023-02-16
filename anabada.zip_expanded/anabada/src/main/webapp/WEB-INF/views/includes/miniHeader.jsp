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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<!-- header 영역 -->
	<div class="container">
		<div class="miniheader">
			<div class="logo-miniheader">
				<a href="/"><img src="<c:url value='/images/minilogo.png'/>" style="width: 200px; height: 60px;"></a>
			</div>
			
			<div class="menu-miniheader">
				<ul class="cate-ul">
					<li class="cate-li"><a href="/product/list">중고게시판</a></li>
					<li class="cate-li"><a href="/job/job_list">알바게시판</a></li>
					<li class="cate-li"><a href="/a_board/list">동네생활</a></li>
					<li class="cate-li"><a href="/event/list">이벤트</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div style="min-width: 1000px; width: 100%; border-top: 1px solid #f1f2f5; box-shadow: 0 1px 3px rgba(0,0,0,0.1); margin-bottom: 25px;">
	</div>
</body>
</html>