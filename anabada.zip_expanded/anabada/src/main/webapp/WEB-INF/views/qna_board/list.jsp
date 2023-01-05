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
			<div class="sidemenu2">
				<p class="side-t">고객센터</p>
				<ul class="side-ul">
					<li class="side-li"><a href="/help_board/list">자주 묻는 질문</a></li>
				</ul>
				
				<br>
				<p class="side-t">1:1 문의</p>
				<ul class="side-ul">
					<li class="side-li">
						<c:if test="${member.id == null}">
							<a href="/member/login">1:1 문의 접수</a>
						</c:if>
						<c:if test="${member.id != null}">
							<a href="/qna_board/writeView">1:1 문의 접수</a>
						</c:if>
					</li>
					<li class="side-li">
						<c:if test="${member.id == null}">
							<a href="/member/login">1:1 문의 내역</a>
						</c:if>
						<c:if test="${member.id != null}">
							<a href="/qna_board/list">1:1 문의 내역</a>
						</c:if>
					</li>
				</ul>
			</div>
			
			<div class="minicon">
				<div class="stitle">
					1:1 문의 내역
				</div>
				
				<div style="text-align: right;">
					<a class="mtm_btn" href="/qna_board/writeView">1:1 문의하기</a>
				</div>
			
				<form role="form" method="get">
					<!-- 목록 -->
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">작성자</th>
								<th scope="col" class="th-date">등록일</th>
							</tr>
						</thead>
						
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.q_no}" /></td>
								<td style="text-align: left;">
									<a href="/qna_board/readView?q_no=${list.q_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
										<c:out value="${list.q_title}" />
									</a>
								</td>
								<td><c:out value="${list.id}" /></td>
								<td><fmt:formatDate value="${list.q_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
					
					<div>
				      <ul class="pagination">
				         <c:if test="${pageMaker.prev }">
				            <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1 )}">이전</a></li>
				         </c:if>
				                     
				         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				            <li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>>
				               <a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
				            </li>
				         </c:forEach>
				                  
				         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
				            <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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