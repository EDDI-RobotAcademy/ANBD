<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		
		// 수정
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/qna_board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("삭제하시겠습니까?");
			if (deleteYN == true) {
				formObj.attr("action", "/qna_board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
		
		// 목록
		$(".list_btn").on("click", function() {
			location.href = "/qna_board/list?page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}";
		});
		
		// 답글 쓰기
		$(".replyWriteBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/qna_board/replyWrite");
			formObj.submit();
		});
		
		// 댓글 수정 View
		$(".replyUpdateBtn").on("click", function() {
			location.href = "/qna_board/replyUpdateView?q_no=${read.q_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&qr_no=" + $(this).attr("data-qr_no");
		});

		//댓글 삭제 View
	    $(".replyDeleteBtn").on("click", function(){
			location.href = "/qna_board/replyDeleteView?q_no=${read.q_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&seachType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&qr_no=" + $(this).attr("data-qr_no");
	   });    
	});
</script>

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
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="q_no" name="q_no" value="${read.q_no}" />
				<input type="hidden" id="page" name="page" value="${scri.page}" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
			</form>
			
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
			
				<div style="border-bottom: 1px solid #E0E0E0; display: flex; align-items: center;">
					<label for="q_date" class="qna">등록일</label>
					<div class="qnatitle"><fmt:formatDate value="${read.q_date}" pattern="yyyy-MM-dd HH:mm" /></div>
				</div>
				
				<div style="border-bottom: 1px solid #E0E0E0; display: flex; align-items: center;">		
					<label for="q_title" class="qna">제목</label>
					<div id="q_title" class="qnatitle"><c:out value="${read.q_title}"/></div>
				</div>
				
				<div style="border-bottom: 1px solid #E0E0E0; display: flex; align-items: center;">
					<label for="q_content" class="qna">문의 내용</label>
					<div id="q_content" class="qnacon"><p style="white-space: pre-line"><c:out value="${read.q_content}" /></p></div>
				</div>

				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li class="replycon" style="display: flex; align-items: center;">
								<label class="qna"></label>
									<div id="qr_content" class="qnacon">
										<p style="white-space: pre-line"><c:out value="${replyList.qr_content}" /></p>
										<p style="font-size: 12px; text-align: right;">
											<fmt:formatDate value="${replyList.qr_date}" pattern="yyyy-MM-dd HH:mm" />
										</p>
										<div class="fsize-13">
											<c:if test="${member.id == 'admin'}">
												<button type="button" class="replyUpdateBtn btn_reset" data-qr_no="${replyList.qr_no}">수정</button>
												<button type="button" class="replyDeleteBtn btn_reset" data-qr_no="${replyList.qr_no}">삭제</button>
											</c:if>
										</div>
									</div>
							</li>
						</c:forEach>
					</ol>
				</div>

				<!-- 댓글 작성 -->
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="id" name="id" value="${member.id}"/>
					<input type="hidden" id="q_no" name="q_no" value="${read.q_no}" />
					<input type="hidden" id="page" name="page" value="${scri.page}" />
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
					
				<c:if test="${member.id == 'admin'}">	
					<div class="reply-write-area">
						<div>
							<textarea class="reply-write" id="qr_content" name="qr_content" placeholder="답변 내용을 입력해 주세요."></textarea>
						</div>
						
						<script>
						    $('textarea').on('keyup', function (e) {
						        $(this).css('height', 'auto');
						        $(this).height(this.scrollHeight - 15);
						    });
						</script>
						
						<div class="fsize-14">
							<button type="button" class="replyWriteBtn btn_reset">등록&nbsp;</button>
						</div>
					</div>
				</c:if>
						
					</form>
					
				<div>
					<button type="button" class="list_btn modi_btn">목록</button>
				</div>
	 		</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<div>
		<%@ include file="../includes/footer.jsp" %>
	</div>
</body>
</html>