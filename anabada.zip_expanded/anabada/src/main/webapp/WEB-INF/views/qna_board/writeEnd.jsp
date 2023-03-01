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
			<div class="modi-end">
				<div class="modi-end-item">
					<h2>문의하신 내용이 정상적으로 접수되었습니다.</h2>
					<span style="font-size: 15px; line-height: 300%;">
						문의에 대한 답변은 내 문의 내역에서 확인 가능합니다.
					</span>
				</div>
			</div>	
					
			<div style="text-align: center;">
				<button type="button" class="qna-home-but" onclick="location.href='/help_board/list'">고객센터 홈</button>
				<button type="button" class="qna-my-but" onclick="location.href='/qna_board/list'">내 문의내역</button>
			</div>
			
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>