<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		// 목록 이동
		$(".cancle").on("click", function() {
			location.href = "/";
		})

		// 유효성 검사
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해 주세요.");
				$("#id").focus();
				return false;
			}

			if ($("#pass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#pass").focus();
				return false;
			}

			if ($("#name").val() == "") {
				alert("이름을 입력해 주세요.");
				$("#name").focus();
				return false;
			}

			if ($("#nick").val() == "") {
				alert("닉네임을 입력해 주세요.");
				$("#nick").focus();
				return false;
			}

			if ($("#gender").val() == "") {
				alert("성별을 선택해 주세요.");
				$("#gender").focus();
				return false;
			}
			

			if ($("#tel").val() == "") {
				alert("전화번호를 입력해 주세요.");
				$("#tel").focus();
				return false;
			}

			if ($("#email").val() == "") {
				alert("이메일을 입력해 주세요.");
				$("#email").focus();
				return false;
			}

			if ($("#loca").val() == "") {
				alert("지역을 선택해 주세요.");
				$("#loca").focus();
				return false;
			}
		});
	});
</script>
</head>

<body>
	<section>
		<form action="/member/register" method="post">
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" />
			</div>
			
			<div>
				<label for="pass">비밀번호</label>
				<input type="password" id="pass" name="pass" />
			</div>
			
			<div>
				<label for="name">이름</label>
				<input type="text" id="name" name="name" />
			</div>
			
			<div>
				<label for="nick">닉네임</label>
				<input type="text" id="nick" name="nick" />
			</div>
			
			<div>
				<label for="tel">휴대폰 번호</label>
				<input type="text" id="tel" name="tel" />
			</div>
			
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" />
			</div>
			
			<div>
				<label for="loca">지역</label>
				<input type="text" id="loca" name="loca" />
			</div>
			
			<div>
				<button type="submit" id="submit">회원가입</button>
				<button type="button" class="cancle">돌아가기</button>
			</div>	
		</form>
	</section>
</body>
</html>