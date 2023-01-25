<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.container {
	width: 100%;
  	min-width: 1000px;
  	max-width: 1000px;
  	margin: 0 auto 0 auto;
}
.mcont {
 	margin: 0 auto;
  	padding: 15px 20px 50px 20px;
 	box-sizing: border-box;
}
</style>
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js""></script>
<script type="text/javascript">

	/* 게시글 수정, 삭제 스크립트 */
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		$(".update_btn").on("click", function() {
				formObj.attr("action", "/a_board/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			})
			
			$(".delete_btn").on("click", function() {
				var deleteYN = confirm("삭제 하시겠습니까?");
				if(deleteYN == true) {
					formObj.attr("action", "/a_board/delete");
					formObj.attr("method", "get");
					formObj.submit();
				}
			})
			
		$(".list_btn").on("click", function() {
			location.href = "/a_board/list?page=${scri.page}" + "&perPageNum=${scri.perPageNum}" + 
					"&searchType=${scri.searchType}" + "&keyword=${scri.keyword}";
		});
	});
	
	/* 게시글 신고 스크립트 */
	$(document).ready(function() {
	var button = document.querySelector('.report_btn');
		
		button.addEventListener("click", function() {
			var id = "${id}";
			
			if(id == "") {
				alert("로그인 후 신고하실 수 있습니다.");
			}
			else {
			window.open("/a_board/report?a_bno=${read.a_bno}", "신고", "width=400, height=600, left=0, top=0");
			}
		});
	});
	/* 신고 스크립트 끝 */
	
	
	/* 좋아요 스크립트 */
	$(document).ready(function() {
		
		var likeVal = ${Chk};
		
		if(likeVal > 0) {
			$("#heart").on("click", function() {
			$.ajax ({
				url: '/a_board/deleteLike',
				type: 'POST',
				dataType: 'text',				
				data: ({'id': '${sessionScope.id}', 'a_bno': '${read.a_bno}' }),
				success: function(data) {
					alert("좋아요 취소 성공");
					$("#heart").attr("src", "<c:url value='/images/clear.png'/>");
					location.reload();
				}
			});
		});
		} else {
			$("#clear").on("click", function() {
			$.ajax ({
				url: '/a_board/insertLike',
				type: 'POST',
				dataType: 'text',				
				data: ({'id': '${sessionScope.id}', 'a_bno': '${read.a_bno}' }),
				success: function(data) {
					alert("좋아요 성공");
					$("#clear").attr("src", "<c:url value='/images/heart.png'/>");
					location.reload();
				}
			});
		});
	}
});
	/* 좋아요 스크립트 끝 */
	
	
	/* 좋아요 로그인 유효성 검사 */
	$(function() {
		$(".like").on("click", function() {
			var id = "${id}";
			
			if(id == "") {
				alert("로그인 후 이용 가능합니다.");
			}
		});
	});
	/* 좋아요 로그인 유효성 검사 끝 */
	
	
	/* 댓글 작성, 수정, 삭제 스크립트 */
	$(function() {
		var replybtn = $("form[name='replyForm']");
	$(".write_btn").on("click", function() {
		replybtn.attr("action", "/a_board/replyWrite");
		replybtn.submit();
	});
	
	$(".replyupdate").on("click", function(el) {
		var target = $(el.target).parents("div");
		$($(target).children(".replysave")).css("display", "inline");
		$($(target).children(".replyreset")).css("display", "inline");
		$($(target).children(".r_content2")).css("display", "inline");
		$($(target).children(".replyupdate")).css("display", "none");
		$($(target).children(".r_content")).css("display", "none");
		$($(target).children(".replydelete")).css("display", "none");
		
		console.log( $(target).children(".r_content").val());
		$($(target).children(".r_content2")).val($(target).children(".r_content").val());
		
	});
	
	$(".replyreset").on("click", function(el) {
		var target = $(el.target).parents("div");
		$($(target).children(".replysave")).css("display", "none");
		$($(target).children(".replyreset")).css("display", "none");
		$($(target).children(".r_content2")).css("display", "none");
		$($(target).children(".replyupdate")).css("display", "inline");
		$($(target).children(".r_content")).css("display", "inline");
		$($(target).children(".replydelete")).css("display", "inline");
	});
	
	$(".replysave").on("click", function(el) {
		var target = $(el.target).parents("div");
		$($(target).children(".replysave")).css("display", "none");
		$($(target).children(".replyreset")).css("display", "none");
		$($(target).children(".r_content2")).css("display", "none");
		$($(target).children(".replyupdate")).css("display", "inline");
		$($(target).children(".r_content")).css("display", "inline");
		$($(target).children(".replydelete")).css("display", "inline");
		
		var rno = $(el.target).attr("data-rno");
		console.log(rno);
		 $.ajax ({
			url:"/a_board/replyUpdate", 
			type:"POST",
			data:{"r_content":$(target).children(".r_content2").val(), "r_rno": $(el.target).attr("data-rno")},
			success:function(data) {
				alert("댓글 수정 완료");
				location.reload();
			}
		}); 
		
	});
	//function()에 적힌 값은, 클릭했을 때 a의 정보(이벤트)를 가져오기 위해 적어줌
	//a.target은 a의 엘리먼트(태그값)들을 전부 가져온다는 뜻이다.
	// /를 붙이면 절대경로, 상대경로로 쓰려면 그냥 주소값만 적어주면 된다.
	// 위에서 가져온 a의 엘리먼트 값들 중 "data-rno"를 변수 rno에 담아서 가져옴
	$(".replydelete").on("click", function(el) {
		 var rno = $(el.target).attr("data-rno");
		 var bno = $(el.target).attr("data-bno");
		 alert("댓글이 삭제되었습니다.");
		$(location).attr("href", "replyDelete?rno="+rno+"&bno="+bno);
	});
	
	/* 댓글 관련 스크립트 끝 */
});
</script>
</head>
<body>
<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/header.jsp"/>
</div>
	<!-- 게시글 -->
	<section class="container">
	<div class="mcont">
	<form name="readForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
	</form>
	
		<div>
			<label for="nick" class="form-label">작성자</label>
			<input type="text" id="nick" name="nick" class="form-control" value="${read.nick}" readonly/>
		</div>
		
		<br>
		
		<div>
			<label for="a_title" class="form-label">제목</label>
			<input type="text" id="a_title" name="a_title" class="form-control" value="${read.a_title }" readonly/> 
		</div>
		
		<br>
		
		<div>
			<label for="a_content" class="form-label">내용</label>
			<textarea id="a_content" name="a_content" readonly><c:out value="${read.a_content }"/></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('a_content', {filebrowserUploadUrl: '/a_board/fileUpload', width:930, height:300});
			</script>
		</div>
	
	<!-- 게시글 끝 -->
	<br>
	
		<!-- 좋아요 -->
		<div class="like">
		<c:choose>
			<c:when test="${read.a_like_cnt == 0}"> 
				<img id="clear" src="<c:url value='/images/clear.png'/>" style="width:50px; height:50px;"/>
	 		</c:when>
			<c:otherwise>  
 				<img id="heart" src="<c:url value='/images/heart.png'/>" style="width:50px; height:50px;"/> 
	 		</c:otherwise>
		</c:choose> 
		
		<!-- 좋아요 개수 표시 -->
		<span><c:out value="${read.a_like_cnt}"/></span>
		</div>
		
		
		<!-- 게시글 수정, 삭제, 목록, 신고 -->
		<div style="text-align:right;">
			<c:if test="${read.id eq id }">
				<button type="button" class="update_btn">수정</button> &nbsp;
				<button type="button" class="delete_btn">삭제</button> &nbsp;
			</c:if>
			<button type="button" class="list_btn">목록</button> &nbsp;
			<button type="button" class="report_btn">신고</button>
		</div>
	
	<hr>
	
	<!-- 댓글 -->
	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${replyList }" var="replyList">
				<li>
					<%-- <p>
					작성자 : ${replyList.id }<br>
				 	작성 날짜 : <fmt:formatDate value="${replyList.r_regdate }" pattern="yyyy-MM-dd"/>
				 	</p>
					<p>${replyList.r_content }</p> --%>
				 	<div>
				 		<input type="text" class="id" value="${replyList.nick }" readonly/>
				 		<input type="date" value="<fmt:formatDate value='${replyList.r_regdate }' pattern='yyyy-MM-dd'/>" readonly/>
				 		<input type="text" class="r_content" value="${replyList.r_content }" readonly/>
				 		
				 		<input type="text" class="r_content2" name="r_content2" value="${replyList.r_content }" style="display:none"/>
				 		<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replysave" style="display:none">저장</button>
				 		<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyreset"style="display:none">취소</button>
				 		
				 		<c:if test="${replyList.id eq id }">
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replyupdate">수정</button>
				 			<button type="button" data-rno="${replyList.r_rno }" data-bno="${replyList.a_bno }" class="replydelete">삭제</button>
				 		</c:if>
				 	</div>
				 </li>
			</c:forEach>
		</ol>
	</div>
	
	<form name="replyForm" method="post" role="form">
		<input type="hidden" id="a_bno" name="a_bno" value="${read.a_bno }"/>
		<input type="hidden" id="page" name="page" value="${scri.page }"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
		<input type="hidden" id="cateType" name="cateType" value="${scri.cateType }"/>
		
		<div>
			<label for="nick">작성자</label>
			<input type="hidden" id="id" name="id" value="${id }"/>
			<input type="text" id="nick" name="nick" value="${member.nick }" readonly/>
			<label for="r_content">내용</label>
			<input type="text" id="r_content" name="r_content"/>
		
			<c:if test="${id != null }">
				<button type="button" class="write_btn">작성</button>
			</c:if>
			<c:if test="${id == null }">
				<span>로그인 후 댓글을 작성하실 수 있습니다.</span>
			</c:if>
		</div>
	</form>
	<!-- 댓글 끝 -->
</div>
</section>
<div>
	<jsp:include page="../includes/footer.jsp" />
</div>
</body>
</html>