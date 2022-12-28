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
		var formObj = $("form[name='deleteForm']");
		
		$(".cancel_btn").on("click", function() {
			location.href = "/qna_board/readView?q_no=${replyDelete.q_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}";
		});
	});
</script>

<body>
	<div>
		<section>
			<form name="deleteForm" role="form" method="post" action="/qna_board/replyDelete">
				<input type="hidden" name="q_no" value="${replyDelete.q_no}" readonly="readonly" />
				<input type="hidden" id="qr_no" name="qr_no" value="${replyUpdate.qr_no}" />
				<input type="hidden" id="page" name="page" value="${scri.page}" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
				
				<div>
					<p>삭제하시겠습니까?</p>
					<button type="submit" class="delete_btn">예. 삭제합니다.</button>
					<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>