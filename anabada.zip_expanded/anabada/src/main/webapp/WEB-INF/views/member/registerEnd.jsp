<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
<link rel="manifest" href="<c:url value='/images/manifest.json'/>">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../resources/css/r_styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body style="background-color: #F9F9F9;">
	<section class="regicon">
		<div class="regcenter">
			<div class="reg-logo">
				<a href="/"><img src="../resources/images/reglogo.png"></a>
			</div>
			
			<div class="reg-welcome">
				<p class="reg-welcome-item">
					<span style="font-size: 55px; font-weight: 200;">환영합니다!</span>
					<br>
					<br>
					<span style="font-size: 15px;">
						<b>${member.nick}</b>님, 가입해 주셔서 감사합니다.<br>
					</span>
				</p>
			</div>
						
			<div>
				<a href="/" class="reg-but">메인으로</a>
			</div>
				
			<div class="reg-corp">
				© ANABADA Corp.
			</div>
		</div>
	</section>
</body>
</html>