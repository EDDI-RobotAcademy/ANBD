<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/";
		});

		$("#submit").on("click", function() {
			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#pass").focus();
				return false;
			}

		});
	});
</script>

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
			<div class="sidemenu">
				<p class="hello"><b>${member.nick}</b> 님</p>
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<li class="side-li">내 정보 관리</li>
					<li class="side-li">나의 걸음수</li>
				</ul>
			</div>
		
			<div class="minicon">
				<form action="/member/memberUpdate" method="post">
					<div>
						<label for="id">아이디</label>
						<input type="text" id="id" name="id" value="${member.id}" readonly="readonly" />
					</div>
					
					<div>
						<label for="pass">패스워드</label>
						<input type="password" id="pass" name="pass" />
					</div>
					
					<div>
						<label for="name">이름</label>
						<input type="text" id="name" name="name" value="${member.name}" readonly="readonly" />
					</div>
					
					<div>
						<label for="nick">닉네임</label>
						<input type="text" id="nick" name="nick" value="${member.nick}" />
					</div>
					
					<div>
						<label for="tel">휴대폰 번호</label>
						<input type="text" id="tel" name="tel" value="${member.tel}" />
					</div>
					
					<div>
						<label for="email">이메일</label>
						<input type="text" id="email" name="email" value="${member.email}" />
					</div>
					
					<div>
						<label for="loca">지역</label>
						<input type="text" id="loca" name="loca" value="${member.loca}" />
					</div>
					
					<div>
						<button type="submit" id="submit">수정</button>
						<button type="button">취소</button>
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