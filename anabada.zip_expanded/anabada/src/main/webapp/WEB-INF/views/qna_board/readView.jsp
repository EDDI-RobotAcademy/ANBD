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

		
		// 댓글 쓰기
		var formObj = $("form[name='replyForm']");
		
		$(".replyWriteBtn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			
			formObj.attr("action", "/qna_board/replyWrite");
			formObj.submit();
		});
		
		// 댓글 수정 저장 ajax
		$(".replyUpdate").on("click", function() {
			var qr_no = $(this).attr("data-qr_no");
			var sendData = {"qr_no": qr_no}
			
			$.ajax({
	 			url : "/qna_board/replyUpdate",
	 			type : "post",
	 			data : sendData,
	 			success : function(data) {
	 				location.href = "/qna_board/replyUpdate?q_no=${read.q_no}"
	 					+ "&page=${scri.page}"
	 					+ "&perPageNum=${scri.perPageNum}"
	 					+ "&searchType=${scri.searchType}"
	 					+ "&keyword=${scri.keyword}"
	 					+ "&qr_no=" + $(this).attr("data-qr_no");
	 				location.reload();
	 			},
	            error : function(data) {
	                alert("댓글이 수정되지 않았습니다.");
	            }
			})
		});

		
		// 댓글 유효성 검사
		function fn_valiChk() {
			var regForm = $("form[name='replyForm'] .chk").length;
			for (var i = 0; i < regForm; i++) {
				if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}

		
		// 댓글 삭제 Ajax
		$(".replyDeleteBtn").on("click", function(){
			var ans = confirm("삭제하시겠습니까?");
			var qr_no = $(this).attr("data-qr_no");
			var sendData = {"qr_no": qr_no}
			
			if (!ans) {
				return false;
			
			} else {
				$.ajax({
		 			url : "/qna_board/replyDelete",
		 			type : "get",
		 			data : sendData,
		 			success : function(data) {
		 				location.href = "/qna_board/replyDelete?q_no=${read.q_no}"
		 					+ "&page=${scri.page}"
		 					+ "&perPageNum=${scri.perPageNum}"
		 					+ "&searchType=${scri.searchType}"
		 					+ "&keyword=${scri.keyword}"
		 					+ "&qr_no=" + $(this).attr("data-qr_no");
		 				location.reload();
		 			},
		            error : function(data) {
		                alert("댓글이 삭제되지 않았습니다.");
		            }
				})
			}
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
					<label for="q_title" class="qna">이메일</label>
					<div id="email" class="qnatitle"><c:out value="${read.email}"/></div>
				</div>
				
				<div style="border-bottom: 1px solid #E0E0E0; display: flex; align-items: center;">		
					<label for="q_title" class="qna">제목</label>
					<div id="q_title" class="qnatitle"><c:out value="${read.q_title}"/></div>
				</div>
				
				<div style="border-bottom: 1px solid #E0E0E0; display: flex; align-items: center;">
					<label for="q_content" class="qna">문의 내용</label>
					<div id="q_content" class="qnacon"><p style="white-space: pre-line"><c:out value="${read.q_content}" /></p></div>
				</div>
				
				<c:if test="${member.id == 'admin'}">
				<button class="delete_btn fsize-13">삭제</button>
				</c:if>

				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList" varStatus="i">
							<input type="hidden" id="qr_no" name="qr_no" value="${replyList.qr_no}"/>
							
							<li class="replycon" style="display: flex; align-items: center;">
								<label class="qna"></label>
									<div id="qr_content" class="qnacon">
										<p style="white-space: pre-line"><c:out value="${replyList.qr_content}" /></p>
										<p style="font-size: 12px; text-align: right;">
											<fmt:formatDate value="${replyList.qr_date}" pattern="yyyy-MM-dd HH:mm" />
										</p>
										
										<div class="fsize-13">
											<c:if test="${member.id == 'admin'}">
												<button type="button" class="replyUpdateBtn btn_reset" data-qr_no="${replyList.qr_no}" id="modify${i.count}" onclick="modifyView(this.id)">수정&nbsp;</button>
												<button type="button" class="replyDeleteBtn btn_reset" data-qr_no="${replyList.qr_no}">삭제</button>
											</c:if>
										</div>
									</div>

										
								<!-- 댓글 수정창 시작 -->
									<div class="reply-update-area">
										<form name="updateForm" role="form" method="post" action="/qna_board/replyUpdate">
											<input type="hidden" name="q_no" value="${read.q_no}" />
											<input type="hidden" id="qr_no" name="qr_no" value="${replyList.qr_no}" />
											<input type="hidden" id="page" name="page" value="${scri.page}" />
											<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
											<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
											<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
									
										<div>
											<textarea class="chk reply-update" id="qr_content" name="qr_content"><c:out value="${replyList.qr_content}"></c:out></textarea>
										</div>
										
										<script>
										$('textarea').on('keyup', function (e) {
											$(this).css('height', 'auto');
											$(this).height(this.scrollHeight - 15);
										});
										</script>
							
										<div class="fsize-13">
											<button type="submit" class="replyUpdate btn_reset">수정&nbsp;</button>
											<button type="button" class="btn_reset" onclick="modifyCancle('modify${i.count}')">취소</button>
										</div>
										</form>
									</div>
								<!-- 댓글 수정창 종료 -->
							</li>
						</c:forEach>
					</ol>
				</div>

	<script type="text/javascript">
		var modifyViews = document.getElementsByClassName('reply-update-area')
	
		for (var i = 0; i < modifyViews.length; i++) {
			modifyViews[i].style.display = 'none'
		}
		
		function modifyView(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = 'none';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = '';

		}
		
		function modifyCancle(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = '';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = 'none';
			
		}
		
	</script>
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
							<textarea class="chk reply-write" id="qr_content" name="qr_content" placeholder="답변 내용을 입력해 주세요." title="내용을 입력하세요."></textarea>
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