<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	나오냐
	<c:forEach items="${blist}" var="blist">		
		<div><c:out value="${blist.a_no}" /></div>
		<div><img width="500px;" height="300px;" src="${blist.a_file}" /></div>
	</c:forEach>
</body>
</html>