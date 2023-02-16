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

<body>
	<!-- 네비바 -->
	<div>
		<%@ include file="../includes/nav.jsp" %>
	</div>

	<!-- 헤더 -->
	<div>
		<%@ include file="../includes/miniHeader.jsp" %>
	</div>
	
	<div>
		<section class="container">
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/includes/myPageHeader.jsp" />
		
			<div class="minicon">
				<div class="stitle">
					회원 목록
				</div>
			
				<form role="form" method="get">
					<!-- 목록 -->
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">닉네임</th>
								<th scope="col">휴대번호</th>
								<th scope="col">이메일</th>
								<th scope="col">레벨</th>
								<th scope="col">경고</th>
							</tr>
						</thead>
			
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.id}"/></td>
								<td><c:out value="${list.name}"/></td>
								<td><c:out value="${list.nick}"/></td>
								<td><c:out value="${list.tel}"/></td>
								<td><c:out value="${list.email}"/></td>
								<td><c:out value="${list.lev}"/></td>
								<td><c:out value="${list.caution}"/></td>
							</tr>
						</c:forEach>
					</table>
					
					<div>
				      <ul class="mtm-pagination">
				         <c:if test="${pageMaker.prev }">
				            <li><a href="memberListView${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a></li>
				         </c:if>
				         
				         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				            <li class="list" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>>
				               <a href="memberListView${pageMaker.makeSearch(idx)}">${idx}</a>
				            </li>
				         </c:forEach>
				                  
				         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
				            <li><a href="memberListView${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				         </c:if>
				      </ul>
				   </div>
				</form>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>