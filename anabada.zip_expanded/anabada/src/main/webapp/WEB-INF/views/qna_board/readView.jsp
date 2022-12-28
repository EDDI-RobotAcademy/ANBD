<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
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
		$(".replyDeleteBtn").on("click", function() {
			location.href = "/qna_board/replyUpdateView?q_no=${read.q_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&qr_no=" + $(this).attr("data-qr_no");
		});
		
		// 댓글 삭제 View
		$(".replyDeleteBtn").on("click", function() {
			location.href = "/qna_board/replyDeleteView?q_no=${read.q_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&qr_no=" + $(this).attr("data-qr_no");
		});
	});
</script>

<body>
	<div>
		<section>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="q_no" name="q_no" value="${read.q_no}" />
				<input type="hidden" id="page" name="page" value="${scri.page}" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
			</form>
			
			<div>
				<label for="q_title">제목</label>
				<input type="text" id="q_title" name="q_title" value="${read.q_title}" readonly="readonly" />
			</div>
			
			<div>
				<label for="id">작성자</label>
				<input type="text" id="id" name="id" value="${read.id}" readonly="readonly" />
			</div>
			
			<div>
				<label for="q_date">작성일</label>
				<fmt:formatDate value="${read.q_date}" pattern="yyyy-MM-dd" />
			</div>
			
			<div>
				<label for="q_content">내용</label>
				<textarea id="q_content" name="q_content" readonly="readonly"><c:out value="${read.q_content}" /></textarea>
			</div>
			
			<div>
				<button type="button" class="update_btn">수정</button>
				<button type="button" class="delete_btn">삭제</button>
				<button type="button" class="list_btn">목록</button>
			</div>
			
			<!-- 댓글 -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p>
								작성자: ${replyList.id}<br/>
								작성일: <fmt:formatDate value="${replyList.qr_date}" pattern="yyyy-MM-dd"/>
							</p>
							
							<p>${replyList.qr_content}</p>
							
							<div>
								<button type="button" class="replyUpdateBtn" data-qr_no="${replyList.qr_no}">수정</button>
								<button type="button" class="replyDeleteBtn" data-qr_no="${replyList.qr_no}">삭제</button>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>
			
			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="q_no" name="q_no" value="${read.q_no}" />
				<input type="hidden" id="page" name="page" value="${scri.page}" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
			
				<div>
					<label for="id">댓글 작성자</label>
					<div>
						<input type="text" id="id" name="id" />
					</div>
				</div>
			
				<div>
					<label for="qr_content">댓글 내용</label>
					<div>
						<input type="text" id="qr_content" name="qr_content" />
					</div>
				</div>
			
				<div>
					<div>
						<button type="button" class="replyWriteBtn">작성</button>
					</div>
				</div>	
			</form>
		</section>
	</div>
</body>
</html>