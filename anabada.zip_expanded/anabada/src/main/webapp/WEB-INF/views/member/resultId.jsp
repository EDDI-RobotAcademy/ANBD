<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
	<div class="regcenter">
		<div style="margin-top: 140px; border-bottom: 1px solid #d8d9df; text-align: right;">
			<span class="find-chk">
				<label for="findId">
					<b>아이디 찾기 결과</b>
				</label>
			</span>
		</div>
		
		<div class="find-result">
	        <c:choose>                                                                          
	            <c:when test="${empty vo}">                                                 
	                <p>일치하는 정보가 없습니다.</p>                                        
	            </c:when>                                                                         
	            <c:otherwise>                                                                     
	                <p>${vo.id}</p>                                              
	            </c:otherwise>
	        </c:choose>    
        </div>
        
		<div style="display: flex;">
			<button class="find-cancle-but" type="button" onclick="location.href='/member/findPass'">비밀번호 재발급</button>
			<button class="find-agree-but" type="button" onclick="location.href='/member/login'">로그인</button>
		</div>
			
		<div class="reg-corp" style="margin: 20px auto 20px auto;">
			© ANABADA Corp.
		</div>                                                              
	</div>   
</body>
</html>