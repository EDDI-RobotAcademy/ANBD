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
 		var nickOk = false;	
 		var checkOk = false;	
		var getNick = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
 		
		$("#nickChange").on("click", function(){
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
			 				checkOk = true;
			 			}
			 		}
				})
			}
		});
		
		$("#submit").on("click", function() {
			if (nickOk && checkOk == true) {
				window.opener.document.getElementById("nick").value = document.getElementById("nick").value;
				window.close();
				
			} else {
				$("#nickChk").attr("style", "color:#FF0000; padding-left: 5px;");
 		        $("#nickChk").text("중복 여부를 확인해 주세요.");
				return false;
			}
		});
	});
</script>

<body>
	<input id="id" type="hidden" value="${member.id}" >
	<div style="padding: 15px; box-sizing: border-box;">
		<label class="membermodify-new" for="nick">닉네임 변경</label>
		<input class="modi-box-new" type="text" id="nick" name="nick" value="${member.nick}" autofocus />
		<button type="button" id="nickChange" class="nickC">확인</button>
	</div>
	
	<div style="text-align: center;">
		<font id="nickChk" size="2"></font>
		<button type="submit" id="submit" class="modi_btn-new">변경하기</button>
	</div>
</body>
</html>