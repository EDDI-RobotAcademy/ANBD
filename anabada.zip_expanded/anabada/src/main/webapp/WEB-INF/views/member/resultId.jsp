<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
</head>

<body>
	<div class="text-center">
		회원님의 아이디는
        <c:choose>                                                                          
            <c:when test="${empty vo}">                                                 
                <p>조회 결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p>${vo.id}</p>                                              
            </c:otherwise>                                                                    
        </c:choose>                                                                         
	</div>   
</body>
</html>