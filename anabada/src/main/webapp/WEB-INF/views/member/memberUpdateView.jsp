<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	<section>
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
				<label for="gender">성별</label>
				<input type="text" id="gender" name="gender" value="${member.gender}" />
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
	</section>
</body>
</html>