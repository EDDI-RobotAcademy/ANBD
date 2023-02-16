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
</head>

<body>
	<!-- header 영역 -->
	<div class="container">

		
		<div class="cate">
			<div>
			<%-- 	<ul class="cate-ul">
					<li class="cate-li"><img src="<c:url value='/images/menu.png'/>"></li>
				</ul> --%>
			</div>
			
			<div>
				<ul class="cate-ul">
					<li class="cate-li"><a href="/product/list">중고게시판</a></li>
					<li class="cate-li"><a href="/job/job_list">알바게시판</a></li>
					<li class="cate-li"><a href="/a_board/list">동네생활</a></li>
					<li class="cate-li"><a href="/event/list">이벤트</a></li>
				</ul>
				
			</div>
		</div>
		<hr style="color: #B9B9B9; margin: 0px; " >
	</div>
	
</body>
</html>