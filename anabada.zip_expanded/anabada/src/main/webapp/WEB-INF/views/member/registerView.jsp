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
	
<script type="text/javascript">
	$(document).ready(function() {
		
		var idOk = false;
		var pw1Ok = false;
		var pw2Ok = false;
		var nameOk = false;
		var nickOk = false;
		var telOk = false;
		var emailOk = false;
		
		var getIdChk = RegExp(/^[a-z0-9]{5,20}$/);
		var getPass = RegExp(/^[a-zA-Z0-9]{5,20}$/);
		var getName = RegExp(/^[가-힣]+$/);
		var getNick = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getTel = RegExp(/^[0-9]{10,11}$/);

		// 아이디 유효성 체크
		$(function() {
			// 아이디가 빈 칸일 때
			$('#id').keyup(function() {
				if ($(this).val() == "") {
					$("#idChk").attr("style", "color:#FF0000; padding-left: 5px;");
		            $("#idChk").text("아이디를 입력해 주세요.");
		            idOk = false;
		            
				} else if (!getIdChk.test($("#id").val())) {
					$("#idChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#idChk").text("아이디는 5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
					idOk = false;
				
				// 중복 체크
				} else {
					$.ajax({
			 			url : "/member/idChk",
			 			type : "post",
			 			dataType : "json",
			 			data : {"id" : $("#id").val()},
			 			success : function(data){
			 				if (data == 1) {
			 					$("#idChk").attr("style", "color:#FF0000; padding-left: 5px;");
			 		            $("#idChk").text("사용 중인 아이디입니다.");
								idOk = false;
			
			 				} else if (data == 0) {
								document.getElementById("idChk").style.display="none";
								idOk = true;
			 				}
			 			}
					})
				}
			})
		});
		
		
		//비밀번호 유효성 체크
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
					$("#passDoubleChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#passDoubleChk").text("비밀번호를 입력해 주세요.");
					pw2Ok = false;
				}
				
				if ($("#pass").val() != $("#pass2").val()) {
					$("#passDoubleChk").attr("style", "color:#FF0000; padding-left: 5px;");
			        $("#passDoubleChk").text("비밀번호가 일치하지 않습니다.");
			        pw2Ok = false;
					
				} else {
					document.getElementById("passDoubleChk").style.display="none";
					pw2Ok = true;
				}
			})
			
		});
		
		
		// 이름 유효성 검사
		$(function() {
			$("#name").keyup(function() {
				if ($("#name").val() == "") {
					$("#nameChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nameChk").text("이름을 입력해 주세요.");
					nameOk = false;
					
				} else if (!getName.test($("#name").val())) {
					$("#nameChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nameChk").text("이름은 한글만 사용 가능합니다.");
					nameOk = false;
					
				} else {
					document.getElementById("nameChk").style.display="none";
					nameOk = true;
				}
			})
		});
		
		
		// 닉네임 유효성 검사
		$(function() {
			$("#nick").keyup(function() {
				if ($("#nick").val() == "") {
					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nickChk").text("닉네임을 입력해 주세요.");
					nickOk = false;
					
				} else if (!getNick.test($("#nick").val())) {
					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#nickChk").text("닉네임은 영어 대 소문자, 한글, 숫자만 사용 가능합니다.");
					nickOk = false;
				
				// 닉네임 중복 체크
				} else {
					$.ajax({
			 			url : "/member/nickChk",
			 			type : "post",
			 			dataType : "json",
			 			data : {"nick" : $("#nick").val()},
			 			success : function(data){
			 				if (data == 1) {
			 					$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
			 		            $("#nickChk").text("사용 중인 닉네임입니다.");
								nickOk = false;
	
			 				} else if (data == 0) {
			 					document.getElementById("nickChk").style.display="none";
			 					nickOk = true;
			 				}
			 			}
					})
				}
			})
		});
		
		
		// 휴대폰 번호 유효성 검사
		$(function() {
			$("#tel").keyup(function() {
				if ($("#tel").val() == "") {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("휴대폰 번호를 입력해 주세요.");
					telOk = false;
					
				} else if (!getTel.test($("#tel").val())) {
					$("#telChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#telChk").text("10~11자의 숫자만 입력해 주세요.");
					telOk = false;
					
				} else {
					document.getElementById("telChk").style.display="none";
					telOk = true;
				}
			})
		});
		
		
		// 이메일 유효성 검사
		$(function() {
			$("#email").keyup(function() {
				if ($("#email").val() == "") {
					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#mailChk").text("이메일을 입력해 주세요.");
					emailOk = false;
					
				} else if (!getMail.test($("#email").val())) {
					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
					$("#mailChk").text("이메일 주소를 다시 확인해 주세요.");
					emailOk = false;
						
				} else {
					$.ajax({
			 			url : "/member/emailChk",
			 			type : "post",
			 			dataType : "json",
			 			data : {"email" : $("#email").val()},
			 			success : function(data){
			 				if (data == 1) {
			 					$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
			 		            $("#mailChk").text("사용할 수 없는 이메일입니다.");
								emailOk = false;
	
			 				} else if (data == 0) {
			 					document.getElementById("mailChk").style.display="none";
								emailOk = true;
			 				}
			 			}
					})
				}
			})
		});
		
		var formObj = $("form[name='regiForm']");
		
		$("#submit").on("click",function() {
			if (idOk == false) {
				$("#id").focus();
				return false;
			
			} else if ($("#pass").val() != $("#pass2").val()) {
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
			
			} else if (nameOk == false) {
				$("#name").focus();
				return false;
			
			} else if (nickOk == false) {
				$("#nick").focus();
				return false;

			} else if (telOk == false) {
				$("#tel").focus();
				return false;

			} else if (emailOk == false) {
				$("#email").focus();
				return false;
			
			} else {
				formObj.attr("action", "/member/register");
				formObj.submit();
				
			}
		});
		
	});
