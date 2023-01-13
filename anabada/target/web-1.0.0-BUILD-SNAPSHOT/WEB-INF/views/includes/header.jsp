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
		<div class="header">
			<div class="logo-header">
				<a href="/"><img src="<c:url value='/images/logo.png'/>"></a>
			</div>
			
			<div class="sbox">
				<div class="search-box">
					<input class="search-in" type="text"><button class="search-but"><img src="<c:url value='/images/search.png'/>"></button>
				</div>
			</div>
		</div>
		
		<div class="cate">
			<div>
				<ul class="cate-ul">
					<li class="cate-li"><img src="<c:url value='/images/menu.png'/>"></li>
				</ul>
			</div>
			
			<div>
				<ul class="cate-ul">
					<li class="cate-li">아르바이트</li>
					<li class="cate-li"><a href="/a_board/list">동네생활</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>