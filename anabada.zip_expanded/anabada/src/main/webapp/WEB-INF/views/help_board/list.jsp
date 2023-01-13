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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<form role="form" method="get">
					<p class="mayihelp">
						무엇을 도와드릴까요?<br>
						<b>아나바다 고객센터</b>입니다.
					</p>
					<div class="helpy" style="background-color: #F9F9F9;">
						
					<!-- 검색 -->
						<div>
							<div>
								<div class="fnq-sbox">
									<input type="text" name="keyword" id="keywordInput" class="fnq-in" value="${scri.keyword}" placeholder="질문을 검색해 보세요" />
									<button id="searchBtn" class="fnq-but" type="button" value="all" <c:out value="${scri.searchType eq 'all' ? 'clicked' : ''}" />>검색</button>
								</div>
							</div>
								
							<script>
								$(function() {
									$('#searchBtn').click(function() {
										self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=all" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
									});
								});
							</script>
						</div>
					</div>
					
					<!-- 목록 -->
					<div class="fnq">자주 묻는 질문</div>
					
					<div id="Accordion_wrap">
						<c:forEach items="${list}" var="list">		
							<div class="que">
								&nbsp;<c:out value="${list.h_title}" />
							</div>
								
							<div class="anw"><c:out value="${list.h_content}" escapeXml="false"/>
								
								<div class="fsize-13">
									<c:if test="${member.id == 'admin'}">
										<a href="/help_board/updateView?h_no=${list.h_no}">수정&nbsp;</a>
										<a href="/help_board/delete?h_no=${list.h_no}">삭제</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<script type="text/javascript">
						$(".que").click(function() {
							$(this).next(".anw").stop().slideToggle(300);
							$(this).toggleClass('on').siblings().removeClass('on');
							$(this).next(".anw").siblings(".anw").slideUp(300);
						});
					</script>
					
					<div class="fsize-13-w">
						<c:if test="${member.id == 'admin'}">
							<a href="/help_board/writeView">글쓰기</a>
						</c:if>
					</div>
					
					<div>
				      <ul class="mtm-pagination">
				         <c:if test="${pageMaker.prev }">
				            <li><a href="list${pageMaker.makeSearch(pageMaker.startPage -1 )}">이전</a></li>
				         </c:if>
				                     
				         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				            <li class="list" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }"/>>
				               <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				            </li>
				         </c:forEach>
				                  
				         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
				            <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				         </c:if>
				      </ul>
					</div>
					
					<div style="height: 80px;"></div>
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