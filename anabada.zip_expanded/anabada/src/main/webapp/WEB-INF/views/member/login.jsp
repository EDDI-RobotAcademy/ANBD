<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "member/registerAgree";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})
		
		var formObj = $("form[name='homeForm]");
		
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				$("#Chk").attr("style", "color:#FF0000;");
	            $("#Chk").text("아이디와 비밀번호를 확인해 주세요.");
	            $("#id").focus();
	            return false;
			
			} else if ($("#pass").val() == "") {
				$("#Chk").attr("style", "color:#FF0000;");
	            $("#Chk").text("아이디와 비밀번호를 확인해 주세요.");
	            $("#pass").focus();
	            return false;
			}
			
			formObj.attr("action", "/member/login");
			formObj.submit();
		})
	});
</script>
</head>

<body>
	<form name='homeForm' method="post">
		<div>
			<label for="id"></label>
			<input type="text" id="id" name="id">
		</div>
	
		<div>
			<label for="userPass"></label>
			<input type="password" id="pass" name="pass">
		</div>
		
		<div>
			<font id="Chk" size="2">
				<c:if test="${msg == false}">
					<font style="color:#FF0000;">아이디와 비밀번호를 확인해 주세요.</font>
				</c:if>
			</font>
		</div>
	
		<div>
			<button type="submit" id="submit">로그인</button>
		</div>
		
		<div>
			<a href="./findId">아이디 찾기</a>
			<a href="./findPass">비밀번호 찾기</a>
			<a href="./registerAgree">회원가입</a>
		</div>
		
	</form>
</body>
</html>