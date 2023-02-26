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
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
// 		$(".cancle").on("click", function() {
// 			location.href = "/";
// 		});
		
 		// 유효성 검사
		var telOk = false;
		var getTel = RegExp(/^[0-9]{10,11}$/);

		// submit 버튼
		var formObj = $("form[name='updateForm']");

		$("#submit").on("click", function() {
			// 휴대폰 유효성 검사
			if ($("#tel").val() == "") {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("휴대폰 번호를 입력해 주세요.");
					$("#tel").focus();
					telOk = false;
					
				} else if (!getTel.test($("#tel").val())) {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("10~11자의 숫자만 입력해 주세요.");
					$("#tel").focus();
					telOk = false;
					
				} else {
					document.getElementById("telChk").style.display="none";
					telOk = true;
			}
			
			if (telOk == true) {
				formObj.attr("action", "/member/memberUpdate");
				formObj.submit();
				
			} else {		
				return false;
			}
		});
	});
	
	function nickChange() {
		// 새창 만들기
		window.open("nickChangeForm", "nickwin", "width = 400, height = 230");
	}
	
	function emailChange() {
		// 새창 만들기
		window.open("emailChangeForm", "emailwin", "width = 400, height = 230");
	}
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
	
	<c:if test="${member.id eq null }">
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="/member/login"
		</script>
	</c:if>
	
	<div>
		<section class="container">
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/includes/myPageHeader.jsp" />
		
			<div class="minicon">
				<div class="mtitle">
					회원 정보 수정
				</div>
			
				<form name="updateForm" method="post" action="/member/memberUpdate" >
					<div style="margin-top: 20px; text-align: center;">	
						<div>
							<label class="membermodify" for="id">아이디</label>
							<input class="modi-box-readonly" type="text" id="id" name="id" value="${member.id}" readonly />
						</div>
						
						<div>
							<c:if test="${id.contains('ka_') == false }">
							<label class="membermodify" for="name">이름</label>
							<input class="modi-box-readonly" type="text" id="name" name="name" value="${member.name}" readonly />
							</c:if>
							<c:if test="${id.contains('ka_')}">
							<label class="membermodify" for="name">이름</label>
							<input class="modi-box" type="text" id="name" name="name" value="${member.name}"/>
							</c:if>
						</div>
						
						<div>
							<label class="membermodify" for="nick">닉네임</label>
							<input class="modi-box-readonly-mini" type="text" id="nick" name="nick" value="${member.nick}" readonly />
							<button type="button" onclick="nickChange()" class="nickChk">변경</button>
						</div>
						
						<div>
							<label class="membermodify" for="email">이메일</label>
							<input class="modi-box-readonly-mini" type="text" id="email" name="email" value="${member.email}" placeholder="example@gmail.com" readonly />
							<button type="button" onclick="emailChange()" class="nickChk">변경</button>
						</div>
						
						<div>
							<label class="membermodify" for="tel">휴대폰 번호</label>
							<input class="modi-box" type="text" id="tel" name="tel" value="${member.tel}" placeholder="01000000000"/>
						</div>
					</div>
					
					<div style="text-align: right; font-size: 13px; color: #555555;">
						<a href="/member/memberDeleteView">회원탈퇴</a>
					</div>
					
					<div>
						<div style="text-align: center;">
							<font id="nickChk" size="2"></font>
							<font id="telChk" size="2"></font>
							<font id="mailChk" size="2"></font>
						</div>
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