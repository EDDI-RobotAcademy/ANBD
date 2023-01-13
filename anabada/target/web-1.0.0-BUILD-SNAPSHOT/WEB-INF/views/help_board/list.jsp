<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>

<body>
	<div>
		<section>
			<form role="form" method="get">
				<!-- 검색 -->
				<div>
					<div>
						<select name="searchType">
							<option value="tc"
								<c:out value="${scri.searchType eq 'all' ? 'selected' : ''}" />>전체 검색</option>
						</select>
					</div>
				</div>
				
				<div>
					<div>
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}">
						<button id="searchBtn" type="button">검색</button>
					</div>
				</div>
				
				<script>
					$(function() {
						$('#searchBtn').click(function() {
							self.location = "list" + '${pageMaker.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						});
					});
				</script>
				
				<!-- 목록 -->
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.h_no}" /></td>
							<td>
								<a href="/help_board/readView?h_no=${list.h_no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.h_title}" /></a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이지 -->
				<div>
					<c:if test="${pageMaker.prev}">
						<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
					</c:if>
						
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<c:out value="${pageMaker.cri.page == idx ? 'class = info' : ''}" />
					</c:forEach>
						
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="list${pageMaker.makeSearch(pageMaker.engPage + 1)}">다음</a>
					</c:if>
				</div>
				
				<!-- 작성 -->
				<div>
					<a href="/help_board/writeView">글쓰기</a>
				</div>
			</form>
		</section>
	</div>
</body>
</html>