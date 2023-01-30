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
	
	<div style="border-top: 1px solid #f1f2f5;">
		<section class="container">
			<div class="modi-end">
				<div class="modi-end-item">
					<h2 style="line-height: 300%;">회원 탈퇴가 완료되었습니다.</h2>
					<span style="font-size: 15px; line-height: 200%;">
						지금까지 아나바다를 이용해 주셔서 감사합니다.
					</span>
				</div>
			</div>	
					
			<div style="text-align: center;">
				<button type="button" class="qna-home-but" onclick="location.href='/'">확인</button>
			</div>
			
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>