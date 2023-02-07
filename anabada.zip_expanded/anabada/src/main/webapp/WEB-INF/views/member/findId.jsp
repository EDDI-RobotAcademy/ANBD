<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
<link rel="manifest" href="<c:url value='/images/manifest.json'/>">
<meta name="theme-color" content="#ffffff">
<meta charset="UTF-8">
<title>아나바다</title>
<link href="../resources/css/r_styles.css" rel="stylesheet" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body style="background-color: #F9F9F9;">
	<form name='findId' method="post" action="/member/resultId">
		<div class="regcenter">
			<div style="margin-top: 140px; border-bottom: 1px solid #d8d9df; text-align: right;">
				<span class="find-chk">
					<label for="findId">
						<b>아이디 찾기</b>
					</label>
				</span>
			</div>
			
			<div style="text-align: right;">
				<span class="find-notice">
					<label for="findId">
						* 가입시 입력하신 이름과 이메일을 입력해 주세요.
					</label>
				</span>
			</div>
	
			<div class="login-box">
				<input class="login-in" type="text" id="name" name="name" placeholder="이름">
			</div>
			
			<div class="login-box2">
				<input class="login-in2" type="text" id="email" name="email" placeholder="이메일">
			</div>
			
			<div>
				<button class="login-but" type="submit">아이디 찾기</button>
			</div>
			
			<div class="reg-corp" style="margin: 20px auto 20px auto;">
				© ANABADA Corp.
			</div>
		</div>
	</form>
</body>
</html>