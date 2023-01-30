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
		
// 		// 닉네임 유효성 검사
// 		function nickchk() {
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
// 		 					document.getElementById("nickChk").style.display="none";
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
			 					document.getElementById("nickChk").style.display="none";
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
					document.getElementById("mailChk").style.display="none";
					emailOk = true;
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
					회원 정보 수정
				</div>
			
				<form name="updateForm" method="post" action="/member/memberUpdate" >
					<div style="margin-top: 20px;">	
						<div>
							<label class="membermodify" for="id">아이디</label>
							<input class="modi-box-readonly" type="text" id="id" name="id" value="${member.id}" readonly />
						</div>
						
						<div>
							<label class="membermodify" for="name">이름</label>
							<input class="modi-box-readonly" type="text" id="name" name="name" value="${member.name}" readonly />
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
								<select class="modi-select" id="loca" name="loca" onchange="changeValue(this)">
									<option value="${member.loca}" selected hidden>${member.loca}</option>
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