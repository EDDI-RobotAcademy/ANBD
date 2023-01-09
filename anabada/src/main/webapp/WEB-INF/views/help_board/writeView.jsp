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
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}

			formObj.attr("action", "/help_board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})

	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>

<body>
	<div>
		<section>
			<form name="writeForm" method="post" action="/help_board/write">
				<table>
					<tbody>
						<c:if test="${member.id != null}">
							<tr>
								<td>
									<label for="h_title">제목</label>
									<input type="text" id="h_title" name="h_title" title="제목을 입력하세요." />
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="id">작성자</label>
									<input type="text" id="id" name="id" value="${member.id}" />
								</td>
							</tr>

							<tr>
								<td>
									<label for="h_content">내용</label>
									<textarea id="h_content" name="h_content" title="내용을 입력하세요."></textarea>
								</td>
							</tr>

							<tr>
								<td>
									<button class="write_btn" type="submit">글쓰기</button>
								</td>
							</tr>
						</c:if>
						
						<c:if test="${member.id == null}">
							<p>로그인 후 작성할 수 있습니다.</p>
						</c:if>
					</tbody>
				</table>
			</form>
		</section>
	</div>
</body>
</html>