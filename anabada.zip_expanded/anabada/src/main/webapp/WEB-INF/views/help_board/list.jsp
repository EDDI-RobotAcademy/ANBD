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
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})
	});
</script>
</head>

<body>
	<!-- 네비바 -->
	<nav class="navbar">
		<form class="container" name='homeForm' method="post" action="/member/login">
			<c:if test="${id == null}">
					<div class="nav-right">
						<ul class="profile">
							<li class="pro-li"><a href="/member/login">로그인</a></li>
							<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
						</ul>
					</div>
			</c:if>
				
			<c:if test="${id != null}">
				<div class="nav-right">
					<ul class="profile">
						<li class="pro-li"><a href="/note/note_list">쪽지</a></li>
						<li class="pro-li"><a href="/member/myPage"><b>${member.nick}</b> 님</a></li>
						<li class="pro-li"><a href="/member/logout">로그아웃</a></li>
						<li class="pro-li"><a href="/help_board/list">고객센터</a></li>
						<c:if test="${member.id == 'admin'}">
							<li class="pro-li"><a href="http://localhost:8081/complaint-all-view/">신고게시글</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
		</form>
	</nav>
	
	<div style="min-width: 1000px; width: 100%; border-bottom: 1px solid #f1f2f5;"></div>
	<!-- 네비바 끝 -->
		
	<div>
		<section>
			<form role="form" method="get">
				<div class="helpy" style="background-color: #F9F9F9;">
					<p class="mayihelp">
						아나바다 고객센터
					</p>
					<p class="mayihelpu">
					궁금한 점은 검색으로 쉽고 빠르게 확인하세요.
					</p>
						
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
				
				<div style="min-width: 1000px; width: 100%; border-bottom: 1px solid #f1f2f5;"></div>
					
				<div class="help_container">
					<!-- 메뉴 -->
					<div style="float: left;">
						<p class="fnq">1:1 문의</p>
						
						<div class="my-page">
							<div class="menu-box">
								<div class="icon-box">
									<c:if test="${member.id == null}">
										<a href="/member/login"><img src="<c:url value='/images/help_qnaWrite.png'/>" style="width: 62px; height: 62px;">
											<p style="margin-top: 5px; font-size: 12px;">1:1 문의 접수</p>
										</a>
									</c:if>
									
									<c:if test="${member.id != null}">
										<a href="/qna_board/writeView"><img src="<c:url value='/images/help_qnaWrite.png'/>" style="width: 62px; height: 62px;">
											<p style="margin-top: 5px; font-size: 12px;">1:1 문의 접수</p>
										</a>
									</c:if>
								</div>
								
								<div style="float: left; height: 87px; border-right: 1px solid #ececec;"></div>
								
								<div class="icon-box">
									<c:if test="${member.id == null}">
										<a href="/member/login"><img src="<c:url value='/images/help_qnaList.png'/>" style="width: 62px; height: 62px;">
											<p style="margin-top: 5px; font-size: 12px;">1:1 문의 내역</p>
										</a>
									</c:if>
									
									<c:if test="${member.id != null}">
										<a href="/qna_board/list"><img src="<c:url value='/images/help_qnaList.png'/>" style="width: 62px; height: 62px;">
											<p style="margin-top: 5px; font-size: 12px;">1:1 문의 내역</p>
										</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					
					<div style="float: left; margin-left: 45px;">
						<p class="fnq">계정 관리</p>
						
						<div class="my-page">
							<div class="menu-box">
								<div class="icon-box">
									<a href="/member/findId"><img src="<c:url value='/images/help_findId.png'/>" style="width: 62px; height: 62px;">
										<p style="margin-top: 5px; font-size: 12px;">아이디 찾기</p>
									</a>
								</div>
								
								<div style="float: left; height: 87px; border-right: 1px solid #ececec;"></div>
								
								<div class="icon-box">
									<a href="/member/findPass"><img src="<c:url value='/images/help_findPass.png'/>" style="width: 62px; height: 62px;">
										<p style="margin-top: 5px; font-size: 12px;">비밀번호 재설정</p>
									</a>
								</div>
							</div>
						</div>
					</div>
					
					<div style="clear: both;"></div>
				
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
				</div>
			</form>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>