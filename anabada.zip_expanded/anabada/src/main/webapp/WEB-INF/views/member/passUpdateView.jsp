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
		
		var pw1Ok = false;
		var pw2Ok = false;
		
		var getPass = RegExp(/^[a-zA-Z0-9]{5,20}$/);
		
		$(function() {
			$("#pass").keyup(function() {
				if ($("#pass").val() == "") {
					$("#passChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#passChk").text("비밀번호를 입력해 주세요.");
					pw1Ok = false;
				
				} else if (!getPass.test($("#pass").val())) {
					$("#passChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#passChk").text("비밀번호는 5~20자의 영문 대 소문자, 숫자만 사용 가능합니다.");
					pw1Ok = false;
					
				} else {
					document.getElementById("passChk").style.display="none";
					pw1Ok = true;
				}

 			})
			
 			
			$("#pass2").keyup(function() {
				if ($("#pass2").val() == "") {
					$("#passChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#passChk").text("비밀번호를 입력해 주세요.");
					pw2Ok = false;
				}
				
				if ($("#pass").val() != $("#pass2").val()) {
					$("#passChk").attr("style", "color:#FF0000; padding-left: 5px;");
			        $("#passChk").text("비밀번호가 일치하지 않습니다.");
			        pw2Ok = false;
					
				} else {
					document.getElementById("passChk").style.display="none";
					pw2Ok = true;
				}
			})
			
		});
		
		var formObj = $("form[name='passForm']");
		
		$("#submit").on("click", function(){
			if ($("#pass").val() != $("#pass2").val()) {
				$("#passChk").attr("style", "color:#FF0000; padding-left: 5px;");
				$("#passChk").text("비밀번호를 다시 확인해 주세요.");
				$("#pass").focus();
				return false;
			
			} else if (pw1Ok == false) {
				$("#pass").focus();
				return false;
			
			} else if (pw2Ok == false) {
				$("#pass2").focus();
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
					비밀번호 변경
				</div>
			
				<form name="passForm" method="post" action="/member/passUpdate" >
				<input type="hidden" id="id" name="id" value="${member.id}"/>
				
					<div style="margin-top: 40px; text-align: center;">	
						<div>
							<label class="membermodify" for="newpass">새 비밀번호</label>
							<input class="modi-box" type="password" id="pass" name="pass" />
						</div>
						
						<div>
							<label class="membermodify" for="newpass2">새 비밀번호 확인</label>
							<input class="modi-box" type="password" id="pass2" name="pass2" />
						</div>
					</div>
					
					<div style="text-align: center;">
						<font id="passChk" size="2"></font>
					</div>
					
					<div style="text-align: center; margin-top: 30px;">
						<button class="cancle delete-cancel-btn" type="button">취소</button>&nbsp;
						<button type="submit" id="submit" class="delete-btn">변경</button>
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