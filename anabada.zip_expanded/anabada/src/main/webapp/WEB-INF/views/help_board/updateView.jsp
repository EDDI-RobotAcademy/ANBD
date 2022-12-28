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
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/help_board/list?h_no=${update.h_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${searchType}"
					+ "&keywrod=${scri.keyword}";
		});
	});
	
	function addBoard() {
		var formObj = $("form[name='updateForm']");
		var contents = CKEDITOR.instances.h_content.getData();

		if (document.updateForm.h_title.value == "") {
			alert("제목을 입력하세요.");
			return false;

		} else if (contents == "") {
			alert("내용을 입력하세요.");
			return false;

		} else {
			formObj.attr("action", "/help_board/update");
			formObj.attr("method", "post");
			formObj.submit();
		}
		return true;
	}
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
				<form name="updateForm" role="form" method="post" action="/help_board/update">
					<input type="hidden" name="h_no" value="${update.h_no}" readonly="readonly" />
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="" value="${scri.keyword}">
					
					<table>
						<tbody>
							<tr>
								<td>
									<input type="text" id="h_title" name="h_title" class="cktitle chk" value="${update.h_title}" pattern=".{2, 50}" placeholder="제목" required/>
								</td>
							</tr>
							
							<tr>
								<td>
									<textarea id="h_content" name="h_content" class="chk" required><c:out value="${update.h_content}"/></textarea>
									<script type="text/javascript">
													CKEDITOR.replace('h_content', {
														width: 760,
														height : 500
													});
									</script>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="right">
						<a class="btfsize-13" href="javascript:addBoard()">수정</a>
						<button type="button" class="cancel_btn btfsize-13">취소</button>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>