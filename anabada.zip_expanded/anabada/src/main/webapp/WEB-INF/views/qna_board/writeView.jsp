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
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".ask_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}

			formObj.attr("action", "/qna_board/write");
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
				<form name="writeForm" method="post" action="/qna_board/write">
					<input type="hidden" id="id" name="id" value="${member.id}" readonly="readonly" />
					
					<table style="margin: 0 auto;">
						<tbody>
							<c:if test="${member.id != null}">
								<div class="stitle">
									1:1 문의 접수
								</div>
								
									<tr>
										<td>
											<label for="q_title" class="ask">제목</label>
											<input type="text" id="q_title" name="q_title" class="chk asktitle" title="제목을 입력하세요." />
										</td>
									</tr>
		
									<tr>
										<td>
											<div><label for="q_content" class="askmid">문의 내용</label></div>
											<textarea id="q_content" name="q_content" class="chk askcon" title="내용을 입력하세요."></textarea>
										</td>
									</tr>
									
									<tr>
										<td>
											<label for="email" class="ask">이메일</label>
											<input type="text" id="email" name="email" class="asktitle" value="${member.email}" />
										</td>
									</tr>
		
									<tr>
										<td>
											<button class="ask_btn" type="submit">문의하기</button>
										</td>
									</tr>
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