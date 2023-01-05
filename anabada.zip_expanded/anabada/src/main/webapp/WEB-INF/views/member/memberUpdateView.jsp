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
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/";
		});

// 		$("#submit").on("click", function() {
// 			if ($("#pass").val() == "") {
// 				alert("비밀번호를 입력해 주세요.");
// 				$("#pass").focus();
// 				return false;
// 			}
// 		});
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
			<div class="sidemenu2">
				<p class="hello"><b>${member.nick}</b> 님</p>
				<p class="side-t">회원정보</p>
				<ul class="side-ul">
					<li class="side-li">내 정보 관리</li>
					<li class="side-li">나의 걸음수</li>
				</ul>
			</div>
		
			<div class="minicon">
				<div class="mtitle">
					회원 정보 수정
				</div>
			
				<form action="/member/memberUpdate" method="post">
					<input type="hidden" id="id" name="id" value="${member.id}"/>
					<input type="hidden" id="name" name="name" value="${member.name}"/>
				
					<div style="margin-top: 20px">	
						<div>
							<label class="membermodify" for="id">아이디</label>
							<div class="mmodify" id="id"><c:out value="${member.id}"/></div>
						</div>
						
						<div>
							<label class="membermodify" for="pass">비밀번호</label>
							<input class="modi-box" type="password" id="pass" name="pass" />
						</div>
						
						<div>
							<label class="membermodify" for="name">이름</label>
							<div class="mmodify" id="name"><c:out value="${member.name}" /></div>
						</div>
						
						<div>
							<label class="membermodify" for="nick">닉네임</label>
							<input class="modi-box" type="text" id="nick" name="nick" value="${member.nick}" />
						</div>
						
						<div>
							<label class="membermodify" for="tel">휴대폰 번호</label>
							<input class="modi-box" type="text" id="tel" name="tel" value="${member.tel}" />
						</div>
						
						<div>
							<label class="membermodify" for="email">이메일</label>
							<input class="modi-box" type="text" id="email" name="email" value="${member.email}" />
						</div>
						
						<div>
							<label class="membermodify" for="loca">지역</label>
								<select class="modi-select" id="loca" name="loca">
									<option value="" selected hidden>${member.loca}</option>
									<option value="강원">강원</option>
									<option value="경기">경기</option>
									<option value="경남">경남</option>
									<option value="경북">경북</option>
									<option value="부산">부산</option>
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="전남">전남</option>
									<option value="전북">전북</option>
									<option value="제주">제주</option>
									<option value="충남">충남</option>
									<option value="충북">충북</option>
								</select>
						</div>
					</div>
					
					<div>
						<button type="submit" id="submit" class="modi_btn">수정</button>
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