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
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function(){
			location.href = "/member/myPage";
		})
		
		$("#submit").on("click", function(){
			if($("#pass").val() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}	
		});
	
	})
</script>
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
			<!-- 메뉴 -->
			<div class="sidemenu2">
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<li class="side-li"><a href="/member/memberUpdateView">내 정보 관리</a></li>
					<li class="side-li"><a href="/member/passUpdateView">비밀번호 변경</a></li>
					<br/>
					<li class="side-li">나의 걸음수</li>
					<br/>
					<li class="side-li"><a href="/member/memberDeleteView">회원 탈퇴</a></li>
				</ul>
			</div>
		
			<div class="minicon">
				<div class="mtitle">
					회원 탈퇴
				</div>
			
				<form method="post" action="/member/memberDelete" >
					<div style="margin-top: 40px; text-align: center;">	
						<div>
							<label class="memberdelete" for="id">아이디</label>
							<input class="del-box-readonly" type="text" id="id" name="id" value="${member.id}" readonly />
						</div>
						
						<div>
							<label class="memberdelete" for="pass">비밀번호</label>
							<input class="del-box" type="password" id="pass" name="pass" />
						</div>
					</div>
					
					<div style="text-align: center;">
						<c:if test="${msg == false}">
							<font size="2" color="#FF0000">비밀번호가 맞지 않습니다.</font>
						</c:if>
					</div>
					
					<div style="text-align: center; margin-top: 30px;">
						<button class="cancle delete-cancel-btn" type="button">취소</button>&nbsp;
						<button type="submit" id="submit" class="delete-btn">탈퇴</button>
					</div>	
				</form>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>