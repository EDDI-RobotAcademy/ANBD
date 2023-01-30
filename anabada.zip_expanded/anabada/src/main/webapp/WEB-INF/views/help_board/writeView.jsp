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
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	function addBoard() {
		var formObj = $("form[name='writeForm']");
		var contents = CKEDITOR.instances.h_content.getData();

		if (document.writeForm.h_title.value == "") {
			alert("제목을 입력하세요.");
			return false;

		} else if (contents == "") {
			alert("내용을 입력하세요.");
			return false;

		} else {
			formObj.attr("action", "/help_board/write");
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
		<%@ include file="../includes/helpHeader.jsp" %>
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
				<form name="writeForm" method="post" action="/help_board/write">
					<input type="hidden" id="id" name="id" value="${member.id}" readonly="readonly" />
					
					<table>
						<tbody>
							<c:if test="${member.id == 'admin'}">
								<tr>
									<td>
										<input type="text" id="h_title" name="h_title" class="cktitle" placeholder="제목" required/>
									</td>
								</tr>
	
								<tr>
									<td>
										<textarea id="h_content" name="h_content"></textarea>
										<script type="text/javascript">
													CKEDITOR.replace('h_content', {
														width: 760,
														height : 500
													});
										</script>
									</td>
								</tr>
	
								<tr>
									<td style="text-align: right;">
										<a class="fsize-13" href="javascript:addBoard()">등록</a>
									</td>
								</tr>
							</c:if>
							
							<c:if test="${member.id != 'admin'}">
								<p>관리자만 접근할 수 있습니다.</p>
							</c:if>
						</tbody>
					</table>
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