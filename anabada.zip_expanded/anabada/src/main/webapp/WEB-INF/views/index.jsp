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
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<div>
		<jsp:include page="includes/nav.jsp" />
	</div>
	
	<div>
		<jsp:include page="includes/header.jsp" />
	</div>
	
	<div style="min-width: 1000px; width: 100%; border-bottom: 1px solid #f1f2f5;"></div>
	
	<section class="container">
		<div class="mcont" style="text-align: center;">
			<div style="width: 960px; height: 250px; background-color: #cccccc;">
				배너 부분
				<c:if test="${id == 'admin' }">
					<button type="button" onclick="location.href='/bannerForm'">폼 작성</button>
				</c:if>
			</div>
			
			<br>
			
			<div style="width: 960px; min-height: 500px; height: 100%; background-color: #eeeeee;">
				상품 리스트
			</div>
		</div>
	</section>
	
	<div>
		<jsp:include page="includes/footer.jsp" />
	</div>
</body>
</html>