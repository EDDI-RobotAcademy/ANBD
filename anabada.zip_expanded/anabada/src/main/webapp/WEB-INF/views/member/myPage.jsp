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
	
	<c:if test="${member.id eq null }">
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="/member/login"
		</script>
	</c:if>
	
	<div>
		<section class="container">
			<div class="my-page" style="margin-top: 30px;">
				<div class="menu-title">
					<div style="font-size: 30px; font-weight: 400;"><img src="<c:url value='/images/my_hello.png'/>" style="width: 25px; height: 25px; margin-right: 8px;">안녕하세요, <b>${member.nick}</b>님!</div>
				</div>	
			</div>
			
			<div class="my-page" style="margin-top: 40px;">
				<div class="menu-icon">
					<a href="/member/memberUpdateView"><img src="<c:url value='/images/my_user.png'/>" style="width: 110px; height: 110px;">
						<p style="margin-top: 6px; font-weight: 500; font-size: 18px;">나의 정보</p>
					</a>
				</div>
				
				<div class="menu-icon">
					<a href="/userProduct/myStore"><img src="<c:url value='/images/my_shop.png'/>" style="width: 110px; height: 110px;">
						<p style="margin-top: 6px; font-weight: 500; font-size: 18px;">상점</p>
					</a>
				</div>
				
				<div style="clear: both;"></div>
			</div>
			
			<div class="my-page" style="margin-bottom: 60px;">	
				<div class="menu-icon">
					<a href="/a_board/myWriteList"><img src="<c:url value='/images/my_post_2.png'/>" style="width: 110px; height: 110px;">
						<p style="margin-top: 6px; font-weight: 500; font-size: 18px;">게시글</p>
					</a>
				</div>
				
				<div class="menu-icon">
					<a href="/job/my_job"><img src="<c:url value='/images/my_alba.png'/>" style="width: 110px; height: 110px;">
						<p style="margin-top: 6px; font-weight: 500; font-size: 18px;">아르바이트</p>
					</a>
				</div>
				
				<div style="clear: both;"></div>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>