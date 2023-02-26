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
 		var emailOk = false;
 		var checkOk = false;
 		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		$("#mailChange").on("click", function(){
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
	 		 		        checkOk = true;
			 			}
			 		}
				})
			}
		});
		
		$("#submit").on("click", function() {
			if (emailOk && checkOk == true) {
				window.opener.document.getElementById("email").value = document.getElementById("email").value;
				window.close();
				
			} else {
				$("#mailChk").attr("style", "color:#FF0000; padding-left: 5px;");
 		        $("#mailChk").text("중복 여부를 확인해 주세요.");
				return false;
			}
		});
	});
</script>

<body>
	<input id="id" type="hidden" value="${member.id}" >
	<div style=" margin: 0 auto; padding: 15px; box-sizing: border-box;">
		<label class="membermodify-new" for="email">이메일 변경</label>
		<input class="modi-box-new" type="text" id="email" name="email" value="${member.email}" placeholder="example@gmail.com" autofocus />
		<button type="button" id="mailChange" class="nickC">확인</button>
	</div>
	
	<div style="text-align: center;">
		<font id="mailChk" size="2"></font>
		<button type="submit" id="submit" class="modi_btn-new">변경하기</button>
	</div>
</body>
</html>