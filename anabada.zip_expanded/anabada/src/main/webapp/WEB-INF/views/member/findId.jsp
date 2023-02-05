<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
</head>

<body>
	<form name='findId' method="post" action="/member/resultId">
		<div>
			<label for="email">메일</label>
			<input type="text" id="email" name="email">
		</div>

		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name">
		</div>
		
		<div>
			<button type="submit">아이디 찾기</button>
		</div>	
	</form>
</body>
</html>