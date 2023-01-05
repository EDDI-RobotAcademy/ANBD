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
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function() {
			location.href = "/qna_board/readView?q_no=${replyUpdate.q_no}"
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
			<form name="updateForm" role="form" method="post" action="/qna_board/replyUpdate">
				<input type="text" name="q_no" value="${replyUpdate.q_no}" readonly="readonly" />
				<input type="text" id="qr_no" name="qr_no" value="${replyUpdate.qr_no}" />
				<input type="text" id="page" name="page" value="${scri.page}" />
				<input type="text" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
				<input type="text" id="searchType" name="searchType" value="${scri.searchType}" />
				<input type="text" id="keyword" name="keyword" value="${scri.keyword}" />
				
				<table>
					<tbody>
						<tr>
							<td>
								<label for="qr_content">댓글 내용</label>
								<input type="text" id="qr_content" name="qr_content" value="${replyUpdate.qr_content}" />
							</td>
						</tr>
					</tbody>
				</table>
				
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>