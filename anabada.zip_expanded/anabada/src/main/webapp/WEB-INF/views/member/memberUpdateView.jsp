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
	$(document).ready(function() {
		// 취소
// 		$(".cancle").on("click", function() {
// 			location.href = "/";
// 		});
		
 		// 유효성 검사
 		var nickOk = false;
		var telOk = false;
		var emailOk = false;
		
		var getNick = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getTel = RegExp(/^[0-9]{10,11}$/);
		
		// 닉네임 유효성 검사
// 		document.getElementById("nicChk").onclick = function() {
			
// 			if ($("#nick").val() == "") {
// 				$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
// 				$("#nickChk").text("닉네임을 입력해 주세요.");
// 				nickOk = false;
				
// 			} else if (!getNick.test($("#nick").val())) {
// 				$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
// 				$("#nickChk").text("닉네임은 영어 대 소문자, 한글, 숫자만 사용 가능합니다.");
// 				nickOk = false;
			
// 			// 닉네임 중복 체크
// 			} else {
// 				$.ajax({
// 		 			url : "/member/nickUpdateChk",
// 		 			type : "post",
// 		 			dataType : "json",
// 		 			data : {"nick" : $("#nick").val(),
// 		 					"id" : $("#id").val()
// 		 				},
// 		 			success : function(data){
// 		 				if (data == 1) {
// 		 					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
// 		 		            $("#nickChk").text("사용 중인 닉네임입니다.");
// 							nickOk = false;

// 		 				} else if (data == 0) {
// 		 					$("#nickChk").attr("style", "color:#0C6BBC; padding-left: 5px;");
// 		 		            $("#nickChk").text("사용 가능한 닉네임입니다.");
// 		 					nickOk = true;
// 		 				}
// 		 			}
// 				})
// 			}
// 		}
		
		

		// submit 버튼
		var formObj = $("form[name='updateForm']");
 		
		$("#submit").on("click", function() {
			// 닉네임 유효성 검사
			if ($("#nick").val() == "") {
					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nickChk").text("닉네임을 입력해 주세요.");
					$("#nick").focus();
					nickOk = false;
					
				} else if (!getNick.test($("#nick").val())) {
					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nickChk").text("닉네임은 영어 대 소문자, 한글, 숫자만 사용 가능합니다.");
					$("#nick").focus();
					nickOk = false;

				// 닉네임 중복 체크
				} else {
					$.ajax({
			 			url : "/member/nickUpdateChk",
			 			type : "post",
			 			dataType : "json",
			 			data : {"nick" : $("#nick").val(),
			 					"id" : $("#id").val()
			 				},
			 			success : function(data){
			 				if (data == 1) {
			 					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
			 		            $("#nickChk").text("사용 중인 닉네임입니다.");
			 		            $("#nick").focus();
								nickOk = false;
	
			 				} else if (data == 0) {
	 		 					$("#nickChk").attr("style", "color:#0C6BBC; padding-left: 5px;");
	 		 		            $("#nickChk").text("사용 가능한 닉네임입니다.");
			 					nickOk = true;
			 				}
			 			}
					})
				}
			
			// 휴대폰 유효성 검사
			if ($("#tel").val() == "") {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("휴대폰 번호를 입력해 주세요.");
					$("#tel").focus();
					telOk = false;
					
				} else if (!getTel.test($("#tel").val())) {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("숫자만 입력해 주세요.");
					$("#tel").focus();
					telOk = false;
					
				} else {
					document.getElementById("telChk").style.display="none";
					telOk = true;
			}

			// 이메일 유효성 검사
			if ($("#email").val() == "") {
					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#mailChk").text("이메일을 입력해 주세요.");
					$("#mail").focus();
					emailOk = false;
					
				} else if (!getMail.test($("#email").val())) {
					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#mailChk").text("이메일 주소를 다시 확인해 주세요.");
					$("#mail").focus();
					emailOk = false;
						
				} else {
					$.ajax({
			 			url : "/member/emailUpdateChk",
			 			type : "post",
			 			dataType : "json",
			 			data : {"email" : $("#email").val(),
			 					"id" : $("#id").val()
			 				},
			 			success : function(data){
			 				if (data == 1) {
			 					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
			 		            $("#mailChk").text("사용 중인 이메일입니다.");
			 		            $("#email").focus();
								emailOk = false;
	
			 				} else if (data == 0) {
	 		 					$("#mailChk").attr("style", "color:#0C6BBC; padding-left: 5px;");
	 		 		            $("#mailChk").text("사용 가능한 이메일입니다.");
	 		 		          	emailOk = true;
			 				}
			 			}
					})
				}

			
			if (nickOk && telOk && emailOk == true) {
				formObj.attr("action", "/member/memberUpdate");
				formObj.submit();
				
			} else {		
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
							<input class="modi-box" type="text" id="nick" name="nick" value="${member.nick}" />
<!-- 							<button type="button" id="nicChk">중복 확인</button> -->
						</div>
						
						<div>
							<label class="membermodify" for="tel">휴대폰 번호</label>
							<input class="modi-box" type="text" id="tel" name="tel" value="${member.tel}" />
						</div>
						
						<div>
							<label class="membermodify" for="email">이메일</label>
							<input class="modi-box" type="text" id="email" name="email" value="${member.email}" />
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