<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
</head>

<body>
	<form name='findPass' method="post" action="/member/resultPass">
		<div>
			<label for="id"></label>
			<input type="text" id="id" name="id">
		</div>

		<div>
			<label for="email"></label>
			<input type="text" id="email" name="email">
		</div>
		
		<div>
			<button type="submit">비밀번호 찾기</button>
		</div>	
	</form>
</body>
</html>