</script>

<style>
button:disabled, button[disabled] {
  background: #D5D5D5;
  cursor: Default;
}
</style>
</head>

<body style="background-color: #F9F9F9;">
	<section class="regicon">
		<form name="regiForm" method="post" action="/member/register">
			<div class="regcenter">
				<div class="reg-logo">
					<a href="/"><img src="../resources/images/reglogo.png"></a>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="id">아이디</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="id" name="id" />
					</div>
					<div>
						<font id="idChk" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass">비밀번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass" name="pass" />
					</div>
					<div>
						<font id="passChk" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="pass2">비밀번호 재확인</label><br />
					<div class="reg-box">
						<input class="reg-in" type="password" id="pass2" name="pass2" />
					</div>
					<div>
						<font id="passDoubleChk" size="2"></font>
					</div>
				</div>
			
				<div class="mt-22">
					<label class="reg-font" for="name">이름</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="name" name="name" />
					</div>
					<div>
						<font id="nameChk" size="2"></font>
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="nick">닉네임</label><br />
					<div class="reg-box">
						<input class="reg-in" type="text" id="nick" name="nick" />
					</div>
					<div>
						<font id="nickChk" size="2"></font>
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="tel">휴대폰 번호</label><br />
					<div class="reg-box">
						<input class="reg-in" type="tel" id="tel" name="tel" placeholder="01000000000" />
					</div>
					<div>
						<font id="telChk" size="2"></font>
					</div>
				</div>
				
				<div class="mt-22">
					<label class="reg-font" for="email">이메일</label><br />
					<div class="reg-box">
						<input class="reg-in" type="email" id="email" name="email" placeholder="example@gmail.com" />
					</div>
					<div>
						<font id="mailChk" size="2"></font>
					</div>
				</div>
				
				<div>
					<button class="reg-but" type="submit" id="submit">회원가입</button>
				</div>
				
				<div class="reg-corp">
					Copyright <b>ANABADA Corp.</b> All Rights Reserved.
				</div>
			</div>
		</form>
	</section>
</body>
</html>